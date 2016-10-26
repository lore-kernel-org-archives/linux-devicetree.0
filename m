From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [RFC PATCH 4/5] w1: add a callback to call slave when a new device is connected
Date: Wed, 26 Oct 2016 16:57:55 +0200
Message-ID: <20161026145756.21689-5-antoine.tenart@free-electrons.com>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, pantelis.antoniou@konsulko.com, mark.rutland@arm.com, sboyd@codeaurora.org
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, thomas.petazzoni@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the possibility for slave drivers to register a
callback, to be called whenever a new device matching the slave ID
is connected.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/w1/w1.c        | 10 ++++++++++
 drivers/w1/w1_family.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 80d0cc4e6e7f..7010ffd1ea93 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -659,6 +659,16 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
 				return err;
 			}
 		}
+		if (fops->callback) {
+			err = fops->callback(sl);
+			/*
+			 * Do not return an error as the slave driver correctly
+			 * probed.
+			 */
+			if (err)
+				dev_err(&sl->dev,
+					"callback call failed. err=%d\n", err);
+		}
 
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
diff --git a/drivers/w1/w1_family.h b/drivers/w1/w1_family.h
index 10a7a0767187..5e165babc6f3 100644
--- a/drivers/w1/w1_family.h
+++ b/drivers/w1/w1_family.h
@@ -55,11 +55,13 @@ struct w1_slave;
  * @add_slave: add_slave
  * @remove_slave: remove_slave
  * @groups: sysfs group
+ * @callback: called when a new device is discovered
  */
 struct w1_family_ops
 {
 	int  (* add_slave)(struct w1_slave *);
 	void (* remove_slave)(struct w1_slave *);
+	int  (* callback)(struct w1_slave *);
 	const struct attribute_group **groups;
 };
 
-- 
2.10.1
