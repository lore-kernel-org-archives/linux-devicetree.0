From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 5/5] ARM: configs: Add new config fragment to change RAM size
Date: Wed, 26 Oct 2016 17:11:23 +0200
Message-ID: <1477494683-29890-6-git-send-email-alexandre.torgue@st.com>
References: <1477494683-29890-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1477494683-29890-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, peter.griffin@linaro.org, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/arch/arm/configs/dram_size_0x2000000.config b/arch/arm/configs/dram_size_0x2000000.config
new file mode 100644
index 0000000..e66430d
--- /dev/null
+++ b/arch/arm/configs/dram_size_0x2000000.config
@@ -0,0 +1 @@
+CONFIG_DRAM_SIZE=0x002000000
-- 
1.9.1

