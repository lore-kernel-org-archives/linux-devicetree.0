Return-Path: <SRS0=xUMM=UN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16153 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfFNHsn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Jun 2019 03:48:43 -0400
From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 7/8] arm64: tegra: add Tegra210 XUSB PADCTL irq
Date: Fri, 14 Jun 2019 15:48:23 +0800
Message-ID: <20190614074824.22023-3-jckuo@nvidia.com>
In-Reply-To: <20190614074824.22023-1-jckuo@nvidia.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

XUSB PADCTL interrupt will be raised when USB wake event happens.
This is required for supporting XUSB host controller ELPG.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a550c0a4d572..7496302a1a8a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -909,7 +909,8 @@
 		reg-names = "hcd", "fpci", "ipfs";
 
 		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 
 		clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>,
 			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
-- 
2.17.1
