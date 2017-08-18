From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH ] ARM: dts: iwg20d-q7: Add chosen node
Date: Fri, 18 Aug 2017 17:58:08 +0100
Message-ID: <1503075488-44304-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
This patch tested against renesas-dev tag renesas-devel-20170815-v4.13-rc5

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index 081af01..305a6a1 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -19,6 +19,11 @@
 		serial0 = &scif0;
 		ethernet0 = &avb;
 	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		stdout-path = "serial0:115200n8";
+	};
 };
 
 &pfc {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
