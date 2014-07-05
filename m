From: Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH v2 0/4] regulator: act8865: add support for act8846
Date: Sat,  5 Jul 2014 15:20:52 +0200
Message-ID: <1404566456-9121-1-git-send-email-b.galvani@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the Active-Semi act8846 PMU [1] to the
existing driver for act8865.

A dts which enables the act8846 on Radxa Rock is available at [2].

Changes since v1:
  - rebased on current regulator tree
  - reworded message of patch "set correct number of regulators in pdata"
  - added Wenyou Yang's Tested-by

[1] http://www.active-semi.com/products/power-management-units/act88xx/
[2] https://github.com/bengal/linux/tree/act88xx-regulator

Beniamino Galvani (4):
  regulator: act8865: set correct number of regulators in pdata
  regulator: act8865: prepare support for other act88xx devices
  regulator: act8865: add support for act8846
  regulator: act8865: add act8846 to DT binding documentation

 .../bindings/regulator/act8865-regulator.txt       |    7 +-
 drivers/regulator/act8865-regulator.c              |  282 +++++++++++---------
 include/linux/regulator/act8865.h                  |   23 +-
 3 files changed, 181 insertions(+), 131 deletions(-)

-- 
1.7.10.4

