From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH 08/23] ARM: u300: register I2C bus drivers from device tree
Date: Mon, 22 Apr 2013 11:53:20 +0200
Message-ID: <1366624400-6364-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This adds the two I2C busses to the device tree so these
probe properly.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-u300.dts | 18 ++++++++++++++++++
 arch/arm/mach-u300/core.c      |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
index 80f963c..9c08d5e 100644
--- a/arch/arm/boot/dts/ste-u300.dts
+++ b/arch/arm/boot/dts/ste-u300.dts
@@ -49,6 +49,24 @@
 		reg = <0xc0011000 0x1000>;
 	};
 
+	i2c0: i2c@c0004000 {
+		compatible = "st,ddci2c";
+		reg = <0xc0004000 0x1000>;
+		interrupt-parent = <&vicb>;
+		interrupts = <8>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	i2c1: i2c@c0005000 {
+		compatible = "st,ddci2c";
+		reg = <0xc0005000 0x1000>;
+		interrupt-parent = <&vicb>;
+		interrupts = <9>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	amba {
 		compatible = "arm,amba-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index 5b42983..fedad38 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -713,6 +713,10 @@ static struct of_dev_auxdata u300_auxdata_lookup[] __initdata = {
 		"uart0", &uart0_plat_data),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART1_BASE,
 		"uart1", &uart1_plat_data),
+	OF_DEV_AUXDATA("st,ddci2c", U300_I2C0_BASE,
+		"stu300.0", NULL),
+	OF_DEV_AUXDATA("st,ddci2c", U300_I2C1_BASE,
+		"stu300.1", NULL),
 	OF_DEV_AUXDATA("arm,primecell", U300_MMCSD_BASE,
 		"mmci", &mmcsd_platform_data),
 	{ /* sentinel */ },
-- 
1.7.11.3
