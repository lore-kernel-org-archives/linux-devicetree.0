Return-Path: <SRS0=9fbT=HQ=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] dt-bindings: Relocate Tegra20 memory controller bindings
Date: Fri, 27 Apr 2018 11:18:14 +0200
Message-Id: <20180427091814.25940-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Move the device tree bindings for the Tegra20 memory controller to the
same location as the Tegra30 (and later) memory controller bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../{arm/tegra => memory-controllers}/nvidia,tegra20-mc.txt       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-mc.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt
rename to Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
-- 
2.17.0
