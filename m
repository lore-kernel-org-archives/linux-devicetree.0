Return-Path: <SRS0=+tgD=QP=bgdev.pl=brgl@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 13/33] ARM: davinci: aintc: use readl/writel_relaxed()
Date: Fri,  8 Feb 2019 18:31:34 +0100
Message-Id: <20190208173154.4665-14-brgl@bgdev.pl>
In-Reply-To: <20190208173154.4665-1-brgl@bgdev.pl>
References: <20190208173154.4665-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner --to=David Lechner <tglx@linutronix.dedavid>, lechnology.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Raplace all calls to __raw_readl() & __raw_writel() with readl_relaxed()
and writel_relaxed() respectively. It's safe to do as there's no
endianness conversion being done in the code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index 148c23728bdb..6a7205a844e1 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -36,12 +36,12 @@ static struct irq_domain *davinci_aintc_irq_domain;
 
 static inline void davinci_aintc_writel(unsigned long value, int offset)
 {
-	__raw_writel(value, davinci_aintc_base + offset);
+	writel_relaxed(value, davinci_aintc_base + offset);
 }
 
 static inline unsigned long davinci_aintc_readl(int offset)
 {
-	return __raw_readl(davinci_aintc_base + offset);
+	return readl_relaxed(davinci_aintc_base + offset);
 }
 
 static __init void
-- 
2.20.1
