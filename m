Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809F9C433EB
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D18D22201
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoYqqvxV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgGNLgb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 07:36:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21101 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727095AbgGNLga (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 07:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594726589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1N2qr0Avv5UNVW+MQuY+wJoT9KyO8MxfhAsREWU1vFU=;
        b=XoYqqvxVKSzilG/cAazHEkbityRyJ4lClKY1/KeCDONSl6zZgL/SPUlhB6EfYZrJMclRXZ
        LtG/QsBI1R9wxnIGQ40Ztie6kyT1DUglULmL3Ge4TMWxrhy7yHVcg8YfCkCCJHtzp78OrY
        cpKQ103OcwryDZkNlwyD9Qr7DnedTLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-cgVqi3MaOZKhY8Q2n_DE5Q-1; Tue, 14 Jul 2020 07:36:25 -0400
X-MC-Unique: cgVqi3MaOZKhY8Q2n_DE5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC04519253C2;
        Tue, 14 Jul 2020 11:36:23 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C384E797E3;
        Tue, 14 Jul 2020 11:36:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: usb-connector: Add support for Type-C alternate-modes
Date:   Tue, 14 Jul 2020 13:36:14 +0200
Message-Id: <20200714113617.10470-2-hdegoede@redhat.com>
In-Reply-To: <20200714113617.10470-1-hdegoede@redhat.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds the minimum bindings required to allow describing which
altmodes a port supports. Currently this is limited to just specifying:

1. The svid, which is the id of the altmode, e.g. displayport altmode has
a svid of 0xff01.

2. The vdo, a 32 bit integer, typically used as a bitmask describing the
capabilities of the altmode, the bits in the vdo are specified in the
specification of the altmode, the dt-binding simply refers to the
specification as that is the canonical source of the meaning of the bits.

Later on we may want to extend the binding with extra properties specific
to some altmode, but for now this is sufficient to e.g. hook up
displayport alternate-mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note I hope I got the yaml correct, this is my first time writing a
dt-binding in the new yaml style. I did run:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/connector/usb-connector.yaml
and that was happy.
---
 .../bindings/connector/usb-connector.yaml     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 9bd52e63c935..389e800c9fe8 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -119,6 +119,27 @@ properties:
       offer the power, Capability Mismatch is set. Required for power sink and
       power dual role.
 
+  altmodes:
+    description:
+      List of child nodes that specify the altmodes supported by the
+      "usb-c-connector". The child nodes must be named foo-altmode, e.g.
+      "displayport-altmode".
+
+    patternProperties:
+      "^.*-altmode$":
+        type: object
+        description: The altmodes node has 1 child-node per supported altmode.
+        properties:
+          svid:
+            description: USB Type-C / PD altmode-svid, see the USB specifications
+              for details.
+          vdo:
+            description: USB Type-C / PD altmode-vdo, see the USB specifications
+              for details.
+        required:
+          - svid
+          - vdo
+
   ports:
     description: OF graph bindings (specified in bindings/graph.txt) that model
       any data bus to the connector unless the bus is between parent node and
-- 
2.26.2

