From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH  0/2] Add HDMI support
Date: Wed, 18 Oct 2017 10:33:45 +0100
Message-ID: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add HDMI support for iWave RZ/G1M (R8A7743) board.
This series has been tested against renesas-dev tag 20171018-v4.14-rc5.

This patch dependency on below patches

[1] dt-bindings: display: rcar-du: Document R8A774[35]DU
    https://patchwork.kernel.org/patch/10005091/
[2] drm: rcar-du: Add R8A7743 support
    https://patchwork.kernel.org/patch/10005093/

Fabrizio Castro (2):
  ARM: dts: r8a7743: Add DU support
  ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output

 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 75 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi           | 30 +++++++++++++
 2 files changed, 105 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
