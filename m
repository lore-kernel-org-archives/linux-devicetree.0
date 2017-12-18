From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v2 6/6] ARM: dts: r8a7743: Add TPU support
Date: Mon, 18 Dec 2017 17:52:08 +0000
Message-ID: <1513619528-12060-7-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513619528-12060-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513619528-12060-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add TPU support to SoC DT.

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
v1->v2
* No change

 arch/arm/boot/dts/r8a7743.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index d73617a..11defe7c 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1159,6 +1159,16 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e60f0000 {
+			compatible = "renesas,tpu-r8a7743", "renesas,tpu";
+			reg = <0 0xe60f0000 0 0x148>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a7743",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
