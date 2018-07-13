Return-Path: <SRS0=tHxF=J5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-co1nam03on0045.outbound.protection.outlook.com ([104.47.40.45]:36160
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727161AbeGMKtY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Jul 2018 06:49:24 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 5/5] dt-bindings: serial: Add clock to the binding for uartlite
Date: Fri, 13 Jul 2018 16:00:10 +0530
Message-ID: <1531477810-23346-5-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1531477810-23346-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1531477810-23346-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add clock to the binding for uartlite

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
index cae95e6..52719b9 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
@@ -11,6 +11,8 @@ Required properties:
 
 Optional properties:
 - port-number		: Set Uart port number
+- clock-names		: Should be "s_axi_aclk"
+- clocks		: Input clock specifier. Refer to common clock bindings.
 
 Example:
 serial@800c0000 {
-- 
2.7.4

