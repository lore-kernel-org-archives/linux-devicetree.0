Return-Path: <SRS0=xgCA=HW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-by2nam01on0049.outbound.protection.outlook.com ([104.47.34.49]:63384
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750954AbeECJAG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 3 May 2018 05:00:06 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio-xilinx: Update no-init property
Date: Thu, 3 May 2018 14:35:45 +0530
Message-ID: <1525338346-31684-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, git-dev@xilinx.com
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, michals@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

In some cases the user may not want to initialise the
gpios to default. Add a property to allow the same. This is specially
useful in case the PS is reset and PL is not.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/gpio/gpio-xilinx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
index 63bf4be..3a09d9e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
@@ -25,6 +25,7 @@ Optional properties:
 - xlnx,dout-default-2 : as above but the second channel
 - xlnx,gpio2-width : as above but for the second channel
 - xlnx,tri-default-2 : as above but for the second channel
+- xlnx,no-init : No initialisation at probe
 
 
 Example:
-- 
2.1.1

