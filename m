From: <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Subject: [PATCH 1/5] dt-bindings: media: Add document file for CXD2880 SPI I/F
Date: Thu, 6 Apr 2017 16:54:33 +0900
Message-ID: <1491465273-9338-1-git-send-email-Yasunari.Takiguchi@sony.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>, Masayuki Yamamoto <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>, Hideki Nozawa <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>, Kota Yonezawa <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>, Toshihiko Matsumoto <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>, Satoshi Watanabe <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>

This is the document file for Sony CXD2880 DVB-T2/T tuner + demodulator.
It contains the description of the SPI adapter binding.

Signed-off-by: Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Masayuki Yamamoto <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Hideki Nozawa <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Kota Yonezawa <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Toshihiko Matsumoto <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Satoshi Watanabe <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>
---
 .../devicetree/bindings/media/spi/sony-cxd2880.txt |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt

diff --git a/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt b/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt
new file mode 100644
index 0000000..fc5aa26
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt
@@ -0,0 +1,14 @@
+Sony CXD2880 DVB-T2/T tuner + demodulator driver SPI adapter
+
+Required properties:
+- compatible: Should be "sony,cxd2880".
+- reg: SPI chip select number for the device.
+- spi-max-frequency: Maximum bus speed, should be set to <55000000> (55MHz).
+
+Example:
+
+cxd2880@0 {
+	compatible = "sony,cxd2880";
+	reg = <0>; /* CE0 */
+	spi-max-frequency = <55000000>; /* 55MHz */
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
