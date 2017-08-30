From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v4] ARM: dts: stm32: change pinctrl bindings definition
Date: Wed, 30 Aug 2017 16:50:52 +0200
Message-ID: <1504104653-26804-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vikas.manocha@st.com
List-Id: devicetree@vger.kernel.org

Initially each pin was declared in "include/dt-bindings/stm32<SOC>-pinfunc.h"
and each definition contained SOC names (ex: STM32F429_PA9_FUNC_USART1_TX).
Since this approach was approved, the number of supported MCU has
increased (STM32F429/STM32F469/STM32f746/STM32H743). To avoid to add a new
file in "include/dt-bindings" each time a new STM32 SOC arrives I propose
a new approach which consist to use a macro to define pin muxing in device
tree. All STM32 DT will use the common macro to define pinmux. Furthermore, it
will make maintenance and integration of new SOC easier.

I made only one patch to avoid dependencies. Let me know if you prefer that I
split it.

To check that patch generate same dtb than befrore I used dtc binary to (re)generate dts files
(before and after apply the series).

Example on stm32f469-disco:

./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-after.dts
stm32f469-disco-after.dtb

./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-before.dts
stm32f469-disco-before.dtb

Then diff -u stm32f469-disco-before.dts stm32f469-disco-after.dts

Changes since v3:
 -Rewrite documentation part
 -Simplify macro

Changes since v2:
 -Drop RFC tag
 -Add reviewers
 -Enhance modifications to all STM32 (F4/F7/H7)

Changes since v1:
 -According to Vikas Manocha review, use generic macro to define port.


Regards
Alex

Alexandre Torgue (1):
  ARM: dts: stm32: change pinctrl bindings definition

 .../bindings/pinctrl/st,stm32-pinctrl.txt          |   22 +-
 arch/arm/boot/dts/stm32f429.dtsi                   |  176 +--
 arch/arm/boot/dts/stm32f746.dtsi                   |   10 +-
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           |   10 +-
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |   30 +
 include/dt-bindings/pinctrl/stm32f429-pinfunc.h    | 1239 ---------------
 include/dt-bindings/pinctrl/stm32f746-pinfunc.h    | 1324 ----------------
 include/dt-bindings/pinctrl/stm32h7-pinfunc.h      | 1612 --------------------
 8 files changed, 148 insertions(+), 4275 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/stm32-pinfunc.h
 delete mode 100644 include/dt-bindings/pinctrl/stm32f429-pinfunc.h
 delete mode 100644 include/dt-bindings/pinctrl/stm32f746-pinfunc.h
 delete mode 100644 include/dt-bindings/pinctrl/stm32h7-pinfunc.h

-- 
2.7.4
