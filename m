From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH 12/23] ARM: u300: add RTC to device tree
Date: Mon, 22 Apr 2013 11:56:16 +0200
Message-ID: <1366624576-6544-1-git-send-email-linus.walleij@stericsson.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This adds the COH 901 331 RTC to the U300 device tree.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-u300.dts | 7 +++++++
 arch/arm/mach-u300/core.c      | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
index b1b63bb..784e17a 100644
--- a/arch/arm/boot/dts/ste-u300.dts
+++ b/arch/arm/boot/dts/ste-u300.dts
@@ -56,6 +56,13 @@
 		interrupts = <3>;
 	};
 
+	rtc: rtc@c0017000 {
+		compatible = "stericsson,coh901331";
+		reg = <0xc0017000 0x1000>;
+		interrupt-parent = <&vicb>;
+		interrupts = <10>;
+	};
+
 	i2c0: i2c@c0004000 {
 		compatible = "st,ddci2c";
 		reg = <0xc0004000 0x1000>;
diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index f97b65c..20d6c46 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -711,6 +711,8 @@ static struct of_dev_auxdata u300_auxdata_lookup[] __initdata = {
 		"u300-gpio", &u300_gpio_plat),
 	OF_DEV_AUXDATA("stericsson,coh901327", U300_WDOG_BASE,
 		"coh901327_wdog", NULL),
+	OF_DEV_AUXDATA("stericsson,coh901331", U300_RTC_BASE,
+		"rtc-coh901331", NULL),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART0_BASE,
 		"uart0", &uart0_plat_data),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART1_BASE,
-- 
1.7.11.3
