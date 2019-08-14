Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57566 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfHNNCq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 09:02:46 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/5] Drop more legacy platform data for omap4
Date: Wed, 14 Aug 2019 06:02:35 -0700
Message-Id: <20190814130240.56202-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi all,

Here's a series that drops more legacy platform data for omap4
for i2c, watchdogs and d2d modules.

Regards,

Tony


Tony Lindgren (5):
  ARM: dts: Drop custom hwmod property for omap4 i2c
  ARM: OMAP2+: Drop legacy watchdog platform data for omap4
  ARM: dts: Configure d2d dts data for omap4
  ARM: OMAP2+: Drop legacy platform data for omap4 d2d
  bus: ti-sysc: Detect d2d when debug is enabled

 arch/arm/boot/dts/omap4-l4-abe.dtsi        |   1 -
 arch/arm/boot/dts/omap4-l4.dtsi            |  39 +++++--
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 115 ---------------------
 drivers/bus/ti-sysc.c                      |   2 +
 4 files changed, 32 insertions(+), 125 deletions(-)

-- 
2.21.0
