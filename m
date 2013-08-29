From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [RESEND PATCH V2 0/2] ARM: AM33xx: Add RNG Moudle data
Date: Thu, 29 Aug 2013 18:22:08 +0530
Message-ID: <1377780731-3648-1-git-send-email-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: bcousson@baylibre.com
Cc: paul@pwsan.com, tony@atomide.com, rnayak@ti.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, lokeshvutla@ti.com
List-Id: devicetree@vger.kernel.org

This Patch series adds HWMOD data and DT data for RNG module.

Reposting these patches as suggested by Paul Walmsley.
http://www.spinics.net/lists/arm-kernel/msg270678.html
Both these patches should go together because after adding 
Patch 1/2, hwmod wouldn't find the register iospace and crash,
and thats added only in dt.

Lokesh Vutla (2):
  ARM: dts: AM33xx: Add RNG node
  ARM: AM33xx: hwmod: Add RNG module data

 .../devicetree/bindings/hwrng/omap_rng.txt         |   22 ++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                      |    7 ++++
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |   36 ++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwrng/omap_rng.txt

-- 
1.7.9.5

