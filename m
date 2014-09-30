From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH/RFC v2 4/4] ARM: shmobile: r8a7740 dtsi: Add minimal device node for Coresight-ETM
Date: Tue, 30 Sep 2014 14:26:27 +0200
Message-ID: <1412079987-1827-5-git-send-email-geert+renesas@glider.be>
References: <1412079987-1827-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412079987-1827-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

If power area D4, which contains the Coresight-ETM hardware block, is
powered down on R-Mobile A1 (r8a7740), the kernel crashes when
suspending from s2ram with:

    Internal error: Oops - undefined instruction: 0 [#1] ARM

This happens because dbg_cpu_pm_notify() calls reset_ctrl_regs(), which
can't access the debug registers as the debug module is powered down.

Add a minimal device node for the Coresight-ETM hardware block, and hook
it up to the D4 PM domain, so the R-Mobile System Controller driver can
keep the arm_dbg_regs_available flag in sync with the state of the D4 PM
domain.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
This is a fix on top of series "[PATCH 00/13] ARM: shmobile: R-Mobile:
DT PM domain support" (https://lkml.org/lkml/2014/9/25/452), to be
folded into "[PATCH v3 10/13] ARM: shmobile: r8a7740 dtsi: Add PM domain
support" (https://lkml.org/lkml/2014/9/25/450).

v2:
  - New

---
 arch/arm/boot/dts/r8a7740.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 0fb93df46af4ce08..2ae08fc99be678c3 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -44,6 +44,11 @@
 		interrupts = <0 83 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	ptm {
+		compatible = "arm,coresight-etm3x";
+		power-domains = <&pd_d4>;
+	};
+
 	cmt1: timer@e6138000 {
 		compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
 		reg = <0xe6138000 0x170>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
