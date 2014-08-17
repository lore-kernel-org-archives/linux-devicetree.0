From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH 0/4] Add rockchip RK808 pmic driver
Date: Sun, 17 Aug 2014 09:53:27 +0800
Message-ID: <1408240407-29387-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, grant.likely@linaro.org, hl@rock-chips.com, huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, dtor@chromium.org, javier.martinez@collabora.co.uk, kever.yang@rock-chips.com, Chris Zhong <zyw@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This is the initial version of the RK808 PMIC. This is a power management IC
for multimedia products.

It provides regulators that are able to supply power to processor cores
and other components. The chip provides other modules including RTC, Clockout

Chris Zhong (4):
  MFD: Add rk808 device tree bindings documentation
  MFD: RK808: Add new mfd device for RK808
  RK808: Add rk808 regulator driver
  RTC: rk808: add RTC driver for RK808 PMIC RTC


-- 
1.7.9.5
