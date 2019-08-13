From: Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH v2 0/2] act8865 regulator modes and suspend states
Date: Wed, 14 Aug 2019 00:02:54 +0530
Message-ID: <1565721176-8955-1-git-send-email-raagjadav@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Raag Jadav <raagjadav@gmail.com>
List-Id: devicetree@vger.kernel.org

This series implements operating mode and suspend state support for act8865.

Changes since v1:
- Added REGULATOR_MODE_FAST for DCDC regulators.
- get_mode() hook now reads values from the hardware.
- Removed op_mode[] from act8865 structure as it is no longer needed.
- Fixed ldo register addresses in set_mode() hook.
- Reverted act8865.h changes.

Raag Jadav (2):
  regulator: act8865: operating mode and suspend state support
  dt-bindings: regulator: act8865 regulator modes and suspend states

 .../bindings/regulator/act8865-regulator.txt       |  27 ++-
 drivers/regulator/act8865-regulator.c              | 187 ++++++++++++++++++++-
 .../regulator/active-semi,8865-regulator.h         |  28 +++
 3 files changed, 239 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/regulator/active-semi,8865-regulator.h

-- 
2.7.4
