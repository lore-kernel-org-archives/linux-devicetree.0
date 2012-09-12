From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/9] ARM: davinci: serial: provide API to initialze UART clocks
Date: Wed, 12 Sep 2012 22:05:25 +0530
Message-ID: <1347467732-1332-3-git-send-email-nsekhar@ti.com>
References: <1347467732-1332-1-git-send-email-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1347467732-1332-1-git-send-email-nsekhar-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Provide an API to initialize a UART clock. Refactor existing
davinci_serial_init() to separate out the part which enables
the clock.

This will later be used to help DA850 DT boot support.

Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/mach-davinci/include/mach/serial.h |    1 +
 arch/arm/mach-davinci/serial.c              |   39 ++++++++++++++++++---------
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-davinci/include/mach/serial.h b/arch/arm/mach-davinci/include/mach/serial.h
index 46b3cd1..2d9d921 100644
--- a/arch/arm/mach-davinci/include/mach/serial.h
+++ b/arch/arm/mach-davinci/include/mach/serial.h
@@ -43,6 +43,7 @@ struct davinci_uart_config {
 };
 
 extern int davinci_serial_init(struct davinci_uart_config *);
+extern int davinci_serial_setup_clk(unsigned instance, unsigned int *rate);
 #endif
 
 #endif /* __ASM_ARCH_SERIAL_H */
diff --git a/arch/arm/mach-davinci/serial.c b/arch/arm/mach-davinci/serial.c
index 24ddb0d..f262581 100644
--- a/arch/arm/mach-davinci/serial.c
+++ b/arch/arm/mach-davinci/serial.c
@@ -70,11 +70,33 @@ static void __init davinci_serial_reset(struct plat_serial8250_port *p)
 				 UART_DM646X_SCR_TX_WATERMARK);
 }
 
-int __init davinci_serial_init(struct davinci_uart_config *info)
+/* Enable UART clock and obtain its rate */
+int __init davinci_serial_setup_clk(unsigned instance, unsigned int *rate)
 {
-	int i;
 	char name[16];
-	struct clk *uart_clk;
+	struct clk *clk;
+	struct davinci_soc_info *soc_info = &davinci_soc_info;
+	struct device *dev = &soc_info->serial_dev->dev;
+
+	sprintf(name, "uart%d", instance);
+	clk = clk_get(dev, name);
+	if (IS_ERR(clk)) {
+		pr_err("%s:%d: failed to get UART%d clock\n",
+					__func__, __LINE__, instance);
+		return PTR_ERR(clk);
+	}
+
+	clk_prepare_enable(clk);
+
+	if (rate)
+		*rate = clk_get_rate(clk);
+
+	return 0;
+}
+
+int __init davinci_serial_init(struct davinci_uart_config *info)
+{
+	int i, ret;
 	struct davinci_soc_info *soc_info = &davinci_soc_info;
 	struct device *dev = &soc_info->serial_dev->dev;
 	struct plat_serial8250_port *p = dev->platform_data;
@@ -87,16 +109,9 @@ int __init davinci_serial_init(struct davinci_uart_config *info)
 		if (!(info->enabled_uarts & (1 << i)))
 			continue;
 
-		sprintf(name, "uart%d", i);
-		uart_clk = clk_get(dev, name);
-		if (IS_ERR(uart_clk)) {
-			printk(KERN_ERR "%s:%d: failed to get UART%d clock\n",
-					__func__, __LINE__, i);
+		ret = davinci_serial_setup_clk(i, &p->uartclk);
+		if (ret)
 			continue;
-		}
-
-		clk_prepare_enable(uart_clk);
-		p->uartclk = clk_get_rate(uart_clk);
 
 		if (!p->membase && p->mapbase) {
 			p->membase = ioremap(p->mapbase, SZ_4K);
-- 
1.7.10.1
