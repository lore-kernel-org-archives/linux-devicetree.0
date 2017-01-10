From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v4 0/2] Add support rockchip,grf property for RK3399 PMU/GRU
Date: Tue, 10 Jan 2017 14:15:28 +0800
Message-ID: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@google.com, linux-rockchip@lists.infradead.org, Xing Zheng <zhengxing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, David Wu <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Elaine Zhang <zhangqing@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hi,
  The structure rockchip_clk_provider needs to refer the GRF regmap
in somewhere, if the CRU node has not "rockchip,grf" property,
calling syscon_regmap_lookup_by_phandle will return an invalid GRF
regmap, and the MUXGRF type clock will be not supported.

Therefore, we need to add them.

Thanks.


Changes in v4:
- separte the binding patch
- update the decription for rockchip,grf property

Changes in v3:
- add optional roperty rockchip,grf in rockchip,rk3399-cru.txt

Changes in v2:
- referring pmugrf for PMUGRU
- fix the typo "invaild" in COMMIT message

Xing Zheng (2):
  arm64: dts: rockchip: add "rockchip, grf" property for RK3399
    PMUCRU/CRU
  dt-bindings: clk: add rockchip,grf property for RK3399

 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt | 6 ++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi                        | 2 ++
 2 files changed, 8 insertions(+)

-- 
2.7.4


