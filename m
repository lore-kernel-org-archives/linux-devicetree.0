Return-Path: <SRS0=gJgO=WW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:58710 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729144AbfHZSCm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:42 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/6] drop more platform data for dra7
Date: Mon, 26 Aug 2019 11:02:31 -0700
Message-Id: <20190826180237.31571-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Vignesh R <vigneshr@ti.com>
List-ID: <devicetree@vger.kernel.org>

Hi all,

Here are few more trivial changes to drop legacy platform data for dra7.

These are based on my omap-for-v5.4/ti-sysc-drop-pdata branch.

Regards,

Tony


Tony Lindgren (6):
  ARM: OMAP2+: Drop legacy platform data for dra7 mcspi
  ARM: OMAP2+: Drop legacy platform data for dra7 mcasp
  ARM: dts: Drop legacy custom hwmods property for dra7 uart
  ARM: dts: Drop legacy custom hwmods property for dra7 i2c
  ARM: dts: Drop legacy custom hwmods property for dra7 mmc
  ARM: dts: Drop legacy custom hwmods property for dra7 gpio

 arch/arm/boot/dts/dra7-l4.dtsi            |  39 --
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 410 ----------------------
 2 files changed, 449 deletions(-)

-- 
2.23.0
