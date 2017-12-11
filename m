From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/5] Add STM32F769 pinctrl support
Date: Mon, 11 Dec 2017 10:37:42 +0100
Message-ID: <1512985062-1147-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds STM32F769 pinctrl and GPIO support, relies on the
generic STM32 pinctrl driver. It also changes stm32f7 device tree 
structure to use dedicated files for stm32f746 pinctrl and stm32f769
pinctrl.

Regards
Alex

Alexandre Torgue (5):
  dt-bindings: pinctrl: Add st,stm32f769-pinctrl compatible to
    stm32-pinctrl
  pinctrl: stm32: add STM32F769 MCU support
  ARM: mach-stm32: Kconfig: introduce MACH_STM32F769 flag
  ARM: mach-stm32: add new STM32F769 MCU
  ARM: dts: stm32: use dedicated files for pinctrl on stm32f7 family

 Documentation/arm/stm32/stm32f769-overview.txt     |   36 +
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    1 +
 arch/arm/boot/dts/stm32746g-eval.dts               |    1 +
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi             |  227 +++
 arch/arm/boot/dts/stm32f746-disco.dts              |    1 +
 arch/arm/boot/dts/stm32f746-pinctrl.dtsi           |   11 +
 arch/arm/boot/dts/stm32f746.dtsi                   |  217 ---
 arch/arm/boot/dts/stm32f769-disco.dts              |    3 +-
 arch/arm/boot/dts/stm32f769-pinctrl.dtsi           |   11 +
 arch/arm/mach-stm32/Kconfig                        |    5 +
 arch/arm/mach-stm32/board-dt.c                     |    1 +
 drivers/pinctrl/stm32/Kconfig                      |    6 +
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32f769.c          | 1827 ++++++++++++++++++++
 14 files changed, 2130 insertions(+), 218 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32f769-overview.txt
 create mode 100644 arch/arm/boot/dts/stm32f7-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32f746-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32f769-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f769.c

-- 
2.7.4
