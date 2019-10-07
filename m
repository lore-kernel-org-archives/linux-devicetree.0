From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/3] dt-bindings: fix issues seen during STM32 DT validation
Date: Mon, 7 Oct 2019 15:44:07 +0200
Message-ID: <20191007134410.10337-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series updates yaml files to clean some issues seen during STM32 device
trees validation. 

Alexandre Torgue (3):
  dt-bindings: arm: stm32: Add missing STM32 boards
  dt-bindings: pinctrl: stm32: Fix 'st,syscfg' description field
  dt-bindings: usb: generic-ehci: Add "companion" entry

 .../devicetree/bindings/arm/stm32/stm32.yaml  | 27 ++++++++++++++++---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |  7 +++--
 .../devicetree/bindings/usb/generic-ehci.yaml |  5 ++++
 3 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.17.1
