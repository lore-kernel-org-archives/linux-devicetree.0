From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: r8a7790/r8a7791: Remove obsolete vsp1 properties
Date: Tue, 16 Aug 2016 16:56:30 +0200
Message-ID: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus, Laurent,

This patch series removes from the R-Car H2 and M2-W DT source files the
obsolete DT properties to identify the exact VSP device instance
features, which are no longer needed nor used since commit
5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device based on IP
version").

Geert Uytterhoeven (2):
  ARM: dts: r8a7790: Remove obsolete vsp1 properties
  ARM: dts: r8a7791: Remove obsolete vsp1 properties

 arch/arm/boot/dts/r8a7790.dtsi | 23 -----------------------
 arch/arm/boot/dts/r8a7791.dtsi | 18 ------------------
 2 files changed, 41 deletions(-)

-- 
1.9.1

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
