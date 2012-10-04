From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 5/9] ARM/dts: omap5-evm: Disable unused McBSP3
Date: Thu,  4 Oct 2012 14:57:24 +0300
Message-ID: <1349351848-12972-6-git-send-email-peter.ujfalusi@ti.com>
References: <1349351848-12972-1-git-send-email-peter.ujfalusi@ti.com>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1349351848-12972-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

McBSP3 is not usable on OMAP4 SDP/Blaze (the pins used for McPDM).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/omap5-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/omap5-evm.dts b/arch/arm/boot/dts/omap5-evm.dts
index 9c41a3f..825e607 100644
--- a/arch/arm/boot/dts/omap5-evm.dts
+++ b/arch/arm/boot/dts/omap5-evm.dts
@@ -82,3 +82,7 @@
 			0x020700d9>;	/* SEARCH */
 	linux,input-no-autorepeat;
 };
+
+&mcbsp3 {
+	status = "disabled";
+};
-- 
1.7.12

