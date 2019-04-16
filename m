From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [PATCH V1 0/3]  slg51000: regulator driver submission
Date: Tue, 16 Apr 2019 13:37:27 +0900
Message-ID: <cover.1555389447.git.eric.jeong.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

From: Eric Jeong <eric.jeong.opensource@diasemi.com>

This patch adds support for the Dialog SLG51000 regulator device.

In this patch set the following is provided:

[PATCH V1 1/3] MAINTAINERS file update for SLG51000
[PATCH V1 2/3] SLG51000 DT binding
[PATCH V1 3/3] SLG51000 regulator driver

This patch applies against linux-next and next-20190415 

Thank you,
Eric Jeong, Dialog Semiconductor Ltd.

Eric Jeong (3):
  MAINTAINERS: slg51000 updates to the Dialog Semiconductor search
    terms
  Documentation: devicetree: regulator: add binding for slg51000
  regulator: slg51000: add slg51000 regulator driver

 .../devicetree/bindings/regulator/slg51000.txt     |   88 ++++
 MAINTAINERS                                        |    2 +
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/slg51000-regulator.c             |  548 ++++++++++++++++++++
 drivers/regulator/slg51000-regulator.h             |  505 ++++++++++++++++++
 6 files changed, 1153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/slg51000.txt
 create mode 100644 drivers/regulator/slg51000-regulator.c
 create mode 100644 drivers/regulator/slg51000-regulator.h

-- 
end-of-patch for PATCH V1
