From: Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH 0/2] act8865 regulator modes and suspend states
Date: Sat, 10 Aug 2019 13:18:53 +0530
Message-ID: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Raag Jadav <raagjadav@gmail.com>
List-Id: devicetree@vger.kernel.org

This series implements operating mode and suspend state support for act8865.

Raag Jadav (2):
  regulator: act8865: operating mode and suspend state support
  dt-bindings: regulator: act8865 regulator modes and suspend states

 .../bindings/regulator/act8865-regulator.txt       |  27 +++-
 drivers/regulator/act8865-regulator.c              | 160 ++++++++++++++++++++-
 .../regulator/active-semi,8865-regulator.h         |  28 ++++
 include/linux/regulator/act8865.h                  |   2 +-
 4 files changed, 213 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/regulator/active-semi,8865-regulator.h

-- 
2.7.4
