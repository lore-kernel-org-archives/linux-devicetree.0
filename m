From: Oskari Lemmela <oskari@lemmela.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: rockpro64 dts issues
Date: Sat,  1 Dec 2018 12:08:15 +0200
Message-ID: <20181201100817.20688-1-oskari@lemmela.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Akash Gajjar <Akash_Gajjar@mentor.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Oskari Lemmela <oskari@lemmela.net>
List-Id: devicetree@vger.kernel.org

I found two issues from new rk3399-rockpro64.dts file.

First one is incorrect regulator mapping. Rockpro64 has bit different
GPIO ports used than firefly board. Board is not able boot if GPIO
pins are not inited by bootloader.

Second issue is that dts have video output enabled but no outputs
enabled. Kernel will freeze if CONFIG_DRM_ROCKCHIP is compiled in.

Oskari Lemmela (2):
  arm64: dts: rockchip: rockpro64 fix regulator gpios
  arm64: dts: rockchip: rockpro64 fix video output chain

 .../boot/dts/rockchip/rk3399-rockpro64.dts    | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.17.1
