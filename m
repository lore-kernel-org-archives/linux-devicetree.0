Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:58463 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758543Ab3HNU1T (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 16:27:19 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 2/2] ARM: tegra: add Mic Jack to Cardhu device tree
Date: Wed, 14 Aug 2013 14:27:07 -0600
Message-Id: <1376512027-28245-2-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org>
References: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

This enables the microphone input jack, and hence allows audio to be
captured as well as played back.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 402c20b..45056a2 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1193,7 +1193,9 @@
 			"Speakers", "SPORP",
 			"Speakers", "SPORN",
 			"Speakers", "SPOLP",
-			"Speakers", "SPOLN";
+			"Speakers", "SPOLN",
+			"Mic Jack", "MICBIAS1",
+			"IN2P", "Mic Jack";
 
 		nvidia,i2s-controller = <&tegra_i2s1>;
 		nvidia,audio-codec = <&rt5640>;
-- 
1.8.1.5

