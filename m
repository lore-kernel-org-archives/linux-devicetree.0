From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v3]Add STM32F746 MCU pinctrl support
Date: Mon, 11 Jul 2016 10:43:39 +0200
Message-ID: <1468226620-574-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds STM32F746 pinctrl and GPIO support, relies on the
generic STM32 pinctrl driver.

Changes since v2:

According to Linus remark, use builtin_platform_driver() instead of 
device_initcall() as there are nothing to do in driver init function
(except to register driver).

As soon this patch will be accepted, I will send the same update for 
stm32f429 pinctrl. 

Changes since v1:

Thanks to Paul Gortmaker remarks, remove all modular API as this driver is only
built-in one.

Regards

Alex

Alexandre TORGUE (1):
  pinctrl: Add STM32F746 MCU support

 drivers/pinctrl/stm32/Kconfig             |    6 +
 drivers/pinctrl/stm32/Makefile            |    2 +
 drivers/pinctrl/stm32/pinctrl-stm32f746.c | 1681 +++++++++++++++++++++++++++++
 3 files changed, 1689 insertions(+)
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f746.c

-- 
1.9.1

