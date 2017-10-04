From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: rcar-gen2: Use generic node name for VSP1 nodes
Date: Wed,  4 Oct 2017 14:36:45 +0200
Message-ID: <1507120609-14501-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus, Laurent,

This patch series replaces the specific node names used for the VSP1
nodes by the preferred generic node names, cfr. commit 0e1bfb72b076b07d
("v4l: vsp1: Use generic node name").

Thanks!

Geert Uytterhoeven (4):
  ARM: dts: r8a7790: Use generic node name for VSP1 nodes
  ARM: dts: r8a7791: Use generic node name for VSP1 nodes
  ARM: dts: r8a7792: Use generic node name for VSP1 nodes
  ARM: dts: r8a7794: Use generic node name for VSP1 nodes

 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++----
 arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7792.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi | 4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
