From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH 0/3] mmc: usdhi6rol0: UHS support
Date: Mon, 18 Apr 2016 11:38:23 +0200
Message-ID: <cover.1460971625.git.larper@axis.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Cc: g.liakhovetski@gmx.de, ulf.hansson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

This patch set adds UHS support to the usdhi6rol0 driver, with control of the
regulator and pin state settings.

Guennadi Liakhovetski (1):
  mmc: usdhi6rol0: add support for UHS modes

Lars Persson (2):
  mmc: dt: usdhi6rol0: add optional pinctrl binding
  mmc: usdhi6rol0: add pinctrl to set pin drive strength

 .../devicetree/bindings/mmc/usdhi6rol0.txt         |  4 ++
 drivers/mmc/host/usdhi6rol0.c                      | 70 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

-- 
2.1.4

