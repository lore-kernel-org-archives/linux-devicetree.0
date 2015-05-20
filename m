From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/5] ARM: shmobile: dts: Replace "nor-jedec" by "jedec,spi-nor"
Date: Wed, 20 May 2015 20:16:49 +0200
Message-ID: <1432145814-12442-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series replaces the recently introduced "nor-jedec"
compatible value by "jedec,spi-nor" in all shmobile dts files,
cfr. commit 8947e396a8296c52 ('Documentation: dt: mtd: replace
"nor-jedec" binding with "jedec,spi-nor"'), which was applied in
v4.1-rc4.

As the "bad" compatible values are already in -next for v4.2, these
updates should be applied and queued for v4.2, too.

Thanks for applying!

Geert Uytterhoeven (5):
  ARM: shmobile: bockw-reference dts: Replace "nor-jedec" by
    "jedec,spi-nor"
  ARM: shmobile: bockw dts: Replace "nor-jedec" by "jedec,spi-nor"
  ARM: shmobile: lager dts: Replace "nor-jedec" by "jedec,spi-nor"
  ARM: shmobile: henninger dts: Replace "nor-jedec" by "jedec,spi-nor"
  ARM: shmobile: koelsch dts: Replace "nor-jedec" by "jedec,spi-nor"

 arch/arm/boot/dts/r8a7778-bockw-reference.dts | 2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts           | 2 +-
 arch/arm/boot/dts/r8a7790-lager.dts           | 2 +-
 arch/arm/boot/dts/r8a7791-henninger.dts       | 2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

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
