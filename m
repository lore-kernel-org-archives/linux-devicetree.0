From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH 4/5] sprd_serial: switch comptible string to sc-uart
Date: Tue, 14 Feb 2017 17:19:11 +0800
Message-ID: <1487063952-7113-5-git-send-email-chunyan.zhang@spreadtrum.com>
References: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This driver sprd_serial is not only for SC9836, but for all Spreadtrum
SoCs so far.

Signed-off-by: Chunyan Zhang <chunyan.chunyan@spreadtrum.com>
---
 drivers/tty/serial/sprd_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 699447a..c0d63c01 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -624,7 +624,7 @@ static int __init sprd_early_console_setup(
 	device->con->write = sprd_early_write;
 	return 0;
 }
-OF_EARLYCON_DECLARE(sprd_serial, "sprd,sc9836-uart",
+OF_EARLYCON_DECLARE(sprd_serial, "sprd,sc-uart",
 		    sprd_early_console_setup);
 
 #else /* !CONFIG_SERIAL_SPRD_CONSOLE */
@@ -777,7 +777,7 @@ static int sprd_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(sprd_pm_ops, sprd_suspend, sprd_resume);
 
 static const struct of_device_id serial_ids[] = {
-	{.compatible = "sprd,sc9836-uart",},
+	{.compatible = "sprd,sc-uart",},
 	{}
 };
 MODULE_DEVICE_TABLE(of, serial_ids);
-- 
2.7.4
