From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Document HopeRun RZ/G2M boards
Date: Wed, 15 May 2019 12:44:55 +0100
Message-ID: <1557920697-18057-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-Id: devicetree@vger.kernel.org

Dear All,

this series aims at documenting the HiHope RZ/G2M platform from
HopeRun, and its corresponding expansion board.

Thanks,
Fab

Fabrizio Castro (2):
  dt-bindings: Add vendor prefix for HopeRun
  dt-bindings: arm: renesas: Add HopeRun RZ/G2[M] boards

 Documentation/devicetree/bindings/arm/renesas.yaml    | 8 ++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 2 files changed, 9 insertions(+)

-- 
2.7.4
