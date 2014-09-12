From: Jianqun <jay.xu@rock-chips.com>
Subject: [PATCH 0/2] rockchip-max98090: add driver for rockchip board with max98090
Date: Fri, 12 Sep 2014 15:26:46 +0800
Message-ID: <1410506806-15327-1-git-send-email-jay.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, heiko@sntech.de, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, jay.xu@rock-chips.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: huangtao@rock-chips.com, cf@rock-chips.com
List-Id: devicetree@vger.kernel.org

This patch to add driver for rockchip board using a max98090.

Tested on RK3288 using a max98090.

Jianqun (2):
  ASoC: rockchip-max98090: add documentation for rockchip-max98090
    driver
  ASoC: rockchip-max98090: add driver for rockchip board using a
    max98090

 .../sound/rockchip,rockchip-audio-max98090.txt     |  23 ++
 sound/soc/rockchip/Kconfig                         |   9 +
 sound/soc/rockchip/Makefile                        |   5 +-
 sound/soc/rockchip/rockchip_max98090.c             | 308 +++++++++++++++++++++
 4 files changed, 344 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.txt
 create mode 100644 sound/soc/rockchip/rockchip_max98090.c

-- 
1.9.1
