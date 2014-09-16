From: Jonathan Richardson <jonathar@broadcom.com>
Subject: [PATCH 6/6] MAINTAINERS: Entry for Cygnus/iproc arm architecture and clock drivers
Date: Tue, 16 Sep 2014 12:58:17 -0700
Message-ID: <1410897497-27527-7-git-send-email-jonathar@broadcom.com>
References: <Jonathan Richardson <jonathar@broadcom.com>
 <1410897497-27527-1-git-send-email-jonathar@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410897497-27527-1-git-send-email-jonathar@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, JD Zheng <jdzheng@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>
List-Id: devicetree@vger.kernel.org

Tested-by: Jonathan Richardson <jonathar@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
Signed-off-by: Jonathan Richardson <jonathar@broadcom.com>
---
 MAINTAINERS |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 809ecd6..2152ee0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2070,6 +2070,27 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/bnx2i/
 
+BROADCOM CYGNUS/IPROC ARM ARCHITECTURE
+M:	Jonathan Richardson <jonathar@broadcom.com>
+M:	Scott Branden <sbranden@broadcom.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cygnus.txt
+F:	arch/arm/boot/dts/bcm-cygnus.dtsi
+F:	arch/arm/boot/dts/bcm911360_entphn.dts
+F:	arch/arm/configs/bcm_cygnus_defconfig
+F:	arch/arm/mach-bcm/board_bcm_cygnus.c
+
+BROADCOM CYGNUS/IPROC CLOCK DRIVERS
+M:	Jonathan Richardson <jonathar@broadcom.com>
+M:	Scott Branden <sbranden@broadcom.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/clk-cygnus.txt
+F:	Documentation/devicetree/bindings/clock/clk-iproc.txt
+F:	drivers/clk/bcm/clk-cygnus.c
+F:	drivers/clk/bcm/clk-iproc.c
+
 BROADCOM KONA GPIO DRIVER
 M:	Ray Jui <rjui@broadcom.com>
 L:	bcm-kernel-feedback-list@broadcom.com
-- 
1.7.9.5
