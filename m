Return-Path: <SRS0=Md7O=SD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr750051.outbound.protection.outlook.com ([40.107.75.51]:9696
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728007AbfDAQhe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 1 Apr 2019 12:37:34 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 0/2] serial: uartps: Add modem support
Date: Mon, 1 Apr 2019 22:07:18 +0530
Message-ID: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add support for nomodem.
To add support for same.
 

Shubhrajyoti Datta (2):
  dt-bindings: xilinx-uartps: Add support for nomodem
  serial: uartps: Add support for nomodem

 Documentation/devicetree/bindings/serial/cdns,uart.txt |  4 ++++
 drivers/tty/serial/xilinx_uartps.c                     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

-- 
2.1.1
