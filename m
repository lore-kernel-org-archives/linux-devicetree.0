From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [PATCH V2 0/2] Add DesignWare IP support to simple reset
Date: Thu,  6 Jun 2019 17:36:26 +0200
Message-ID: <1559835388-2578-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch series adds a reset-simple compatible string for DesignWare
IPs allowing active high and low resets inputs.

Also adds the corresponding documentation.

Gustavo Pimentel (1):
  reset: Add DesignWare IP support to simple reset

Luis Oliveira (1):
  dt-bindings: Document the DesignWare IP reset bindings

 .../devicetree/bindings/reset/snps,dw-reset.txt    | 30 ++++++++++++++++++++++
 drivers/reset/Kconfig                              |  2 +-
 drivers/reset/reset-simple.c                       |  3 +++
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt

-- 
2.7.4
