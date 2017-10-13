From: <Yasunari.Takiguchi@sony.com>
Subject: [PATCH v4 01/12] [dt-bindings] [media] Add document file for CXD2880 SPI I/F
Date: Fri, 13 Oct 2017 14:58:00 +0900
Message-ID: <20171013055800.21045-1-Yasunari.Takiguchi@sony.com>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
Sender: linux-media-owner@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: tbird20d@gmail.com, frowand.list@gmail.com, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Masayuki Yamamoto <Masayuki.Yamamoto@sony.com>, Hideki Nozawa <Hideki.Nozawa@sony.com>, Kota Yonezawa <Kota.Yonezawa@sony.com>, Toshihiko Matsumoto <Toshihiko.Matsumoto@sony.com>, Satoshi Watanabe <Satoshi.C.Watanabe@sony.com>
List-Id: devicetree@vger.kernel.org

From: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>

This is the document file for Sony CXD2880 DVB-T2/T tuner + demodulator.
It contains the description of the SPI adapter binding.

Signed-off-by: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Signed-off-by: Masayuki Yamamoto <Masayuki.Yamamoto@sony.com>
Signed-off-by: Hideki Nozawa <Hideki.Nozawa@sony.com>
Signed-off-by: Kota Yonezawa <Kota.Yonezawa@sony.com>
Signed-off-by: Toshihiko Matsumoto <Toshihiko.Matsumoto@sony.com>
Signed-off-by: Satoshi Watanabe <Satoshi.C.Watanabe@sony.com>
Acked-by: Rob Herring <robh@kernel.org>
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
2.13.0
