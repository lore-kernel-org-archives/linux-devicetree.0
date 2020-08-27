Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2CBC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1005022B49
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xOIL1+wd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgH0Ia6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 04:30:58 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49254 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgH0Ia5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 04:30:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R8UsPO083023;
        Thu, 27 Aug 2020 03:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598517054;
        bh=4xYhEa1mI4n43EWZsE5B8fnThNBrNdcU74b5+zQqMAw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xOIL1+wdlQrQ9LufS+WD7Nn+TLl2EnSyVJOt+qRCBl/XMy4x4HCmMZji8mHOKlS2P
         o8tNJ91gNeISAHIcRfC89EHeOcYL2lTFNH3uKAeJHtwKVsq1cwPpG8nma4UlUQvuxj
         y4MeWyp3+BsEejcs3jAsGhvtg3+v8yze2b5rUQUU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R8Uru8010370
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 03:30:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 03:30:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 03:30:53 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R8Uni4073124;
        Thu, 27 Aug 2020 03:30:51 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 2/4] dt-bindings: display: ti,j721e-dss: add missing properties to dt-schema
Date:   Thu, 27 Aug 2020 11:30:43 +0300
Message-ID: <20200827083045.76356-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200827083045.76356-1-tomi.valkeinen@ti.com>
References: <20200827083045.76356-1-tomi.valkeinen@ti.com>
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
 .../devicetree/bindings/display/ti/ti,j721e-dss.yaml  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
index 173730d56334..c9a947d55fa4 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -77,6 +77,14 @@ properties:
       - const: vp3
       - const: vp4
 
+  assigned-clocks:
+    minItems: 1
+    maxItems: 5
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 5
+
   interrupts:
     items:
       - description: common_m DSS Master common
@@ -95,6 +103,9 @@ properties:
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

