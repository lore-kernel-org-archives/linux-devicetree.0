From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/6 v3] ARM: integrator: check PL010 base address from resource
Date: Mon,  3 Sep 2012 22:06:15 +0200
Message-ID: <1346702775-19828-1-git-send-email-linus.walleij@linaro.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the PL010 UART callback a comparison against the location of the
statically allocated PL010 device is done to figure out which UART
is doing the callback. This does not play well with dynamic devices
such as in device tree, so let's check the base address of the
memory resource inside the amba_device instead.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v2->v3:
- Check for the base address of the physical memory resource instead
  of checking for the device name (which will also be dynamic when
  we use device tree).
---
 arch/arm/mach-integrator/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-integrator/core.c b/arch/arm/mach-integrator/core.c
index 5ba4bc8..268eadf 100644
--- a/arch/arm/mach-integrator/core.c
+++ b/arch/arm/mach-integrator/core.c
@@ -99,11 +99,14 @@ int __init integrator_init(bool is_cp)
 static void integrator_uart_set_mctrl(struct amba_device *dev, void __iomem *base, unsigned int mctrl)
 {
 	unsigned int ctrls = 0, ctrlc = 0, rts_mask, dtr_mask;
+	u32 phybase = dev->res.start;
 
-	if (dev == &uart0_device) {
+	if (phybase == INTEGRATOR_UART0_BASE) {
+		/* UART0 */
 		rts_mask = 1 << 4;
 		dtr_mask = 1 << 5;
 	} else {
+		/* UART1 */
 		rts_mask = 1 << 6;
 		dtr_mask = 1 << 7;
 	}
-- 
1.7.11.4
