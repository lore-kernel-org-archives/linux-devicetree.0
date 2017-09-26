From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 04/10] dt-bindings: Document Broadcom Hurricane 2 clocks
Date: Mon, 25 Sep 2017 17:09:25 -0700
Message-ID: <20170926000931.670-5-f.fainelli@gmail.com>
References: <20170926000931.670-1-f.fainelli@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170926000931.670-1-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a Device Tree binding document for the Broadcom Hurricane 2 SoC
which is an iProc based system.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/clock/brcm,iproc-clocks.txt        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
index f2c5f0e4a363..f8e4a93466cb 100644
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
@@ -137,6 +137,20 @@ These clock IDs are defined in:
     ch1_audio  audiopll         2       BCM_CYGNUS_AUDIOPLL_CH1
     ch2_audio  audiopll         3       BCM_CYGNUS_AUDIOPLL_CH2
 
+Hurricane 2
+------
+PLL and leaf clock compatible strings for Hurricane 2 are:
+ "brcm,hr2-armpll"
+
+The following table defines the set of PLL/clock for Hurricane 2:
+
+    Clock	Source		Index	ID
+    ---		-----		-----	---------
+    crystal	N/A		N/A	N/A
+
+    armpll	crystal		N/A	N/A
+
+
 Northstar and Northstar Plus
 ------
 PLL and leaf clock compatible strings for Northstar and Northstar Plus are:
-- 
2.14.1

