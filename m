Return-Path: <SRS0=hILt=GK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0072.outbound.protection.outlook.com ([104.47.1.72]:31664
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752498AbeCTKl0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Mar 2018 06:41:26 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH 3/5] dt-bindings: usb: fusb302: remove max-sink-* properties
Date: Tue, 20 Mar 2018 18:26:07 +0800
Message-Id: <1521541570-25363-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
References: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, hdegoede@redhat.com, rmfrfs@gmail.com, yueyao.zhu@gmail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Remove max-sink-* properties since they are deprecated.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 Documentation/devicetree/bindings/usb/fcs,fusb302.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
index 472facf..6087dc7 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
+++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
@@ -6,12 +6,6 @@ Required properties :
 - interrupts             : Interrupt specifier
 
 Optional properties :
-- fcs,max-sink-microvolt : Maximum voltage to negotiate when configured as sink
-- fcs,max-sink-microamp  : Maximum current to negotiate when configured as sink
-- fcs,max-sink-microwatt : Maximum power to negotiate when configured as sink
-			   If this is less then max-sink-microvolt *
-			   max-sink-microamp then the configured current will
-			   be clamped.
 - fcs,operating-sink-microwatt :
 			   Minimum amount of power accepted from a sink
 			   when negotiating
-- 
2.7.4

