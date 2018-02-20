Return-Path: <SRS0=XlNi=FO=gmail.com=digetx@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 01/15] dt-bindings: arm: tegra: Remove duplicated Tegra30+ MC binding
Date: Tue, 20 Feb 2018 19:25:14 +0300
Message-Id: <0d1b4a840954796f319621e481ec1a90baee98cc.1519141896.git.digetx@gmail.com>
In-Reply-To: <cover.1519141896.git.digetx@gmail.com>
References: <cover.1519141896.git.digetx@gmail.com>
In-Reply-To: <cover.1519141896.git.digetx@gmail.com>
References: <cover.1519141896.git.digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

There are two bindings for the same Memory Controller. One of the bindings
became obsolete long time ago and probably was left unnoticed, remove it
for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/arm/tegra/nvidia,tegra30-mc.txt           | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt
deleted file mode 100644
index bdf1a612422b..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-NVIDIA Tegra30 MC(Memory Controller)
-
-Required properties:
-- compatible : "nvidia,tegra30-mc"
-- reg : Should contain 4 register ranges(address and length); see the
-  example below. Note that the MC registers are interleaved with the
-  SMMU registers, and hence must be represented as multiple ranges.
-- interrupts : Should contain MC General interrupt.
-
-Example:
-	memory-controller {
-		compatible = "nvidia,tegra30-mc";
-		reg = <0x7000f000 0x010
-		       0x7000f03c 0x1b4
-		       0x7000f200 0x028
-		       0x7000f284 0x17c>;
-		interrupts = <0 77 0x04>;
-	};
-- 
2.16.1
