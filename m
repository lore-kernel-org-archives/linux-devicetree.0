From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 14/18] AT91: Register the poweroff driver
Date: Thu,  3 Jul 2014 16:14:57 +0200
Message-ID: <1404396906-25194-25-git-send-email-maxime.ripard@free-electrons.com>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@maxim.org.za, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, dwmw2@infradead.org, dbaryshkov@gmail.com
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas@free-electrons.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Register the poweroff driver in the old-style SoC definition so that the driver
is loaded and provide a shutdown hook.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/mach-at91/at91sam9260.c | 15 +++++++++++++++
 arch/arm/mach-at91/at91sam9261.c | 15 +++++++++++++++
 arch/arm/mach-at91/at91sam9263.c | 15 +++++++++++++++
 arch/arm/mach-at91/at91sam9g45.c | 15 +++++++++++++++
 arch/arm/mach-at91/at91sam9rl.c  | 15 +++++++++++++++
 5 files changed, 75 insertions(+)

diff --git a/arch/arm/mach-at91/at91sam9260.c b/arch/arm/mach-at91/at91sam9260.c
index 197c0149406a..5fa1986be2aa 100644
--- a/arch/arm/mach-at91/at91sam9260.c
+++ b/arch/arm/mach-at91/at91sam9260.c
@@ -377,9 +377,24 @@ static struct platform_device rstc_device = {
 	.num_resources  = ARRAY_SIZE(rstc_resources),
 };
 
+static struct resource shdwc_resources[] = {
+	[0] = {
+		.start  = AT91SAM9260_BASE_SHDWC,
+		.end    = AT91SAM9260_BASE_SHDWC + SZ_16 - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device shdwc_device = {
+	.name           = "at91-poweroff",
+	.resource       = shdwc_resources,
+	.num_resources  = ARRAY_SIZE(shdwc_resources),
+};
+
 static void __init at91sam9260_register_devices(void)
 {
 	platform_device_register(&rstc_device);
+	platform_device_register(&shdwc_device);
 }
 
 /* --------------------------------------------------------------------
diff --git a/arch/arm/mach-at91/at91sam9261.c b/arch/arm/mach-at91/at91sam9261.c
index ef44977f1cae..5ccc67235e7a 100644
--- a/arch/arm/mach-at91/at91sam9261.c
+++ b/arch/arm/mach-at91/at91sam9261.c
@@ -340,9 +340,24 @@ static struct platform_device rstc_device = {
 	.num_resources  = ARRAY_SIZE(rstc_resources),
 };
 
+static struct resource shdwc_resources[] = {
+	[0] = {
+		.start  = AT91SAM9261_BASE_SHDWC,
+		.end    = AT91SAM9261_BASE_SHDWC + SZ_16 - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device shdwc_device = {
+	.name           = "at91-poweroff",
+	.resource       = shdwc_resources,
+	.num_resources  = ARRAY_SIZE(shdwc_resources),
+};
+
 static void __init at91sam9261_register_devices(void)
 {
 	platform_device_register(&rstc_device);
+	platform_device_register(&shdwc_device);
 }
 
 /* --------------------------------------------------------------------
diff --git a/arch/arm/mach-at91/at91sam9263.c b/arch/arm/mach-at91/at91sam9263.c
index cb078e150a19..4d28c3479d4b 100644
--- a/arch/arm/mach-at91/at91sam9263.c
+++ b/arch/arm/mach-at91/at91sam9263.c
@@ -358,9 +358,24 @@ static struct platform_device rstc_device = {
 	.num_resources  = ARRAY_SIZE(rstc_resources),
 };
 
+static struct resource shdwc_resources[] = {
+	[0] = {
+		.start  = AT91SAM9263_BASE_SHDWC,
+		.end    = AT91SAM9263_BASE_SHDWC + SZ_16 - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device shdwc_device = {
+	.name           = "at91-poweroff",
+	.resource       = shdwc_resources,
+	.num_resources  = ARRAY_SIZE(shdwc_resources),
+};
+
 static void __init at91sam9263_register_devices(void)
 {
 	platform_device_register(&rstc_device);
+	platform_device_register(&shdwc_device);
 }
 
 /* --------------------------------------------------------------------
diff --git a/arch/arm/mach-at91/at91sam9g45.c b/arch/arm/mach-at91/at91sam9g45.c
index 329749eb1dff..22034c96d488 100644
--- a/arch/arm/mach-at91/at91sam9g45.c
+++ b/arch/arm/mach-at91/at91sam9g45.c
@@ -412,9 +412,24 @@ static struct platform_device rstc_device = {
 	.num_resources  = ARRAY_SIZE(rstc_resources),
 };
 
+static struct resource shdwc_resources[] = {
+	[0] = {
+		.start  = AT91SAM9G45_BASE_SHDWC,
+		.end    = AT91SAM9G45_BASE_SHDWC + SZ_16 - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device shdwc_device = {
+	.name           = "at91-poweroff",
+	.resource       = shdwc_resources,
+	.num_resources  = ARRAY_SIZE(shdwc_resources),
+};
+
 static void __init at91sam9g45_register_devices(void)
 {
 	platform_device_register(&rstc_device);
+	platform_device_register(&shdwc_device);
 }
 
 /* --------------------------------------------------------------------
diff --git a/arch/arm/mach-at91/at91sam9rl.c b/arch/arm/mach-at91/at91sam9rl.c
index e0e1729fe0e4..323a9f90931a 100644
--- a/arch/arm/mach-at91/at91sam9rl.c
+++ b/arch/arm/mach-at91/at91sam9rl.c
@@ -350,9 +350,24 @@ static struct platform_device rstc_device = {
 	.num_resources  = ARRAY_SIZE(rstc_resources),
 };
 
+static struct resource shdwc_resources[] = {
+	[0] = {
+		.start  = AT91SAM9RL_BASE_SHDWC,
+		.end    = AT91SAM9RL_BASE_SHDWC + SZ_16 - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device shdwc_device = {
+	.name           = "at91-poweroff",
+	.resource       = shdwc_resources,
+	.num_resources  = ARRAY_SIZE(shdwc_resources),
+};
+
 static void __init at91sam9rl_register_devices(void)
 {
 	platform_device_register(&rstc_device);
+	platform_device_register(&shdwc_device);
 }
 
 /* --------------------------------------------------------------------
-- 
2.0.1
