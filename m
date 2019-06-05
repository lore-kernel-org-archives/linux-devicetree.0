From: George Hung <ghung.quanta@gmail.com>
Subject: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Wed,  5 Jun 2019 22:12:53 +0800
Message-ID: <20190605141253.38554-2-ghung.quanta@gmail.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605141253.38554-1-ghung.quanta@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-edac <linux-edac@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: benjaminfair@google.com, wak@google.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, davem@davemloft.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: devicetree@vger.kernel.org

Add device tree documentation for Nuvoton BMC ECC

Signed-off-by: George Hung <ghung.quanta@gmail.com>
---
 .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
new file mode 100644
index 000000000000..dd4dac59a5bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
@@ -0,0 +1,17 @@
+Nuvoton NPCM7xx SoC EDAC device driver
+
+The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
+uses the EDAC framework to implement the ECC detection and corrtection.
+
+Required properties:
+- compatible:	should be "nuvoton,npcm7xx-sdram-edac"
+- reg:		Memory controller register set should be <0xf0824000 0x1000>
+- interrupts:	should be MC interrupt #25
+
+Example:
+
+	mc: memory-controller@f0824000 {
+		compatible = "nuvoton,npcm7xx-sdram-edac";
+		reg = <0xf0824000 0x1000>;
+		interrupts = <0 25 4>;
+	};
-- 
2.21.0
