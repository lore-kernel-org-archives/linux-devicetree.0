From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH  0/3] Add SDHI Support
Date: Mon, 14 Aug 2017 12:49:46 +0100
Message-ID: <1502711389-16040-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series aims to add SDHI support for r8a7743 SoC.

This series has been compiled and tested against renesas-dev tag
renesas-devel-20170814-v4.13-rc5.

There is no compile time dependencies.It has run time dependency on
[PATCH ] mmc: renesas_sdhi: Add r8a7743/5 support.
https://patchwork.kernel.org/patch/9898611/ 

Biju Das (3):
  ARM: dts: r8a7743: Add SDHI controllers
  ARM: dts: iwg20m: Enable SDHI0 controller
  ARM: dts: iwg20d-q7: Add SDHI1 support

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 48 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi   | 17 ++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi          | 42 +++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
