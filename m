From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 0/4] Add fixes to STM32 pintrl
Date: Fri, 7 Apr 2017 17:10:07 +0200
Message-ID: <1491577811-26989-1-git-send-email-alexandre.torgue@st.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series add several fixes to STM32 pinctrl:
 - Set input mode when PIN is used as interrupt
 - Implement .get_direction() gpio_chip callback  
 - In DT: set each gpio controller as a interrupt controller. User who
   wants to use gpio as interrupt will have choice to use either "gpiolib"
   interface or "common" interrupt interface.

Regards
Alex

Alexandre TORGUE (4):
  pinctrl: stm32: set pin to gpio input when used as interrupt
  pinctrl: stm32: replace device_initcall() with arch_initcall()
  pinctrl: stm32: Implement .get_direction gpio_chip callback
  ARM: dts: stm32: Set gpio controller also as interrupt controller

 arch/arm/boot/dts/stm32f429.dtsi          | 22 +++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi          | 22 +++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.c     | 47 +++++++++++++++++++++++++++++--
 drivers/pinctrl/stm32/pinctrl-stm32.h     |  5 +++-
 drivers/pinctrl/stm32/pinctrl-stm32f429.c |  6 +++-
 drivers/pinctrl/stm32/pinctrl-stm32f746.c |  7 ++++-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c |  6 +++-
 7 files changed, 109 insertions(+), 6 deletions(-)

-- 
1.9.1
