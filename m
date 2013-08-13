Return-Path: <devicetree-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13074 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756071Ab3HMHik (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 03:38:40 -0400
From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 1/3] regulator: palmas: Update the DT binding doc for smps10 out1 and out2
Date: Tue, 13 Aug 2013 13:23:10 +0530
Message-ID: <1376380392-19723-2-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1376380392-19723-1-git-send-email-ldewangan@nvidia.com>
References: <1376380392-19723-1-git-send-email-ldewangan@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, sameo@linux.intel.com
Cc: swarren@wwwdotorg.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, lee.jones@linaro.org, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, j-keerthy@ti.com, ian.campbell@citrix.com, Laxman Dewangan <ldewangan@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Palmas regulator SMPS10 is splitted into two regulators SMPS10-OUT1 and
SMPS10-OUT2 to match with hw behavior. With this regulator's name got
changed in driver.

Update the DT binding document to match with driver.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
Fix typos: palams ->palmas, mps to smps

 .../devicetree/bindings/regulator/palmas-pmic.txt  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/palmas-pmic.txt b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
index 30b0581..a22e4c7 100644
--- a/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
+++ b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
@@ -25,8 +25,8 @@ Optional nodes:
 	       Additional custom properties  are listed below.
 
 	       For ti,palmas-pmic - smps12, smps123, smps3 depending on OTP,
-	       smps45, smps457, smps7 depending on variant, smps6, smps[8-10],
-	       ldo[1-9], ldoln, ldousb.
+	       smps45, smps457, smps7 depending on variant, smps6, smps[8-9],
+	       smps10_out2, smps10_out1, do[1-9], ldoln, ldousb.
 
 	       Optional sub-node properties:
 	       ti,warm-reset - maintain voltage during warm reset(boolean)
-- 
1.7.1.1

