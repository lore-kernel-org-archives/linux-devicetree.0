Return-Path: <SRS0=HrxS=KF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr710049.outbound.protection.outlook.com ([40.107.71.49]:34496
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727546AbeGUMmd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 21 Jul 2018 08:42:33 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv5 0/4] tty: serial: uartlite: Driver updates
Date: Sat, 21 Jul 2018 17:19:03 +0530
Message-ID: <1532173747-19115-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org, shubhrajyoti.datta@gmail.com, robh+dt@kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add clock and suspend resume support

v2:
lowercase for hex values
interrupt description updated
v3:
squashed the clock changes
v4:
make dt binding single patch
v5:
resend as the earlier series got mixed up.

Shubhrajyoti Datta (4):
  tty: serial: uartlite: Add structure for private data
  tty: serial: uartlite: Add clock adaptation
  tty: serial: uartlite: Add support for suspend and resume
  dt-bindings: serial: Add binding for uartlite

 .../bindings/serial/xlnx,opb-uartlite.txt          |  23 +++++
 drivers/tty/serial/uartlite.c                      | 112 +++++++++++++++++++--
 2 files changed, 126 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt

-- 
2.7.4

