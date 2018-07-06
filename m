Return-Path: <SRS0=cA9l=JW=bitwise.fi=anssi.hannula@kernel.org>
From: Anssi Hannula <anssi.hannula@bitwise.fi>
Subject: [PATCH 0/3 v2] can: xilinx_can: CAN FD core support 
Date: Fri,  6 Jul 2018 17:18:14 +0300
Message-Id: <20180706141817.19729-1-anssi.hannula@bitwise.fi>
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi all,

This patchset adds support for the Xilinx CAN FD core to the
xilinx_can driver.

v2: Removed unnecessary "rx-mode" DT property and wrapped some long
lines.

This is on top of my previous patchsets:
- 2018-01-26 "[PATCH 0/5 resend] can: various fixes to xilinx_can driver"
- 2018-01-29 "[PATCH] can: xilinx_can: use can_change_state()"
- 2018-05-18 "[PATCH 0/4] can: fixes to xilinx_can".

All the changes are also here, rebased on top of linux-can master
(trivial rebase as there have been no other changes to the driver
recently):
https://github.com/anssih/linux/commits/dbf8cecccc8c8f0cfdf26a115b5a06f7497abf02

Let me know if you want me to post the previous patchsets again.


Anssi Hannula (3):
      dt-bindings: can: xilinx_can: add Xilinx CAN FD bindings
      can: xilinx_can: refactor code in preparation for CAN FD support
      can: xilinx_can: add support for Xilinx CAN FD core

 Documentation/devicetree/bindings/net/can/xilinx_can.txt |   35 -
 drivers/net/can/xilinx_can.c                             |  469 +++++++++++----
 2 files changed, 383 insertions(+), 121 deletions(-)

-- 
Anssi Hannula / Bitwise Oy
