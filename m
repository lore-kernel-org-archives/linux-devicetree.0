From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net-next v2 0/3] ave: fix the activation issues for some UniPhier SoCs
Date: Thu, 19 Apr 2018 16:24:52 +0900
Message-ID: <1524122695-19597-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

This add the following stuffs to fix the activation issues and satisfy
requirements for AVE ethernet driver implemented on some UniPhier SoCs.

- Add support for additional necessary clocks and resets, because the kernel
  is stalled on Pro4 due to lack of them.

- Check whether the SoC supports the specified phy-mode

- Add DT property support indicating system controller that has the feature
  for configurating phy-mode including built-in phy on LD11.

v1: https://www.spinics.net/lists/netdev/msg494904.html

Changes since v1:
- Add 'Reviewed-by' lines

Kunihiko Hayashi (3):
  net: ethernet: ave: add multiple clocks and resets support as required
    property
  dt-bindings: net: ave: add syscon-phy-mode property to configure
    phy-mode setting
  net: ethernet: ave: add support for phy-mode setting of system
    controller

 .../bindings/net/socionext,uniphier-ave4.txt       |  19 +-
 drivers/net/ethernet/socionext/Kconfig             |   2 +
 drivers/net/ethernet/socionext/sni_ave.c           | 252 ++++++++++++++++++---
 3 files changed, 238 insertions(+), 35 deletions(-)

-- 
2.7.4
