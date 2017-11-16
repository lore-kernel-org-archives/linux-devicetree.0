From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: renesas: Correct primary compatible value for eeprom
Date: Thu, 16 Nov 2017 14:51:34 +0100
Message-ID: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

The Renesas part numbers of the two-wire serial interface EEPROMs do not
follow the 24Cxx pattern, but the R1EX24xxx pattern.

Hence change the primary compatible values to the appropriate variant of
"renesas,r1ex24xxx", like is already done on Gose.

Note that the second patch depends on (trivial) "[PATCH] dt-bindings:
i2c: eeprom: Add Renesas R1EX24128" to please checkpatch.

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: koelsch: Correct primary compatible value for eeprom
  ARM: dts: genmai: Correct primary compatible value for eeprom

 arch/arm/boot/dts/r7s72100-genmai.dts | 2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
