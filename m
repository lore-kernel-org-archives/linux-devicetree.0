From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/2] STM32 pinctrl updates
Date: Mon, 16 Jul 2018 14:57:35 +0200
Message-ID: <1531745857-5561-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

Hi, 

This series includes two updates for stm32 pinctrl driver:

 -Fixes the way to map a gpio bank to an EXTi line.
 -Check "status" devicetree entry (in gpio-contriller node) before registering
  a new gpio bank.

Regards
Alex

Alexandre Torgue (2):
  pinctrl: stm32: fix bank io port number
  pinctrl: stm32: check node status before new gpio bank registering

 .../bindings/pinctrl/st,stm32-pinctrl.txt          |  2 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c              | 27 +++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.7.4
