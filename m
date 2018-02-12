From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 02/10] fsi: master-gpio: Add locking during break and link enable
Date: Mon, 12 Feb 2018 15:45:41 +1030
Message-ID: <20180212051549.8575-3-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

Currently, we perform GPIO accesses in fsi_master_gpio_break and
fsi_master_link_enable, without holding cmd_lock. This change adds the
appropriate locking.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Christopher Bostic <clbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-gpio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index ae2618768508..a6d602e89c11 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -461,12 +461,14 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
 static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	unsigned long flags;
 
 	if (link != 0)
 		return -ENODEV;
 
 	trace_fsi_master_gpio_break(master);
 
+	spin_lock_irqsave(&master->cmd_lock, flags);
 	set_sda_output(master, 1);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
@@ -475,6 +477,7 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	echo_delay(master);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
 	/* Wait for logic reset to take effect */
 	udelay(200);
@@ -497,10 +500,14 @@ static void fsi_master_gpio_init(struct fsi_master_gpio *master)
 static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	unsigned long flags;
 
 	if (link != 0)
 		return -ENODEV;
+
+	spin_lock_irqsave(&master->cmd_lock, flags);
 	gpiod_set_value(master->gpio_enable, 1);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
 	return 0;
 }
-- 
2.15.1
