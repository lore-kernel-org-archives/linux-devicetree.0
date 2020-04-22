Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C90C54FCB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 22:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CBF42077D
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 22:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lHCmswFf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgDVWXK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 18:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725961AbgDVWXK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Apr 2020 18:23:10 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC8EC03C1A9
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 15:23:10 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j7so1811212pgj.13
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oAIOXSIsu3a+kxebSXYRAfoQ6EtIY+p2qPBO6YZhgzk=;
        b=lHCmswFfJwL97shYXZUCXN+0Lt8LrcQS24K32xM1GrjI3+e0uLQH/icVv6MiO2Uffy
         0S1eD0rk9CHwNTD6dT1IFmnrsbucpjrve4qX9ls+XsK2zP/tOCsXuge0lTFGaz+qLulZ
         BnOPbwlg05IplH4iqeDTEaPAgt/4GhTfpvMcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oAIOXSIsu3a+kxebSXYRAfoQ6EtIY+p2qPBO6YZhgzk=;
        b=FGdZOhjNwTyRyzrnp7+ewPwdAni/Fbcg7P5Z2Kr5qlJZKUYH8Ac86vb5rNqKvOJkAd
         CuQqRbq9Jkc2znrkS+dhtrmGLhQld59nUrL0yGgGNjNIjgo5rwelfdPZGIcA8PSQEJND
         DUpYKTqLtFXmUO5fD/y4dH6hAmSJ1k7ZgFmlCA2tEULsZYZbuyjr8SmMsxpCQbJRBEZF
         HE1imSlKGrNKiMBmCHIsW1JDoGOlgkmI717FTOZeHpViGvQPONkOw/qbOgu6sQPjyXGm
         hqIu1HUzdrJwEhpMruG5lU5iOMNV4o2AzKhOG29c2xB0u/8A99R/sz//Aq5+8o5aqbJo
         YvHA==
X-Gm-Message-State: AGi0PuZkqO6KlJrvTX3/tsPMOnk6t13qp9zGdIPfRfaoCTnQGoVogMEH
        wX/Dkfwou1mTnQagN9Oq+722bA==
X-Google-Smtp-Source: APiQypLLR86KjD1uLaeJ8cTMZpQJyJe2HlrRRaOQ58vLmcr1wzwmkBnJlAI9xpMck3aPUZL44qhHoA==
X-Received: by 2002:a63:d804:: with SMTP id b4mr1130229pgh.127.1587594189877;
        Wed, 22 Apr 2020 15:23:09 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id w9sm541224pff.101.2020.04.22.15.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 15:23:09 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, twawrzynczak@chromium.org,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] platform/chrome: typec: Register Type C switches
Date:   Wed, 22 Apr 2020 15:22:41 -0700
Message-Id: <20200422222242.241699-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200422222242.241699-1-pmalani@chromium.org>
References: <20200422222242.241699-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register Type C mux and switch handles, when provided via firmware
bindings. These will allow the cros-ec-typec driver, and also alternate
mode drivers to configure connected Muxes correctly, according to PD
information retrieved from the Chrome OS EC.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 47 +++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index eda57db26f8d..324ead297c4d 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -14,6 +14,8 @@
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_device.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/role.h>
 
 #define DRV_NAME "cros-ec-typec"
 
@@ -25,6 +27,9 @@ struct cros_typec_port {
 	struct typec_partner *partner;
 	/* Port partner PD identity info. */
 	struct usb_pd_identity p_identity;
+	struct typec_switch *ori_sw;
+	struct typec_mux *mux;
+	struct usb_role_switch *role_sw;
 };
 
 /* Platform-specific data for the Chrome OS EC Type C controller. */
@@ -84,6 +89,40 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
 	return 0;
 }
 
+static int cros_typec_get_switch_handles(struct cros_typec_port *port,
+					 struct fwnode_handle *fwnode,
+					 struct device *dev)
+{
+	port->mux = fwnode_typec_mux_get(fwnode, NULL);
+	if (IS_ERR(port->mux)) {
+		dev_info(dev, "Mux handle not found.\n");
+		goto mux_err;
+	}
+
+	port->ori_sw = fwnode_typec_switch_get(fwnode);
+	if (IS_ERR(port->ori_sw)) {
+		dev_info(dev, "Orientation switch handle not found.\n");
+		goto ori_sw_err;
+	}
+
+	port->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(port->role_sw)) {
+		dev_info(dev, "USB role switch handle not found.\n");
+		goto role_sw_err;
+	}
+
+	return 0;
+
+role_sw_err:
+	usb_role_switch_put(port->role_sw);
+ori_sw_err:
+	typec_switch_put(port->ori_sw);
+mux_err:
+	typec_mux_put(port->mux);
+
+	return -ENODEV;
+}
+
 static void cros_unregister_ports(struct cros_typec_data *typec)
 {
 	int i;
@@ -91,6 +130,9 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 	for (i = 0; i < typec->num_ports; i++) {
 		if (!typec->ports[i])
 			continue;
+		usb_role_switch_put(typec->ports[i]->role_sw);
+		typec_switch_put(typec->ports[i]->ori_sw);
+		typec_mux_put(typec->ports[i]->mux);
 		typec_unregister_port(typec->ports[i]->port);
 	}
 }
@@ -153,6 +195,11 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 			ret = PTR_ERR(cros_port->port);
 			goto unregister_ports;
 		}
+
+		ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
+		if (ret)
+			dev_info(dev, "No switch control for port %d\n",
+				 port_num);
 	}
 
 	return 0;
-- 
2.26.1.301.g55bc3eb7cb9-goog

