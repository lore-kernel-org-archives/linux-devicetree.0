From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/9] ARM: renesas: Use SMP jump stub SRAM region from DT
Date: Tue,  4 Jul 2017 17:41:34 +0200
Message-ID: <1499182903-31339-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Magnus, Mark, Rob, Simon,

The R-Car Gen2 platform code for CPU core bringup needs to copy a jump
stub to on-SoC SRAM.  Currently it uses a hardcoded address pointing to
ICRAM1.

This patch series adds support to specify this region from DT.  It
consists of 3 parts:
  - DT binding documentation for reserving SRAM for the jump stub,
  - A platform code update to retrieve the information from DT, if
    present (of course backwards-compatibility with old DTBs is
    preserved),
  - DT updates to reserve an SRAM region in DT on all R-Car Gen2 and
    RZ/G1 SoCs.

The DT patches in this series depend on "[PATCH 0/7] ARM: dts: renesas:
Add Inter Connect RAM".

Note that the current jump stub in Linux is 12 bytes long.  The patches
reserve 16 bytes of SRAM.  Should this be increased?  The mapping
granularity is PAGE_SIZE anyway.

Thanks for your comments!

Geert Uytterhoeven (9):
  dt-bindings: sram: Document renesas,smp-sram
  ARM: shmobile: rcar-gen2: Obtain jump stub region from DT
  ARM: dts: r8a7743: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7745: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7790: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7791: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7792: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7793: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7794: Reserve SRAM for the SMP jump stub

 .../devicetree/bindings/sram/renesas,smp-sram.txt  | 27 ++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7745.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7790.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7791.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7792.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7793.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7794.dtsi                     |  8 ++++++
 arch/arm/mach-shmobile/pm-rcar-gen2.c              | 33 ++++++++++++++++++++--
 9 files changed, 113 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/renesas,smp-sram.txt

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
