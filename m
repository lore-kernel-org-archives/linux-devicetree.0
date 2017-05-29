From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v2 0/3] Add fixes to STM32 pintrl
Date: Mon, 29 May 2017 18:17:30 +0200
Message-ID: <1496074653-2941-1-git-send-email-alexandre.torgue@st.com>
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

Changes since v1:
 -rebase on 4.12-rc1
 -Let gpiochip and irqchip orthogonal in stm32 pinctrl driver
 -Don't use gpiolib internal define

Regards
Alex

Alexandre TORGUE (3):
  pinctrl: stm32: set pin to gpio input when used as interrupt
  pinctrl: stm32: Implement .get_direction gpio_chip callback
  ARM: dts: stm32: Set gpio controller also as interrupt controller

 arch/arm/boot/dts/stm32f429.dtsi      | 22 +++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi      | 22 +++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.c | 62 ++++++++++++++++++++++++++++-------
 drivers/pinctrl/stm32/pinctrl-stm32.h |  5 ++-
 4 files changed, 98 insertions(+), 13 deletions(-)

-- 
1.9.1
