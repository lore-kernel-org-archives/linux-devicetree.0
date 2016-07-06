From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v2] Add STM32F746 MCU pinctrl support
Date: Wed, 6 Jul 2016 11:46:57 +0200
Message-ID: <1467798418-12124-1-git-send-email-alexandre.torgue@st.com>
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

I only send a V2 for this patch as others have already been taken by Linus in
V1.

Changes since v1:

Thanks to Paul Gortmaker remarks, remove all modular API as this driver is only
built-in one.

Regards

Alex

Alexandre TORGUE (1):
  pinctrl: Add STM32F746 MCU support

 drivers/pinctrl/stm32/Kconfig             |    6 +
 drivers/pinctrl/stm32/Makefile            |    2 +
 drivers/pinctrl/stm32/pinctrl-stm32f746.c | 1686 +++++++++++++++++++++++++++++
 3 files changed, 1694 insertions(+)
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f746.c

-- 
1.9.1
