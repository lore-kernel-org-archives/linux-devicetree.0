From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 0/3] Rockchip: rk3399: Add core dtsi for rk3399
Date: Fri, 26 Feb 2016 11:12:18 +0800
Message-ID: <1456456341-14282-1-git-send-email-jay.xu@rock-chips.com>
References: <1456210864-29037-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456210864-29037-1-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, broonie@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, linus.walleij@linaro.org, sjoerd.simons@collabora.co.uk, zhengxing@rock-chips.com
Cc: huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dianders@chromium.org, davidriley@chromium.org, smbarber@chromium.org, jwerner@chromium.org, Jianqun Xu <jay.xu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

There is the new SoCs from Rockchip which named rk3399, the
patches are added to support them.

Jianqun Xu (1):
  ARM64: dts: rockchip: add core dtsi file for rk3399

Xing Zheng (2):
  dt-bindings: add bindings for rk3399 clock controller
  clk: rockchip: add dt-binding header for rk3399

 .../bindings/clock/rockchip,rk3399-cru.txt         |  82 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 950 +++++++++++++++++++++
 include/dt-bindings/clock/rk3399-cru.h             | 716 ++++++++++++++++
 3 files changed, 1748 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

-- 
changes in v2:
- remove applied grf patch (applied by Heiko)
- add "rockchip,grf = <&pmugrf>" for pmucru node (xing)
- add NR_CLK defination (xing)

1.9.1
