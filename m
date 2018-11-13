From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 0/3] make pin-controller use hwspinlock
Date: Tue, 13 Nov 2018 10:51:39 +0100
Message-ID: <20181113095142.32015-1-benjamin.gaignard@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This series allow to protect pin controller configuration registers
with a hwspinlock to avoid conflicting accesses between processors.

Benjamin Gaignard (3):
  dt-bindings: pinctrl: stm32: Document hwlocks properties
  pinctrl: stm32: protect configuration registers with a hwspinlock
  ARM: dts: stm32: Add hwlock for pinctrl

 .../bindings/pinctrl/st,stm32-pinctrl.txt          |  1 +
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              | 71 +++++++++++++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)

-- 
2.15.0
