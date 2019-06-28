From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/4] regulator: add support for the STM32 ADC booster
Date: Fri, 28 Jun 2019 10:08:05 +0200
Message-ID: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for the 3.3V booster regulator embedded in stm32h7 and stm32mp1
devices, that can be used to supply ADC analog input switches.
It's useful to reach full ADC performance when their supply is below 2.7V
(vdda by default).

Fabrice Gasnier (4):
  dt-bindings: regulator: add support for the stm32-booster
  regulator: add support for the stm32-booster
  ARM: multi_v7_defconfig: enable STM32 booster regulator
  ARM: dts: stm32: add booster for ADC analog switches on stm32mp157c

 .../bindings/regulator/st,stm32-booster.txt        |  18 +++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   6 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/regulator/Kconfig                          |  11 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/stm32-booster.c                  | 132 +++++++++++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
 create mode 100644 drivers/regulator/stm32-booster.c

-- 
2.7.4
