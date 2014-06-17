From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH RESEND 0/2] ARM: topology: Allow to set the frequency through a clock
Date: Tue, 17 Jun 2014 21:56:18 +0200
Message-ID: <1403034980-19112-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patch series add the possibility for the topology code to get the
CPU frequency through a DT clock handle instead of needing a
clock-frequency property.

Indeed, this information can be quite redundant if the clock tree
defined in the DT is already describing the CPU parent clock.

Maxime

Maxime Ripard (2):
  ARM: topology: Use a clock if possible to get the CPU frequency
  ARM: sunxi: Add clocks node to the CPU nodes

 arch/arm/boot/dts/sun6i-a31.dtsi |  4 ++++
 arch/arm/boot/dts/sun7i-a20.dtsi |  2 ++
 arch/arm/kernel/topology.c       | 24 +++++++++++++++++-------
 3 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
