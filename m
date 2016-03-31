From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [RESEND PATCH v10 4/6] ARM: debug: add hi3519 debug uart
Date: Thu, 31 Mar 2016 16:10:09 +0800
Message-ID: <1459411811-12390-5-git-send-email-xuejiancheng@hisilicon.com>
References: <1459411811-12390-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459411811-12390-1-git-send-email-xuejiancheng@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Jiancheng Xue <xuejiancheng@huawei.com>

add hi3519 debug uart

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 arch/arm/Kconfig.debug | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index c6b6175..edd3fbe 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -260,6 +260,14 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on Cortina Gemini based platforms.
 
+	config DEBUG_HI3519_UART
+		bool "Hisilicon HI3519 Debug UART"
+		depends on ARCH_HISI
+		select DEBUG_UART_PL01X
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on HI3519 UART.
+
 	config DEBUG_HI3620_UART
 		bool "Hisilicon HI3620 Debug UART"
 		depends on ARCH_HI3xxx
@@ -1451,6 +1459,7 @@ config DEBUG_UART_PHYS
 	default 0x11002000 if DEBUG_MT8127_UART0
 	default 0x11006000 if DEBUG_MT6589_UART0
 	default 0x11009000 if DEBUG_MT8135_UART3
+	default 0x12100000 if DEBUG_HI3519_UART
 	default 0x16000000 if DEBUG_INTEGRATOR
 	default 0x18000300 if DEBUG_BCM_5301X
 	default 0x18010000 if DEBUG_SIRFATLAS7_UART0
@@ -1619,6 +1628,7 @@ config DEBUG_UART_VIRT
 	default 0xfee20000 if DEBUG_NSPIRE_CLASSIC_UART || DEBUG_NSPIRE_CX_UART
 	default 0xfee82340 if ARCH_IOP13XX
 	default 0xfef00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
+	default 0xfef00000 if DEBUG_HI3519_UART
 	default 0xfef00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
 	default 0xfef36000 if DEBUG_HIGHBANK_UART
 	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
-- 
1.9.1
