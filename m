From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH 0/2] add basic rk3288 smp support
Date: Wed, 10 Sep 2014 18:05:52 +0800
Message-ID: <1410343554-8383-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

rk3288 is dual-core CPU Soc, we need to enable the smp.
This patchset works with either arch-timer use the phisical counter
in kernel or the firmware initialize the arch-timer virtual counter
offset and use virtual counter in kernel.


Kever Yang (2):
  ARM: rockchip: add basic smp support for rk3288
  ARM: dts: add intmem node for rk3288 smp support

 arch/arm/boot/dts/rk3288.dtsi    | 18 ++++++++++++
 arch/arm/mach-rockchip/core.h    |  1 +
 arch/arm/mach-rockchip/platsmp.c | 60 +++++++++++++++++++++++++++++++++++++---
 3 files changed, 75 insertions(+), 4 deletions(-)

-- 
1.9.1
