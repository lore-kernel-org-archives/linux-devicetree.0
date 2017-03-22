From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH] ipmi: bt-bmc: Add ast2500 compatible string
Date: Thu, 23 Mar 2017 00:31:12 +1030
Message-ID: <20170322140112.2479-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Cc: openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ast2500 SoCs contain the same IPMI BT device.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt | 4 +++-
 drivers/char/ipmi/bt-bmc.c                                        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
index 6f28969af9dc..028268fd99ee 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
@@ -6,7 +6,9 @@ perform in-band IPMI communication with their host.
 
 Required properties:
 
-- compatible : should be "aspeed,ast2400-ibt-bmc"
+- compatible : should be one of
+	"aspeed,ast2400-ibt-bmc"
+	"aspeed,ast2500-ibt-bmc"
 - reg: physical address and size of the registers
 
 Optional properties:
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index fc9e8891eae3..002907e6c7d9 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -485,6 +485,7 @@ static int bt_bmc_remove(struct platform_device *pdev)
 
 static const struct of_device_id bt_bmc_match[] = {
 	{ .compatible = "aspeed,ast2400-ibt-bmc" },
+	{ .compatible = "aspeed,ast2500-ibt-bmc" },
 	{ },
 };
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
