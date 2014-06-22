From: Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 0/5] regulator: act8865: add support for act8846
Date: Sun, 22 Jun 2014 17:31:40 +0200
Message-ID: <1403451105-31929-1-git-send-email-b.galvani@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Beniamino Galvani <b.galvani@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the Active-Semi act8846 PMU [1] to the
existing driver for act8865.

A dts which enables the act8846 on Radxa Rock is available at [2].

[1] http://www.active-semi.com/products/power-management-units/act88xx/
[2] https://github.com/bengal/linux/tree/act88xx-regulator

Beniamino Galvani (5):
  regulator: act8865: fix parsing of platform data
  regulator: act8865: set correct number of regulators in pdata
  regulator: act8865: prepare support for other act88xx devices
  regulator: act8865: add support for act8846
  regulator: act8865: add act8846 to DT binding documentation

 .../bindings/regulator/act8865-regulator.txt       |    7 +-
 drivers/regulator/act8865-regulator.c              |  308 +++++++++++---------
 include/linux/regulator/act8865.h                  |   23 +-
 3 files changed, 200 insertions(+), 138 deletions(-)

-- 
1.7.10.4

