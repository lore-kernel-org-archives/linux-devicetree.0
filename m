From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH  0/2] ARM: dts: Add iWave RZ/G1E board support
Date: Tue, 15 Aug 2017 11:54:18 +0100
Message-ID: <1502794460-30213-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add iWave RZ/G1E (R8A7745) based RainboW-G22M-SM SODIMM 
SoM and RainboW-G22D board support. 

This series has been tested against linux-next tag next-20170815 as well as
renesas-dev tag 20170814-v4.13-rc5

This patch has documentation dependency on below patches

[repost,1/2] ARM: shmobile: document iW-RainboW-G22M-SM SODIMM System on Module
https://patchwork.kernel.org/patch/9890389/
[repost, 2/2] ARM: shmobile: document iW-RainboW-G22D SODIMM SOM Development Platform
https://patchwork.kernel.org/patch/9890391/


Regards,

Biju Das (2):
  ARM: dts: iwg22m: Add iWave RZG1E SODIMM SOM
  ARM: dts: iwg22d-sodimm: Add support for iWave G22D-SODIMM board

 arch/arm/boot/dts/Makefile                  |  1 +
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 29 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi       | 24 ++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
 create mode 100644 arch/arm/boot/dts/r8a7745-iwg22m.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
