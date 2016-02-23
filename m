From: John Keeping <john@metanate.com>
Subject: [PATCH 0/2] ARM: dts: rockchip: fix some interrupts on rk3288
Date: Tue, 23 Feb 2016 13:40:58 +0000
Message-ID: <1456234860-18832-1-git-send-email-john@metanate.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>
List-Id: devicetree@vger.kernel.org

None of these are used by drivers so these don't fix any bugs but maybe
they'll save someone debugging time in the future.

John Keeping (2):
  ARM: dts: rockchip: fix MIPI interrupt on rk3288
  ARM: dts: rockchip: fix audio interrupts on rk3288

 arch/arm/boot/dts/rk3288.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.0.226.gfe986fe
