Return-Path: <SRS0=8UYE=GN=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 3/5] dt-bindings: usb: fusb302: remove max-sink-* properties
Date: Fri, 23 Mar 2018 22:58:45 +0800
Message-Id: <1521817127-23061-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
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
