Return-Path: <SRS0=/YiW=SE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr770047.outbound.protection.outlook.com ([40.107.77.47]:4838
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbfDBFGc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 2 Apr 2019 01:06:32 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 0/2] serial: uartps: Make flowcontrol configurable
Date: Tue, 2 Apr 2019 10:36:16 +0530
Message-ID: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add support for nortscts.
To add support for same.
 

Shubhrajyoti Datta (2):
  dt-bindings: xilinx-uartps: Add support for noctsrts
  serial: uartps: Add support for nortscts

 Documentation/devicetree/bindings/serial/cdns,uart.txt |  4 ++++
 drivers/tty/serial/xilinx_uartps.c                     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

-- 
2.1.1
