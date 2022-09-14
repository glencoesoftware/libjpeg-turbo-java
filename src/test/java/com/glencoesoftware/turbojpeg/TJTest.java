package com.glencoesoftware.turbojpeg;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.scijava.nativelib.NativeLibraryUtil;
import org.libjpegturbo.turbojpeg.TJ;
import org.libjpegturbo.turbojpeg.TJDecompressor;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class TJTest {


  @Test
  public void testRead() throws Exception {
    NativeLibraryUtil.loadNativeLibrary(TJ.class, "turbojpeg");

    Path jpeg = Paths.get(this.getClass().getResource("200px.jpg").toURI());
    byte[] data = Files.readAllBytes(jpeg);

		int pixelType = TJ.PF_RGB;
		int pixelSize = TJ.getPixelSize(pixelType);

		TJDecompressor decoder = new TJDecompressor(data);
    int width = decoder.getWidth();
    int height = decoder.getHeight();
    assertEquals(width, height);
    assertEquals(width, 200);
		byte[] decompressed = decoder.decompress(width, width * pixelSize,
			height, pixelType, pixelType);

    assertEquals(decompressed.length, width * height * pixelSize);
  }

}
