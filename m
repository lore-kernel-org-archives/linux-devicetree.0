From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 0/2] Add input supplies to rk808 regulator
Date: Tue,  2 Sep 2014 09:14:27 -0700
Message-ID: <1409674469-12123-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Chris Zhong <zyw@rock-chips.com>
Cc: Sonny Rao <sonnyrao@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Doug Anderson <dianders@chromium.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, zhangqing@rock-chips.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

We want to specify the input supplies to the rk808 regulator.  This
patch series adds them to the driver.  Note that the bindings are
based atop Chris's most recent version at
<https://patchwork.kernel.org/patch/4817931/>.  If the regulator patch
is applied before Chris sends out his next version then I think Chris
could squash my bindings change (patch 2) into his next version.


Doug Anderson (2):
  regulator: RK808: Add proper input supplies for rk808
  dt-bindings: Add input supplies to rk808 bindings

 Documentation/devicetree/bindings/mfd/rk808.txt | 11 +++++++++++
 drivers/regulator/rk808-regulator.c             | 15 ++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.1.0.rc2.206.gedb03e5
