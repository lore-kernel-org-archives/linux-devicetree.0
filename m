From: <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Subject: [PATCH v5 01/12] [dt-bindings] [media] Add document file for CXD2880 SPI I/F
Date: Thu, 18 Jan 2018 17:43:51 +0900
Message-ID: <20180118084351.20874-1-Yasunari.Takiguchi@sony.com>
References: <20180118084016.20689-1-Yasunari.Takiguchi@sony.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180118084016.20689-1-Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org, Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org, Hideki.Nozawa-7U/KSKJipcs@public.gmane.org, Kota.Yonezawa-7U/KSKJipcs@public.gmane.org, Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org, Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org
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
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

No change since version 1.

 .../devicetree/bindings/media/spi/sony-cxd2880.txt         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt

diff --git a/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt b/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt
new file mode 100644
index 000000000000..fc5aa263abe5
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
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
