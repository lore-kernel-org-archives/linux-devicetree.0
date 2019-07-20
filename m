Return-Path: <SRS0=B7+z=VR=flex--saravanak.bounces.google.com=37LEyXQkKBws3l2l6lylvrzzrwp.nzx2zms+o4vp2ypw.z2r@kernel.org>
Date: Fri, 19 Jul 2019 23:16:46 -0700
In-Reply-To: <20190720061647.234852-1-saravanak@google.com>
Message-Id: <20190720061647.234852-8-saravanak@google.com>
Mime-Version: 1.0
References: <20190720061647.234852-1-saravanak@google.com>
Subject: [PATCH v6 7/7] of/platform: Don't create device links for default busses
From: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-ID: <devicetree@vger.kernel.org>

Default busses also have devices created for them. But there's no point
in creating device links for them. It's especially wasteful as it'll
cause the traversal of the entire device tree and also spend a lot of
time checking and figuring out that creating those links isn't allowed.
So check for default busses and skip trying to create device links for
them.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index c1a116f7a087..8bf975ee2ff7 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -676,6 +676,8 @@ static int of_link_to_suppliers(struct device *dev)
 		return 0;
 	if (unlikely(!dev->of_node))
 		return 0;
+	if (of_match_node(of_default_bus_match_table, dev->of_node))
+		return 0;
 
 	return __of_link_to_suppliers(dev, dev->of_node);
 }
-- 
2.22.0.657.g960e92d24f-goog
