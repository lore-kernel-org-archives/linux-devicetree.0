Return-Path: <SRS0=m20R=QU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:12415 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730377AbfBMNRi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Feb 2019 08:17:38 -0500
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Disable CQE Support for SDMMC4 on Tegra186
Date: Wed, 13 Feb 2019 13:17:29 +0000
Message-ID: <1550063849-24719-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Jonathan Hunter <jonathanh@nvidia.com>

Enabling CQE support on Tegra186 Jetson TX2 has introduced a regression
that is causing accesses to the file-system on the eMMC to fail. Errors
such as the following have been observed ...

 mmc2: running CQE recovery
 mmc2: mmc_select_hs400 failed, error -110
 print_req_error: I/O error, dev mmcblk2, sector 8 flags 80700
 mmc2: cqhci: CQE failed to exit halt state

For now disable CQE support for Tegra186 until this issue is resolved.

Fixes: dfd3cb6feb73 arm64: tegra: Add CQE Support for SDMMC4
Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index bb2045be8814..97aeb946ed5e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -321,7 +321,6 @@
 		nvidia,default-trim = <0x9>;
 		nvidia,dqs-trim = <63>;
 		mmc-hs400-1_8v;
-		supports-cqe;
 		status = "disabled";
 	};
 
-- 
1.9.1
