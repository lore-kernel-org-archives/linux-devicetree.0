From: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH v2 0/6] ARM: tegra: add nvec keyboard support for paz00
Date: Sun, 27 Apr 2014 05:14:24 +0400
Message-ID: <1398561270-25091-1-git-send-email-danindrey@mail.ru>
References: <[PATCH 0/3] ARM: tegra: add nvec keyboard support for paz00>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <[PATCH 0/3] ARM: tegra: add nvec keyboard support for paz00>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series introduces keyboard support for AC100 (board paz00).

 I2C slave mode was implemented for i2c core and tegra-i2c.

 NVEC code from linux kernel was reworked to use tegra-i2c driver.

 Keytable header file is copied from linux kernel but modified
 to fix styles and remove unused code.

 Based on u-boot-tegra/next.

CC: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
CC: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
CC: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
---
 Changes for v2:
	- I2C slave mode for i2c-core and tegra-i2c implemented
	- Fixed NVEC dt bindings 
	- NVEC driver was reworked to use tegra-i2c
	- fixed incorrect keys handling in nvec-keyboard driver
	- patch is splitted to smaller parts

Andrey Danin (6):
  i2c: add slave mode support
  ARM: tegra: i2c: add slave mode support
  ARM: tegra: i2c: add nvec driver
  ARM: tegra: nvec: add keyboard support
  ARM: tegra: paz00: add dt bindings for nvec
  ARM: tegra: paz00: enable nvec keyboard

 arch/arm/include/asm/arch-tegra/tegra_i2c.h        |    6 +
 arch/arm/include/asm/arch-tegra/tegra_nvec.h       |  130 +++++++++
 .../include/asm/arch-tegra/tegra_nvec_keyboard.h   |  304 ++++++++++++++++++++
 board/compal/dts/tegra20-paz00.dts                 |    8 +-
 board/nvidia/common/board.c                        |   12 +
 drivers/i2c/Makefile                               |    1 +
 drivers/i2c/i2c_core.c                             |   13 +
 drivers/i2c/tegra_i2c.c                            |  199 ++++++++++++-
 drivers/i2c/tegra_nvec.c                           |  294 +++++++++++++++++++
 drivers/input/Makefile                             |    3 +
 drivers/input/tegra-nvec-kbc.c                     |  215 ++++++++++++++
 include/configs/paz00.h                            |    9 +
 include/configs/tegra-common-post.h                |    2 +
 include/fdtdec.h                                   |    1 +
 include/i2c.h                                      |   30 +-
 lib/fdtdec.c                                       |    1 +
 16 files changed, 1223 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-tegra/tegra_nvec.h
 create mode 100644 arch/arm/include/asm/arch-tegra/tegra_nvec_keyboard.h
 create mode 100644 drivers/i2c/tegra_nvec.c
 create mode 100644 drivers/input/tegra-nvec-kbc.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
