From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 11/11] of/platform: Don't create device links default busses
Date: Fri, 12 Jul 2019 16:52:44 -0700
Message-ID: <20190712235245.202558-12-saravanak@google.com>
References: <20190712235245.202558-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712235245.202558-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Default busses also have devices created for them. But there's no point
in creating device links for them. It's especially wasteful as it'll
cause the traversal of the entire device tree and also spend a lot of
time checking and figuring out that creating those links isn't allowed.
So check for default busses and skip trying to create device links for
them.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 9f3b7e1801bc..b02dbaa01bfe 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -593,6 +593,9 @@ static int __of_link_to_suppliers(struct device *dev,
 	struct property *p;
 	unsigned int len, reg_len;
 
+	if (of_match_node(of_default_bus_match_table, con_np))
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(link_bindings) / 2; i++)
 		if (of_link_binding(dev, con_np, link_bindings[i * 2],
 					link_bindings[i * 2 + 1]))
-- 
2.22.0.510.g264f2c817a-goog
