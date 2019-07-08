From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 6/8] of/platform: Pause/resume sync state in of_platform_populate()
Date: Mon,  8 Jul 2019 15:56:22 -0700
Message-ID: <20190708225624.119973-7-saravanak@google.com>
References: <20190708225624.119973-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708225624.119973-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

When multiple child devices are populated using of_platform_populate()
after kernel init, there could be supplier-consumer dependencies between
the child devices.

Wait for all the devices to be added and linked before calling sync_state()
on all the suppliers.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 56b718f09929..dba962a0ee50 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -486,6 +486,7 @@ int of_platform_populate(struct device_node *root,
 	pr_debug("%s()\n", __func__);
 	pr_debug(" starting at: %pOF\n", root);
 
+	device_links_supplier_sync_state_pause();
 	for_each_child_of_node(root, child) {
 		rc = of_platform_bus_create(child, matches, lookup, parent, true);
 		if (rc) {
@@ -493,6 +494,8 @@ int of_platform_populate(struct device_node *root,
 			break;
 		}
 	}
+	device_links_supplier_sync_state_resume();
+
 	of_node_set_flag(root, OF_POPULATED_BUS);
 
 	of_node_put(root);
-- 
2.22.0.410.gd8fdbe21b5-goog
