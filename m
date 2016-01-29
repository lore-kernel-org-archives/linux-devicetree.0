From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v4 0/7] ARM: dts: R-Car: Add SCIF fallback compatibility strings
Date: Fri, 29 Jan 2016 10:32:01 +0100
Message-ID: <1454059928-975-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series adds fallback compatibility strings for SCIF, HSCIF,
SCIFA, and SCIFB to the dtsi files for R-Car Gen1, Gen2, and Gen3 SoCs.
These fallback compatibility strings have been accepted in the DT
bindings in v4.5-rc1.

This will allow the sh-sci driver to match on family-specific compatible
values, to enable support for the Baud Rate Generator for External Clock
(BRG) on (H)SCIF later.

Changes compared to v3:
  - Changed one-line summary prefix to match current arm-soc practices,
  - Rebased on top of renesas-devel-20160129-v4.5-rc1.

Thanks for applying!

Geert Uytterhoeven (7):
  ARM: dts: r8a7778: Add SCIF fallback compatibility strings
  ARM: dts: r8a7779: Add SCIF fallback compatibility strings
  ARM: dts: r8a7790: Add SCIF fallback compatibility strings
  ARM: dts: r8a7791: Add SCIF fallback compatibility strings
  ARM: dts: r8a7793: Add SCIF fallback compatibility strings
  ARM: dts: r8a7794: Add SCIF fallback compatibility strings
  arm64: dts: r8a7795: Add SCIF fallback compatibility strings

 arch/arm/boot/dts/r8a7778.dtsi           | 18 +++++++----
 arch/arm/boot/dts/r8a7779.dtsi           | 18 +++++++----
 arch/arm/boot/dts/r8a7790.dtsi           | 30 ++++++++++++------
 arch/arm/boot/dts/r8a7791.dtsi           | 54 +++++++++++++++++++++-----------
 arch/arm/boot/dts/r8a7793.dtsi           | 54 +++++++++++++++++++++-----------
 arch/arm/boot/dts/r8a7794.dtsi           | 54 +++++++++++++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 38 +++++++++++++++-------
 7 files changed, 179 insertions(+), 87 deletions(-)

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
