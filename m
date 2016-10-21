From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 5/5] irqchip: st: Remove obsolete platforms from dt binding doc
Date: Fri, 21 Oct 2016 17:57:23 +0200
Message-ID: <1477065443-10668-6-git-send-email-patrice.chotard@st.com>
References: <1477065443-10668-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477065443-10668-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

STiH415/6 SoC support is being removed from the kernel.
This patch updates the sti irchip and removes
references to these obsolete platforms.

Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Cc: <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt b/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
index ced6014..23d1e1c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
@@ -7,8 +7,6 @@ This driver is used to unmask them prior to use.
 
 Required properties:
 - compatible	: Should be set to one of:
-			"st,stih415-irq-syscfg"
-			"st,stih416-irq-syscfg"
 			"st,stih407-irq-syscfg"
 			"st,stid127-irq-syscfg"
 - st,syscfg	: Phandle to Cortex-A9 IRQ system config registers
@@ -25,8 +23,8 @@ Optional properties:
 Example:
 
 irq-syscfg {
-	compatible    = "st,stih416-irq-syscfg";
-	st,syscfg     = <&syscfg_cpu>;
+	compatible    = "st,stih407-irq-syscfg";
+	st,syscfg     = <&syscfg_core>;
 	st,irq-device = <ST_IRQ_SYSCFG_PMU_0>,
 			<ST_IRQ_SYSCFG_PMU_1>;
 	st,fiq-device = <ST_IRQ_SYSCFG_DISABLED>,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
