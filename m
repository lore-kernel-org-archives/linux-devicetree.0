Return-Path: <SRS0=yDWK=H3=rock-chips.com=shawn.lin@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v3 1/2] Documentation: mmc: addtional description for post-power-on-delay-ms
Date: Tue,  8 May 2018 09:04:19 +0800
Message-Id: <1525741460-109455-1-git-send-email-shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

post-power-on-delay-ms woule be reused to substitute the hard-coded 10ms
delay waiting for power supply to be stable, specificed by individual
platform/board. Default to 10ms as before, if no available.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v3:
- reused post-power-on-delay-ms suggested by Rob

Changes in v2: None

 Documentation/devicetree/bindings/mmc/mmc.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index 467cd7b..a1d0cf4 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -56,6 +56,10 @@ Optional properties:
 - fixed-emmc-driver-type: for non-removable eMMC, enforce this driver type.
   The value <n> is the driver type as specified in the eMMC specification
   (table 206 in spec version 5.1).
+- post-power-on-delay-ms : It was invented for MMC pwrseq-simple which could
+  be referred to mmc-pwrseq-simple.txt. But now it's reused as a tunable delay
+  waiting for I/O signalling and card power supply to be stable, regardless of
+  whether pwrseq-simple is used. Default to 10ms if no available.
 
 *NOTE* on CD and WP polarity. To use common for all SD/MMC host controllers line
 polarity properties, we have to fix the meaning of the "normal" and "inverted"
-- 
1.9.1
