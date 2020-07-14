Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5068C433ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 851D52220E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdVNxNh0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgGNLgf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 07:36:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52520 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727774AbgGNLgf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 07:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594726593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eW4Qd/bhHk5NUmcb0g7XgzqOCh78ICZfVEjjqbF1yOc=;
        b=CdVNxNh0ilZQsds3HLw6MqZV90psFPeO8w64gAcSKz3hBPDcD71U+/ubrieM1sCxQ0g/p6
        y6Rju13ALzCWzUQ/4yd+HDfZpbwNSVWHdHsc9BAZ77rVjECxoCq6zd3qNU3nOzoKsHR6gE
        jEJajUVJmkYNgzCJ8d2oD//vuqdE5bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-HT0ITqPqOamqsia5firNdQ-1; Tue, 14 Jul 2020 07:36:28 -0400
X-MC-Unique: HT0ITqPqOamqsia5firNdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E565F19253CF;
        Tue, 14 Jul 2020 11:36:26 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3C4E479CEA;
        Tue, 14 Jul 2020 11:36:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/4] usb: typec: Add typec_port_register_altmodes_from_fwnode()
Date:   Tue, 14 Jul 2020 13:36:15 +0200
Message-Id: <20200714113617.10470-3-hdegoede@redhat.com>
In-Reply-To: <20200714113617.10470-1-hdegoede@redhat.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This can be used by Type-C controller drivers which use a standard
usb-connector fwnode, with altmodes sub-node, to describe the available
altmodes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/class.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  7 +++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c9234748537a..47de2b2e3d54 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1607,6 +1607,62 @@ typec_port_register_altmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmode);
 
+void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
+	const struct typec_altmode_ops *ops, void *drvdata,
+	struct typec_altmode **altmodes, size_t n,
+	struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *altmodes_node, *child;
+	struct typec_altmode_desc desc;
+	struct typec_altmode *alt;
+	size_t index = 0;
+	u32 svid, vdo;
+	int ret;
+
+	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
+	if (!altmodes_node)
+		return;
+
+	child = NULL;
+	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
+		ret = fwnode_property_read_u32(child, "svid", &svid);
+		if (ret) {
+			dev_err(&port->dev, "Error reading svid for altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		ret = fwnode_property_read_u32(child, "vdo", &vdo);
+		if (ret) {
+			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		if (index >= n) {
+			dev_err(&port->dev, "Error not enough space for altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		desc.svid = svid;
+		desc.vdo = vdo;
+		desc.mode = index + 1;
+		alt = typec_port_register_altmode(port, &desc);
+		if (IS_ERR(alt)) {
+			dev_err(&port->dev, "Error registering altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		alt->ops = ops;
+		typec_altmode_set_drvdata(alt, drvdata);
+		altmodes[index] = alt;
+		index++;
+	}
+}
+EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
+
 /**
  * typec_register_port - Register a USB Type-C Port
  * @parent: Parent device
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 5daa1c49761c..fbe4bccb3a98 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -17,6 +17,7 @@ struct typec_partner;
 struct typec_cable;
 struct typec_plug;
 struct typec_port;
+struct typec_altmode_ops;
 
 struct fwnode_handle;
 struct device;
@@ -121,6 +122,12 @@ struct typec_altmode
 struct typec_altmode
 *typec_port_register_altmode(struct typec_port *port,
 			     const struct typec_altmode_desc *desc);
+
+void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
+	const struct typec_altmode_ops *ops, void *drvdata,
+	struct typec_altmode **altmodes, size_t n,
+	struct fwnode_handle *fwnode);
+
 void typec_unregister_altmode(struct typec_altmode *altmode);
 
 struct typec_port *typec_altmode2port(struct typec_altmode *alt);
-- 
2.26.2

