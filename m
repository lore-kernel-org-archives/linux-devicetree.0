Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01088C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6A0122B47
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K5gxX6A1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgH0Ia5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 04:30:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41478 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgH0Ia4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 04:30:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R8UqYK010601;
        Thu, 27 Aug 2020 03:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598517052;
        bh=TwtAd5h+MTmGBfgb92sLiTOCS1mECF5oIoV+T0ARE/A=;
        h=From:To:CC:Subject:Date;
        b=K5gxX6A17MdZ6j/6LdYhhFL6+N4zBhuH8Je+Ct54l31Sf+CKVLW/IYoW8uxzxyBBf
         v9QNkyMybRZEf/7/cFAssLVOaF5uNNVvmzkxYwf25E1MoX4w/FCw93wKC/ZOvBBB1Y
         +ocCDc0z3hjstLUwliWnZdFzKppyaFVdFMYOTV6g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R8UqH8000978;
        Thu, 27 Aug 2020 03:30:52 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 03:30:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 03:30:51 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R8Uni3073124;
        Thu, 27 Aug 2020 03:30:50 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 1/4] dt-bindings: display: ti,am65x-dss: add missing properties to dt-schema
Date:   Thu, 27 Aug 2020 11:30:42 +0300
Message-ID: <20200827083045.76356-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add assigned-clocks, assigned-clock-parents and dma-coherent optional
properties.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 4f9185462ed3..4dc30738ee57 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -55,6 +55,14 @@ properties:
       - const: vp1
       - const: vp2
 
+  assigned-clocks:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 3
+
   interrupts:
     maxItems: 1
 
@@ -62,6 +70,9 @@ properties:
     maxItems: 1
     description: phandle to the associated power domain
 
+  dma-coherent:
+    type: boolean
+
   ports:
     type: object
     description:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

