Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/6] pinctrl: sh-pfc: Initial R8A77990 PFC support
Date: Fri, 11 May 2018 12:22:21 +0900
Message-Id: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on renesas-drivers-2018-05-02-v4.17-rc3 tag of
renesas-drivers.git.

Takeshi Kihara (6):
  pinctrl: sh-pfc: Add PORT_GP_11 helper macro
  pinctrl: sh-pfc: Initial R8A77990 PFC support
  pinctrl: sh-pfc: r8a77990: Add bias pinconf support
  pinctrl: sh-pfc: r8a77990: Add SCIF pins, groups and functions
  pinctrl: sh-pfc: r8a77990: Add I2C{1,2,4,5,6,7} pins, groups and
    functions
  pinctrl: sh-pfc: r8a77990: Add EthernetAVB pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 2695 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    9 +-
 6 files changed, 2715 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77990.c

-- 
1.9.1
