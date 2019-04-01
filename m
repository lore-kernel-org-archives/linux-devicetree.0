Return-Path: <SRS0=Md7O=SD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr770053.outbound.protection.outlook.com ([40.107.77.53]:54981
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728007AbfDAQhh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 1 Apr 2019 12:37:37 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 1/2] dt-bindings: xilinx-uartps: Add support for nomodem
Date: Mon, 1 Apr 2019 22:07:19 +0530
Message-ID: <1554136640-25194-2-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Vivado has a configurationo for selecting the modem control.
Add a dt binding to check for the same.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
index 227bb77..3e96619 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
@@ -12,6 +12,10 @@ Required properties:
   See ../clocks/clock-bindings.txt for details.
 
 
+Optional properties:
+- xlnx,nomodem: The presence of this property indicates that the
+    UART does not support modem lines for RTS/CTS hardware flow control.
+
 Example:
 	uart@e0000000 {
 		compatible = "cdns,uart-r1p8";
-- 
2.1.1
