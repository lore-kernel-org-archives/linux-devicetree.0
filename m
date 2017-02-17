From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: renesas: Upgrade to PSCI v1.0 to support Suspend-to-RAM
Date: Fri, 17 Feb 2017 18:00:30 +0100
Message-ID: <1487350832-29820-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Khiem Nguyen <khiem.nguyen.xt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series upgrades the version of the PSCI firmware, as
advertised in DT on Renesas R-Car Gen3 systems, from v0.2 to v1.0.

Note that this series does not have any runtime effects: as of PSCI
v0.2, PSCI provides a VERSION API.  Hence Linux always detected the
actual version, regardless of what was stated in DT, and enabled v1.0
features like system suspend:

    PSCIv1.0 detected in firmware.

However, it is better to have the real hardware^H^H^H^H^H^H^H^Hfirmware
description in DT.

Tested on Salvator-X (both H3 and M3-W) with firmware v2.16.0, but I do
have old boot logs showing that PSCIv1.0 has been detected for a long
time.

Thanks for applying!

Khiem Nguyen (2):
  arm64: dts: r8a7795: Upgrade to PSCI v1.0 to support Suspend-to-RAM
  arm64: dts: r8a7796: Upgrade to PSCI v1.0 to support Suspend-to-RAM

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
