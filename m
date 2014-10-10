From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv5 0/3] regulator: of: Add support for parsing regulator suspend
 state
Date: Fri, 10 Oct 2014 20:35:32 +0900
Message-ID: <1412940935-14721-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, kyungmin.park@samsung.com, javier@dowhile0.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

The regulators would set different state/mode according to the kind of suspend
state. So regulation_constraints structure has already regulator suspend state filed.
This patch parse regulator suspend state from devicetree file.

I tested this patch on Rinato board (Samsung Gear 2) included S2MPS14 PMIC.
- The power-consumption in suspend state is 0.6mA after applied this patchset.

For example:
	ldoX_reg: LDOx {
		regulator-name = "VAP_XXX_1.2V";
		regulator-min-microvolt = <1200000>;
		regulator-max-microvolt = <1200000>;
		regulator-always-on;

		regulator-state-mem {
			regulator-off-in-suspend;
		};
	};

Changes from v4:
- Rebase this patchset on for-next branch of regulator.git
- Remove 'regulator-volt' property
- Remove 'regulator-initial-state' property
- Add example patch[1, patch3] based on Rinato board[2] included S2MPS14 PMIC.
  S2MPS14 PMIC patch[3] has already implemented '.set_suspend_disable()' func
  to change the regulator state to reduce power-consumption in suspend-state.
  [1] ARM: dts: Add sleep mode of regulator for exynos3250-rinato board
  [2] http://www.spinics.net/lists/linux-samsung-soc/msg37636.html
      - [PATCHv2 0/2] ARM: dts: Add new board dts file for Exynos3250-based Rinato board
      - This patchset is not yet merged.
  [3] regulator: s2mps11: Add set_suspend_disable for S2MPS14
      (commid id: 05be09bb5ec8d12051515087a1983745dc93d906)

Changes from v3:
- Don't support 'regulator-state-standby' mode
- Remove 'regulator-mode' property

Changes from v2:
- Fix over 80 lines by using checkpatch script
- Rebase this patchset on latest for-next branch of regulator.git

Changes from v1:
- Check whether regulator-initial-state and regulator-mode is correct or not
- Add more detailed description about regulator-initial-state, regulator-mode
  and regulator-state-[standby/mem/disk] for devicetree bindings
- Modify example of regulator suspend state in bindings documentation

Chanwoo Choi (3):
  regulator: of: Add support for parsing regulator_state for suspend state
  dt-bindings: regulator: Add regulator suspend state for PM state
  ARM: dts: Add sleep mode of regulator for exynos3250-rinato board

 .../devicetree/bindings/regulator/regulator.txt    |  13 +++
 arch/arm/boot/dts/exynos3250-rinato.dts            | 108 +++++++++++++++++++++
 drivers/regulator/of_regulator.c                   |  39 +++++++-
 3 files changed, 159 insertions(+), 1 deletion(-)

-- 
1.8.0
