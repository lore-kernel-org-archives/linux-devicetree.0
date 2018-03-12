Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 3/9] arm64: tegra: Enable AHCI on Jetson TX1
Date: Mon, 12 Mar 2018 17:10:32 +0530
Message-ID: <1520854838-21779-4-git-send-email-pchandru@nvidia.com>
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

Enable AHCI on Jetson TX1 and add sata phy node.

Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
---
v8:
* Split this patch into two separate patches, one for the SoC .dtsi
  and another for the P2597 carrier.
v7:
* Change commit message to reflect accordingly
v4:
* Fixed missing space after 'AUX'
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index d67ef4319f3b..9d5a0e6b2ca4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1325,6 +1325,11 @@
 		status = "okay";
 	};
 
+	sata@70020000 {
+		status = "okay";
+		phys = <&{/padctl@7009f000/pads/sata/lanes/sata-0}>;
+	};
+
 	padctl@7009f000 {
 		status = "okay";
 
-- 
2.7.4
