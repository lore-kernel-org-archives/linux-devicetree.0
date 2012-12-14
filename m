From: Allen Martin <amartin@nvidia.com>
Subject: [PATCH] dt: fix tegra SPI binding examples
Date: Fri, 14 Dec 2012 11:05:12 -0800
Message-ID: <1355511912-23733-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: swarren@wwwdotorg.org, ldewangan@nvidia.com
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Allen Martin <amartin@nvidia.com>
List-Id: devicetree@vger.kernel.org

Fix name of slink binding and address of sflash example to make it
self consistent.

Change-Id: Ia89c3017c958bdf670036caf516eabce6f893096
Signed-off-by: Allen Martin <amartin@nvidia.com>
---
 Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt |    2 +-
 Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
index 8cf24f6..7b53da5 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
@@ -13,7 +13,7 @@ Recommended properties:
 
 Example:
 
-spi@7000d600 {
+spi@7000c380 {
 	compatible = "nvidia,tegra20-sflash";
 	reg = <0x7000c380 0x80>;
 	interrupts = <0 39 0x04>;
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt
index f5b1ad1..eefe15e 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt
@@ -13,7 +13,7 @@ Recommended properties:
 
 Example:
 
-slink@7000d600 {
+spi@7000d600 {
 	compatible = "nvidia,tegra20-slink";
 	reg = <0x7000d600 0x200>;
 	interrupts = <0 82 0x04>;
-- 
1.7.10.4

