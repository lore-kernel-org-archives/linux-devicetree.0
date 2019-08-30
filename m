From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 17/18] MAINTAINERS: Add new pathes to LOONGSON64 ARCHITECTURE
Date: Fri, 30 Aug 2019 12:32:31 +0800
Message-ID: <20190830043232.20191-12-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Place newly submited irqchip drivers and devicetree support under
MIPS/LOONGSON64 ARCHITECTURE.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d5d4fed632e6..242970af939c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10760,9 +10760,12 @@ MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
+F:	arch/mips/boot/dts/loongson/
 F:	arch/mips/loongson64/
 F:	arch/mips/include/asm/mach-loongson64/
 F:	drivers/platform/mips/cpu_hwmon.c
+F:	drivers/irqchip/irq-ls3-*
+F:	Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-*
 F:	drivers/*/*loongson3*
 F:	drivers/*/*/*loongson3*
 
-- 
2.22.0
