Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5362C433F4
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B96582220C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dNDvpt/W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgGNLgi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 07:36:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58027 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727772AbgGNLgh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 07:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594726596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zE3tIVaCaZ/QMBFJn/FpgcTLYxPRQZwgwXEI4XKQg6o=;
        b=dNDvpt/WO9PT1O9guEc+zKKbmbt8Q5mzBelE4l/IqOTbIM8dGGcfRaBazE1RbqJuMuiTbl
        +YV37UBuPcpm0zHL3R5rBhHbWW9IraL9TPWjWevgIlN+JChhI8GgskfmCSXh20sL5R3BkQ
        faFCuBhVoaQtcwhsB7EGkeJe8U6j+U8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-bC0Z7JmYP2aP59-J_zFvEQ-1; Tue, 14 Jul 2020 07:36:35 -0400
X-MC-Unique: bC0Z7JmYP2aP59-J_zFvEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75039102CC32;
        Tue, 14 Jul 2020 11:36:33 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4D29C7B414;
        Tue, 14 Jul 2020 11:36:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/4] platform/x86/intel_cht_int33fe: Add displayport altmode fwnode to the connector fwnode
Date:   Tue, 14 Jul 2020 13:36:17 +0200
Message-Id: <20200714113617.10470-5-hdegoede@redhat.com>
In-Reply-To: <20200714113617.10470-1-hdegoede@redhat.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a displayport altmode fwnode to the usb-connector fwnode,
devices which use this driver support display-port altmode through
the PI3USB30532 USB switch, this enables support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/intel_cht_int33fe_typec.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
index 48638d1c56e5..b61bad9cc8d2 100644
--- a/drivers/platform/x86/intel_cht_int33fe_typec.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -124,12 +124,31 @@ static const struct software_node usb_connector_node = {
 	.properties = usb_connector_properties,
 };
 
+static const struct software_node altmodes_node = {
+	.name = "altmodes",
+	.parent = &usb_connector_node,
+};
+
+static const struct property_entry dp_altmode_properties[] = {
+	PROPERTY_ENTRY_U32("svid", 0xff01),
+	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
+	{ }
+};
+
+static const struct software_node dp_altmode_node = {
+	.name = "displayport-altmode",
+	.parent = &altmodes_node,
+	.properties = dp_altmode_properties,
+};
+
 static const struct software_node *node_group[] = {
 	&fusb302_node,
 	&max17047_node,
 	&pi3usb30532_node,
 	&displayport_node,
 	&usb_connector_node,
+	&altmodes_node,
+	&dp_altmode_node,
 	NULL
 };
 
-- 
2.26.2

