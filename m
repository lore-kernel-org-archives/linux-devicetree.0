From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 8/8] ARM: configs: Add new config fragment to change RAM start point
Date: Tue, 31 Jan 2017 14:14:25 +0100
Message-ID: <1485868465-30446-9-git-send-email-alexandre.torgue@st.com>
References: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new fragment to over-ride the RAM start point to 0xd0000000.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/arch/arm/configs/dram_0xd0000000.config b/arch/arm/configs/dram_0xd0000000.config
new file mode 100644
index 0000000..61ba704
--- /dev/null
+++ b/arch/arm/configs/dram_0xd0000000.config
@@ -0,0 +1 @@
+CONFIG_DRAM_BASE=0xd0000000
-- 
1.9.1

