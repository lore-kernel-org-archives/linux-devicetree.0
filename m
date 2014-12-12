From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso@kth.se>
Subject: [PATCH 0/4] sh-pfc: Add emev2 pinmux support
Date: Fri, 12 Dec 2014 21:01:33 +0100
Message-ID: <1418414497-23741-1-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, magnus.damm@gmail.com, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso@kth.se>
List-Id: devicetree@vger.kernel.org

Greetings,

This patchset introduces pinmux support for the EMMA Mobile EV2 board t=
o
the sh-pfc pin-controller driver. Devicetree bindings for gpio and the
populated serial connector are also defined in 3/4 and 4/4.

Comments are welcome!

Regards
// Niklas

Niklas S=C3=B6derlund (4):
  sh-pfc: add macro to define pinmux without function
  sh-pfc: Add emev2 pinmux support
  ARM: shmobile: emev2: Add PFC information to emev2.dtsi
  ARM: shmobile: emev2-kzm9d: Add PFC information for uart1

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 arch/arm/boot/dts/emev2-kzm9d.dts                  |   13 +
 arch/arm/boot/dts/emev2.dtsi                       |   11 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    9 +
 drivers/pinctrl/sh-pfc/core.h                      |    1 +
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 | 1915 ++++++++++++=
++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    2 +
 9 files changed, 1958 insertions(+)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-emev2.c

--
2.1.3

