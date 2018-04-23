Return-Path: <SRS0=kDyz=HM=rock-chips.com=shawn.lin@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 1/2] Documentation: mmc: add description for power-delay-ms
Date: Mon, 23 Apr 2018 16:10:29 +0800
Message-Id: <1524471030-3527-1-git-send-email-shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

power-delay-ms woule be used to substitute the hard-coded 10ms
delay waiting for power supply to be stable, specificed by individual
platform/board. Default to 10ms as before, if no available.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index 467cd7b..8db2ba0 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -56,6 +56,8 @@ Optional properties:
 - fixed-emmc-driver-type: for non-removable eMMC, enforce this driver type.
   The value <n> is the driver type as specified in the eMMC specification
   (table 206 in spec version 5.1).
+- power-delay-ms: Tunable delay waiting for I/O signalling and card power supply
+  to be stable. Default to 10ms if no available.
 
 *NOTE* on CD and WP polarity. To use common for all SD/MMC host controllers line
 polarity properties, we have to fix the meaning of the "normal" and "inverted"
-- 
1.9.1
