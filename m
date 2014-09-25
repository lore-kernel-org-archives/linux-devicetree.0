From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v3 0/3] Add clock binding id for rk3288
Date: Thu, 25 Sep 2014 15:48:44 +0800
Message-ID: <1411631328-14973-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, Mike Turquette <mturquette@linaro.org>
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch add some clock binding id for different modules
that under development and going to send upstream.

This patch also add the clock node in PD_VIDEO.

Changes in v3:
- add a fix factor
- introduce a virtual node to implement the clock struct

Changes in v2:
- split into two patches of add clock node in PD_VIDEO and
  use new defined clock ID
- split out the patch

Kever Yang (3):
  clk: rockchip: add some needed clock binding id for rk3288
  clk: rockchip: use the clock id for nodes init
  clk: rockchip: add clock node in PD_VIDEO

 drivers/clk/rockchip/clk-rk3288.c      | 88 +++++++++++++++++++++-------------
 include/dt-bindings/clock/rk3288-cru.h | 38 ++++++++++++++-
 2 files changed, 91 insertions(+), 35 deletions(-)

-- 
1.9.1
