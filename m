From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 7/9] ARM: shmobile: lager: enable sysdma units 0 and 1
Date: Mon,  7 Apr 2014 21:07:07 +0100
Message-ID: <1396901229-29117-8-git-send-email-ben.dooks@codethink.co.uk>
References: <1396901229-29117-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1396901229-29117-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk, dmaengine@vger.kernel.org
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, linux-sh@vger.kernel.org, magnus.damm@opensource.se, horms@verge.net.au, g.liakhovetski@gmx.d, kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: devicetree@vger.kernel.org

Add the new sysdma units to the lager board.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 26a9010..3b4f59c 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -214,3 +214,11 @@
 	cd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
+
+&sysdma0 {
+	status = "okay";
+};
+
+&sysdma1 {
+	status = "okay";
+};
-- 
1.9.1

