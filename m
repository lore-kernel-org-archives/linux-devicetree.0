From: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] ARM: DTS: r8a7794: alt: Fix PFC names for DU
Date: Thu,  3 Nov 2016 20:34:46 +0100
Message-ID: <1478201686-25488-1-git-send-email-jacopo@jmondi.org>
References: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478180574-15464-1-git-send-email-jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the PFC pin groups and function names of DU interface for
r8a7794 ALT board.

The currently specified pin groups and function names prevented PFC and
DU interfaces from being correctly configured:

sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
sh-pfc e6060000.pin-controller: function 'du' not supported
sh-pfc e6060000.pin-controller: invalid function du in map table
rcar-du: probe of feb00000.display failed with error -22

Signed-off-by: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---

v1->v2:
    - s/PCF/PFC/ in commit message according to Sergei Shtylyov's comment

Patch applied against Simon Horman's renesas/master branch.
The PCF pin groups and function renaming was introduced by commit 56ed4bb9 and
DTS for ALT board has never been update accordingly.
Tested displaying frames on VGA interface: the rcar-du driver loads correctly.

 arch/arm/boot/dts/r8a7794-alt.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 8d1b35a..9d65fb3 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -165,8 +165,8 @@
 	pinctrl-names = "default";
 
 	du_pins: du {
-		groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_dotclkout0";
-		function = "du";
+		groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_clk0_out";
+		function = "du1";
 	};
 
 	scif2_pins: scif2 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
