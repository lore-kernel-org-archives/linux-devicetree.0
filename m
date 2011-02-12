From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 7/7] serial: samsung: Get default port register settings from
	device tree
Date: Sat, 12 Feb 2011 18:17:05 +0530
Message-ID: <1297514825-10345-8-git-send-email-thomas.abraham@linaro.org>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1297514825-10345-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The default uart port register settings are obtained from the platform data.
In addition to that, this patch adds support for obtaining the default uart port
register values from the uart node in device tree.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/tty/serial/samsung.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 66fece9..dda1d52 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1148,9 +1148,22 @@ int s3c24xx_serial_probe(struct platform_device *dev,
 {
 	struct s3c24xx_uart_port *ourport;
 	int ret;
+	unsigned int len, *regdef;
+	struct s3c2410_uartcfg *cfg;
 
 	dbg("s3c24xx_serial_probe(%p, %p) %d\n", dev, info, probe_index);
 
+	if (dev->dev.of_node) {
+		regdef = (u32 *)of_get_property(dev->dev.of_node,
+					"reg-defaults", &len);
+		if (regdef && (len / sizeof(unsigned int)) == 3) {
+			cfg = s3c24xx_dev_to_cfg(&dev->dev);
+			cfg->ucon = be32_to_cpu(regdef[0]);
+			cfg->ulcon = be32_to_cpu(regdef[1]);
+			cfg->ufcon = be32_to_cpu(regdef[2]);
+		}
+	}
+
 	ourport = &s3c24xx_serial_ports[probe_index];
 	probe_index++;
 
-- 
1.6.6.rc2
