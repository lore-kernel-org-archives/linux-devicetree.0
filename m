From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 7/7] ARM: dts: aspeed: witherspoon: Enable XDMA Engine
Date: Mon, 20 May 2019 15:19:25 -0500
Message-ID: <1558383565-11821-8-git-send-email-eajames@linux.ibm.com>
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Enable the XDMA engine node.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index f1356ca..9d02759 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -640,3 +640,7 @@
 &vhub {
 	status = "okay";
 };
+
+&xdma {
+	status = "okay";
+};
-- 
1.8.3.1
