From: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH 1/2] ARM: dts: aspeed: tiogapass: Add VR devices
Date: Mon, 22 Jul 2019 12:24:47 -0700
Message-ID: <20190722192451.1947348-1-vijaykhemka@fb.com>
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
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, sdasari@fb.com, vijaykhemka@fb.com
List-Id: devicetree@vger.kernel.org

Addes Voltage regulators Infineon pxe1610 devices to Facebook
tiogapass platform.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index c4521eda787c..b7783833a58c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -144,6 +144,42 @@
 &i2c5 {
 	status = "okay";
 	// CPU Voltage regulators
+	vr@48 {
+		compatible = "infineon,pxe1610";
+		reg = <0x48>;
+	};
+	vr@4a {
+		compatible = "infineon,pxe1610";
+		reg = <0x4a>;
+	};
+	vr@50 {
+		compatible = "infineon,pxe1610";
+		reg = <0x50>;
+	};
+	vr@52 {
+		compatible = "infineon,pxe1610";
+		reg = <0x52>;
+	};
+	vr@58 {
+		compatible = "infineon,pxe1610";
+		reg = <0x58>;
+	};
+	vr@5a {
+		compatible = "infineon,pxe1610";
+		reg = <0x5a>;
+	};
+	vr@68 {
+		compatible = "infineon,pxe1610";
+		reg = <0x68>;
+	};
+	vr@70 {
+		compatible = "infineon,pxe1610";
+		reg = <0x70>;
+	};
+	vr@72 {
+		compatible = "infineon,pxe1610";
+		reg = <0x72>;
+	};
 };
 
 &i2c6 {
-- 
2.17.1
