Return-Path: <SRS0=NMQj=SL=gmail.com=shubhrajyoti.datta@kernel.org>
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv3 0/2] serial: uartps: Make flowcontrol configurable
Date: Tue, 9 Apr 2019 13:15:22 +0530
Message-ID: <1554795924-12053-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add support for making flow control configurable.
To add support for same.

changes from v2:
Update the name of the binding

Shubhrajyoti Datta (2):
  dt-bindings: xilinx-uartps: Add support for cts-override
  serial: uartps: Add support for cts-override

 Documentation/devicetree/bindings/serial/cdns,uart.txt |  5 +++++
 drivers/tty/serial/xilinx_uartps.c                     | 12 ++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.1.1
