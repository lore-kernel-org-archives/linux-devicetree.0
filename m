From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/2] regulator: pfuze100: add pfuze3001 support
Date: Fri, 15 Jun 2018 13:44:51 +0200
Message-ID: <1529063093-19582-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, linux-imx@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for the NXP PMIC PF3001. This
based mostly on the patches by Robin Gong and Mauro Salvini from
here [1].

[1] - https://community.nxp.com/docs/DOC-331899

Stefan Wahren (2):
  dt-bindings: pfuze100: add pfuze3001 support
  regulator: pfuze100: add pfuze3001 support

 .../devicetree/bindings/regulator/pfuze100.txt     | 77 ++++++++++++++++++++-
 drivers/regulator/Kconfig                          |  4 +-
 drivers/regulator/pfuze100-regulator.c             | 78 ++++++++++++++++++++--
 include/linux/regulator/pfuze100.h                 | 11 +++
 4 files changed, 160 insertions(+), 10 deletions(-)

-- 
2.7.4
