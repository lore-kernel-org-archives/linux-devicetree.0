From: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH v2] ARM: dts: aspeed: tiogapass: Add VR devices
Date: Mon, 22 Jul 2019 17:32:16 -0700
Message-ID: <20190723003216.2910042-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, sdasari@fb.com, vijaykhemka@fb.com
List-Id: devicetree@vger.kernel.org

Adds voltage regulators Infineon pxe1610 devices to Facebook
tiogapass platform.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
In v2: Renamed vr to regulator and fixed some typo in commit message.

 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index c4521eda787c..e722e9aef907 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -144,6 +144,42 @@
 &i2c5 {
 	status = "okay";
 	// CPU Voltage regulators
+	regulator@48 {
+		compatible = "infineon,pxe1610";
+		reg = <0x48>;
+	};
+	regulator@4a {
+		compatible = "infineon,pxe1610";
+		reg = <0x4a>;
+	};
+	regulator@50 {
+		compatible = "infineon,pxe1610";
+		reg = <0x50>;
+	};
+	regulator@52 {
+		compatible = "infineon,pxe1610";
+		reg = <0x52>;
+	};
+	regulator@58 {
+		compatible = "infineon,pxe1610";
+		reg = <0x58>;
+	};
+	regulator@5a {
+		compatible = "infineon,pxe1610";
+		reg = <0x5a>;
+	};
+	regulator@68 {
+		compatible = "infineon,pxe1610";
+		reg = <0x68>;
+	};
+	regulator@70 {
+		compatible = "infineon,pxe1610";
+		reg = <0x70>;
+	};
+	regulator@72 {
+		compatible = "infineon,pxe1610";
+		reg = <0x72>;
+	};
 };
 
 &i2c6 {
-- 
2.17.1
