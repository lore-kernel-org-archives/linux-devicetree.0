From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 01/10] MAINTAINERS: Update Broadcom iProc regexp with Hurricane 2
Date: Mon, 25 Sep 2017 17:09:22 -0700
Message-ID: <20170926000931.670-2-f.fainelli@gmail.com>
References: <20170926000931.670-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926000931.670-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Update the Broadcom iProc regepx with recently added Hurricane 2 SoC support.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6671f375f7fc..3b48a1c2ddb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2923,6 +2923,7 @@ N:	bcm583*
 N:	bcm585*
 N:	bcm586*
 N:	bcm88312
+N:	hr2
 F:	arch/arm64/boot/dts/broadcom/ns2*
 F:	drivers/clk/bcm/clk-ns*
 F:	drivers/pinctrl/bcm/pinctrl-ns*
-- 
2.14.1
