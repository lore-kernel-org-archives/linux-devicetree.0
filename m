From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 03/13] MAINTAINERS: Fix entries for new loongson64 path
Date: Tue, 27 Aug 2019 16:52:52 +0800
Message-ID: <20190827085302.5197-4-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

As we sepreated the code of loongson2ef/loongson3a, they can
now have their own entries.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2c343ee3b2c..d5d4fed632e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10747,17 +10747,16 @@ F:	arch/mips/include/asm/mach-loongson32/
 F:	drivers/*/*loongson1*
 F:	drivers/*/*/*loongson1*
 
-MIPS/LOONGSON2 ARCHITECTURE
+MIPS/LOONGSON2E/F ARCHITECTURE
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-F:	arch/mips/loongson64/fuloong-2e/
-F:	arch/mips/loongson64/lemote-2f/
-F:	arch/mips/include/asm/mach-loongson64/
+F:	arch/mips/loongson2ef/
+F:	arch/mips/include/asm/mach-loongson2ef/
 F:	drivers/*/*loongson2*
 F:	drivers/*/*/*loongson2*
 
-MIPS/LOONGSON3 ARCHITECTURE
+MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-- 
2.22.0
