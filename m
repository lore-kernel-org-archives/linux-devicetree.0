Return-Path: <SRS0=eG0j=JN=bitwise.fi=anssi.hannula@kernel.org>
From: Anssi Hannula <anssi.hannula@bitwise.fi>
Subject: [PATCH 0/3] can: xilinx_can: CAN FD core support
Date: Wed, 27 Jun 2018 17:34:11 +0300
Message-Id: <20180627143414.7114-1-anssi.hannula@bitwise.fi>
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi all,

This patchset adds support for the Xilinx CAN FD core to the
xilinx_can driver.

This is on top of my previous patches:
- 2018-01-26 "[PATCH 0/5 resend] can: various fixes to xilinx_can driver"
- 2018-01-29 "[PATCH] can: xilinx_can: use can_change_state()"
- 2018-05-18 "[PATCH 0/4] can: fixes to xilinx_can".

All the changes are also here, rebased on top of linux-can master
(trivial rebase as there have been no other changes to the driver
recently):
https://github.com/anssih/linux/commits/e7a8b6dcf4b6ee2b69c8f2f8f1fd43f97d008b95

Let me know if you want me to post them again.

Anssi Hannula (3):
      dt-bindings: can: xilinx_can: add Xilinx CAN FD bindings
      can: xilinx_can: refactor code in preparation for CAN FD support
      can: xilinx_can: add support for Xilinx CAN FD core

 Documentation/devicetree/bindings/net/can/xilinx_can.txt |   36 -
 drivers/net/can/xilinx_can.c                             |  480 +++++++++++----
 2 files changed, 399 insertions(+), 117 deletions(-)

-- 
Anssi Hannula / Bitwise Oy
