Return-Path: <SRS0=ZGg2=XH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.gallagher.co.nz ([203.167.229.98]:20690 "EHLO
        mail.gallagher.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfILCED (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Sep 2019 22:04:03 -0400
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
Subject: [PATCH 1/2] dt-bindings: clock: am33xx: Update GPIO number as per datasheet
Date: Wed, 11 Sep 2019 18:48:49 -0700
Message-Id: <20190912014849.10684-1-ankur.tyagi@gallagher.com>
Sender: devicetree-owner@vger.kernel.org
To: t-kristo@ti.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: ankur.tyagi@gallagher.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Sitara technical reference manual numbers GPIO from 0-3 whereas
in code GPIO are numbered from 1-4.

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 include/dt-bindings/clock/am3.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/dt-bindings/clock/am3.h b/include/dt-bindings/clock/am3.h
index 894951541276..980fdc05c3d0 100644
--- a/include/dt-bindings/clock/am3.h
+++ b/include/dt-bindings/clock/am3.h
@@ -41,9 +41,9 @@
 #define AM3_RNG_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x90)
 #define AM3_AES_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x94)
 #define AM3_SHAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xa0)
-#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
-#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
-#define AM3_GPIO4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
+#define AM3_GPIO1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
+#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
+#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
 #define AM3_TPCC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xbc)
 #define AM3_D_CAN0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc0)
 #define AM3_D_CAN1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc4)
@@ -69,7 +69,7 @@
 #define AM3_L4_WKUP_CLKCTRL_OFFSET	0x4
 #define AM3_L4_WKUP_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_WKUP_CLKCTRL_OFFSET)
 #define AM3_CONTROL_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x4)
-#define AM3_GPIO1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
+#define AM3_GPIO0_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
 #define AM3_L4_WKUP_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc)
 #define AM3_DEBUGSS_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x14)
 #define AM3_WKUP_M3_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb0)
@@ -121,9 +121,9 @@
 #define AM3_L4LS_TIMER3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x84)
 #define AM3_L4LS_TIMER4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x88)
 #define AM3_L4LS_RNG_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x90)
-#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
-#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
-#define AM3_L4LS_GPIO4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
+#define AM3_L4LS_GPIO1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
+#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
+#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
 #define AM3_L4LS_D_CAN0_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc0)
 #define AM3_L4LS_D_CAN1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc4)
 #define AM3_L4LS_EPWMSS1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xcc)
@@ -184,7 +184,7 @@
 
 /* l4_wkup clocks */
 #define AM3_L4_WKUP_CONTROL_CLKCTRL	AM3_CLKCTRL_INDEX(0x4)
-#define AM3_L4_WKUP_GPIO1_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
+#define AM3_L4_WKUP_GPIO0_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
 #define AM3_L4_WKUP_L4_WKUP_CLKCTRL	AM3_CLKCTRL_INDEX(0xc)
 #define AM3_L4_WKUP_UART1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb4)
 #define AM3_L4_WKUP_I2C1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb8)
-- 
2.17.1


###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
