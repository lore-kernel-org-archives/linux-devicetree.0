From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH/RFC 02/12] ARM: shmobile: koelsch dts: Add aliases for all serial ports
Date: Tue, 12 May 2015 19:37:05 +0200
Message-ID: <1431452235-11692-3-git-send-email-geert+renesas@glider.be>
References: <1431452235-11692-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431452235-11692-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add aliases for the remaining serial ports that don't already have an
alias.

This is a temporary workaround, until of_alias_add() is called when
loading a device tree overlay that adds an alias.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index e9c24036f00027c9..c1cd047173b6aed7 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -50,6 +50,22 @@
 	aliases {
 		serial0 = &scif0;
 		serial1 = &scif1;
+		serial2 = &scif2;
+		serial3 = &scif3;
+		serial4 = &scif4;
+		serial5 = &scif5;
+		serial6 = &scifa0;
+		serial7 = &scifa1;
+		serial8 = &scifa2;
+		serial9 = &scifa3;
+		serial10 = &scifa4;
+		serial11 = &scifa5;
+		serial12 = &scifb0;
+		serial13 = &scifb1;
+		serial14 = &scifb2;
+		serial15 = &hscif0;
+		serial16 = &hscif1;
+		serial17 = &hscif2;
 	};
 
 	chosen {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
