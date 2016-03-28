From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] ARM: dts: kirkwood: add kirkwood-ds112.dtb to Makefile
Date: Mon, 28 Mar 2016 10:03:48 +0200
Message-ID: <1459152228-4345-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Russell King <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Ben Peddell <klightspeed@killerwolves.net>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

Commit 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology
NAS devices") created the new file kirkwood-ds112.dts but did not
add it to the Makefile.

Fixes: 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NAS devices")
Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/arm/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b25621a..f8308db 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) += \
 	kirkwood-ds109.dtb \
 	kirkwood-ds110jv10.dtb \
 	kirkwood-ds111.dtb \
+	kirkwood-ds112.dtb \
 	kirkwood-ds209.dtb \
 	kirkwood-ds210.dtb \
 	kirkwood-ds212.dtb \
-- 
2.1.4
