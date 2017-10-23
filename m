From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/2] Add HDMI support
Date: Mon, 23 Oct 2017 19:09:20 +0100
Message-ID: <1508782162-31714-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

this series aims to add HDMI support for iWave RZ/G1M (R8A7743) board.
This new version applies on top of tag renesas-devel-20171018-v4.14-rc5

As a reminder, the patches in this series depend on:
[1] dt-bindings: display: rcar-du: Document R8A774[35]DU
    https://patchwork.kernel.org/patch/10005091/
[2] drm: rcar-du: Add R8A7743 support
    https://patchwork.kernel.org/patch/10005093/

Best regards,

Fabrizio Castro (2):
  ARM: dts: r8a7743: Add DU support
  ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output

 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 75 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi           | 30 +++++++++++++
 2 files changed, 105 insertions(+)

-- 
2.7.4
