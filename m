From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 0/2] pinctrl: berlin: add as370 SoC support
Date: Fri, 13 Jul 2018 17:45:08 +0800
Message-ID: <20180713174436.4842419e@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This series is to add the Synaptics AS370 SoC pinctrl driver.

Jisheng Zhang (2):
  dt-binding: pinctrl: berlin: document AS370 SoC pinctrl
  pinctrl: berlin: add the as370 SoC pinctrl driver

 .../bindings/pinctrl/berlin,pinctrl.txt       |   3 +-
 drivers/pinctrl/berlin/Kconfig                |   5 +
 drivers/pinctrl/berlin/Makefile               |   1 +
 drivers/pinctrl/berlin/pinctrl-as370.c        | 369 ++++++++++++++++++
 4 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/berlin/pinctrl-as370.c

-- 
2.18.0
