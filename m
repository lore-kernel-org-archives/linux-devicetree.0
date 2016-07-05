From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 0/3] Add STM32F746 MCU pinctrl support
Date: Tue, 5 Jul 2016 15:40:14 +0200
Message-ID: <1467726017-20041-1-git-send-email-alexandre.torgue@st.com>
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

This series adds STM32F746 pinctrl and GPIO support, relies on the
generic STM32 pinctrl driver.

Regards

Alex

Alexandre TORGUE (2):
  includes: dt-bindings: Add STM32F746 pinctrl DT bindings
  Documentation: dt: Add new compatible to STM32 pinctrl driver bindings

Maxime Coquelin (1):
  pinctrl: Add STM32F746 MCU support

 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    1 +
 drivers/pinctrl/stm32/Kconfig                      |    6 +
 drivers/pinctrl/stm32/Makefile                     |    2 +
 drivers/pinctrl/stm32/pinctrl-stm32f746.c          | 1693 ++++++++++++++++++++
 include/dt-bindings/pinctrl/stm32f746-pinfunc.h    | 1335 +++++++++++++++
 5 files changed, 3037 insertions(+)
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f746.c
 create mode 100644 include/dt-bindings/pinctrl/stm32f746-pinfunc.h

-- 
1.9.1
