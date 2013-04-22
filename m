From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH 19/23] ARM: u300: add the COH 901 318 DMAC to device tree
Date: Mon, 22 Apr 2013 11:59:39 +0200
Message-ID: <1366624779-6820-1-git-send-email-linus.walleij@stericsson.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This adds the COH 901 318 DMA controller to the U300
device tree. All devices now converted to device tree
so far will start to find their DMA channels.

Note that the U300 is not yet using the device tree
to obtain DMA channels, but this is a first step.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-u300.dts | 7 +++++++
 arch/arm/mach-u300/core.c      | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
index ee747fe..cdffeb9 100644
--- a/arch/arm/boot/dts/ste-u300.dts
+++ b/arch/arm/boot/dts/ste-u300.dts
@@ -68,6 +68,13 @@
 		interrupts = <10>;
 	};
 
+	dmac: dmac@c00020000 {
+		compatible = "stericsson,coh901318";
+		reg = <0xc0020000 0x1000>;
+		interrupt-parent = <&vica>;
+		interrupts = <2>;
+	};
+
 	i2c0: i2c@c0004000 {
 		compatible = "st,ddci2c";
 		reg = <0xc0004000 0x1000>;
diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index 20d6c46..98d4dbe 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -713,6 +713,8 @@ static struct of_dev_auxdata u300_auxdata_lookup[] __initdata = {
 		"coh901327_wdog", NULL),
 	OF_DEV_AUXDATA("stericsson,coh901331", U300_RTC_BASE,
 		"rtc-coh901331", NULL),
+	OF_DEV_AUXDATA("stericsson,coh901318", U300_DMAC_BASE,
+		"coh901318", NULL),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART0_BASE,
 		"uart0", &uart0_plat_data),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART1_BASE,
-- 
1.7.11.3
