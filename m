From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH v5 3/7] dt-bindings: stm32: add support of STM32MP157
Date: Tue, 16 Jan 2018 15:56:16 +0100
Message-ID: <1516114580-2424-4-git-send-email-ludovic.Barre@st.com>
References: <1516114580-2424-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516114580-2424-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Gerald Baeza <gerald.baeza@st.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds STM32MP157 SoC bindings.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/stm32.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
index 05762b0..6808ed9 100644
--- a/Documentation/devicetree/bindings/arm/stm32.txt
+++ b/Documentation/devicetree/bindings/arm/stm32.txt
@@ -7,3 +7,4 @@ using one of the following compatible strings:
   st,stm32f469
   st,stm32f746
   st,stm32h743
+  st,stm32mp157
-- 
2.7.4
