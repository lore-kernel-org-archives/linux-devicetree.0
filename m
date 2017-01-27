From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 6/8] Documentation: dt: Add new compatible to STM32 pinctrl driver bindings
Date: Fri, 27 Jan 2017 17:15:19 +0100
Message-ID: <1485533721-9019-7-git-send-email-alexandre.torgue@st.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, Patrice Chotard <patrice.chotard@st.com>, lee.jones@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new compatible for stm32f469 MCU.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
index 25d9809..4f0487d 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@ -9,7 +9,8 @@ Pin controller node:
 Required properies:
  - compatible: value should be one of the following:
    (a) "st,stm32f429-pinctrl"
-   (b) "st,stm32f746-pinctrl"
+   (b) "st,stm32f469-pinctrl"
+   (c) "st,stm32f746-pinctrl"
  - #address-cells: The value of this property must be 1
  - #size-cells	: The value of this property must be 1
  - ranges	: defines mapping between pin controller node (parent) to
-- 
1.9.1
