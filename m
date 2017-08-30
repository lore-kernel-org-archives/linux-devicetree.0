From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH  0/5] Add USB2.0 Host support
Date: Wed, 30 Aug 2017 14:41:08 +0100
Message-ID: <1504100473-5528-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add USB2.0 Host support on iWave RZ/G1M(r8a7743)
based board.

This series has been tested against renesas-dev tag 20170830-v4.13-rc7

This patch has documentation dependency on below patches
 * PCI: rcar: Add r8a7743/5 support
https://patchwork.kernel.org/patch/9919697/
 * phy: rcar-gen2: Add r8a7743/5 support
https://patchwork.kernel.org/patch/9919727/

Biju Das (5):
  ARM: dts: r8a7743: Add internal PCI bridge nodes
  ARM: dts: r8a7743: Add USB PHY DT support
  ARM: dts: r8a7743: Link PCI USB devices to USB PHY
  ARM: dts: iwg20d-q7: Enable internal PCI
  ARM: dts: iwg20d-q7: Enable USB PHY

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 26 ++++++++++
 arch/arm/boot/dts/r8a7743.dtsi          | 92 +++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
