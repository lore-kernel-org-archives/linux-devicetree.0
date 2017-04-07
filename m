From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v2 2/7] Documentation: dt: Remove bindings for STM32 pinctrl
Date: Fri, 7 Apr 2017 14:42:59 +0200
Message-ID: <1491568984-20169-3-git-send-email-alexandre.torgue@st.com>
References: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove "ngpios" bindings definition as it is no more used in stm32 pinctrl
driver.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
index eac20aa..e4cda3d 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@ -38,8 +38,6 @@ Optional properties:
  - st,syscfg: Should be phandle/offset pair. The phandle to the syscon node
    which includes IRQ mux selection register, and the offset of the IRQ mux
    selection register.
- - ngpios: Number of gpios in a bank (to use if bank gpio numbers is less
-   than 16).
  - gpio-ranges: Define a dedicated mapping between a pin-controller and
    a gpio controller. Format is <&phandle a b c> with:
 	-(phandle): phandle of pin-controller.
-- 
1.9.1

