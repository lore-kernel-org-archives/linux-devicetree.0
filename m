Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F448C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 06:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C5E622BED
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 06:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uS0+GU1j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgH0GwE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 02:52:04 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60502 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgH0GwE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 02:52:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R6pwKW075204;
        Thu, 27 Aug 2020 01:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598511118;
        bh=RmwV5pMBHJ72eo5IH0/pXGKzwzCorHIByq55KjsYn/I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uS0+GU1jbJswOCiRV2A5xbMa/xt2Tng5bpD1xs5MGhM3jPTJQSYtfl8/7l8W8nXV6
         dG7mSQKd8J0JJBeL3Y8hkYItb1VOXD1zDFqEhNEIx68vZfinigtq6UZ8gP6lqo8RRH
         3rJLD38m37dgjB6kPv5vUjLn7nssgJiaapVLr2Wo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R6pwRj011205
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 01:51:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 01:51:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 01:51:58 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R6pjoh112178;
        Thu, 27 Aug 2020 01:51:55 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: ti: Add bindings for J7200 SoC
Date:   Thu, 27 Aug 2020 12:21:42 +0530
Message-ID: <20200827065144.17683-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827065144.17683-1-lokeshvutla@ti.com>
References: <20200827065144.17683-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The J7200 SoC is a part of the K3 Multicore SoC architecture platform.
It is targeted for automotive gateway, vehicle compute systems,
Vehicle-to-Vehicle (V2V) and Vehicle-to-Everything (V2X) applications.
The SoC aims to meet the complex processing needs of modern embedded
products.

Some highlights of this SoC are:
* Dual Cortex-A72s in a single cluster, two clusters of lockstep
  capable dual Cortex-R5F MCUs and a Centralized Device Management and
  Security Controller (DMSC).
* Configurable L3 Cache and IO-coherent architecture with high data
  throughput capable distributed DMA architecture under NAVSS.
* Integrated Ethernet switch supporting up to a total of 4 external ports
  in addition to legacy Ethernet switch of up to 2 ports.
* Upto 1 PCIe-GEN3 controller, 1 USB3.0 Dual-role device subsystems,
  20 MCANs, 3 McASP, eMMC and SD, OSPI/HyperBus memory controller, I3C and
  I2C, eCAP/eQEP, eHRPWM among other peripherals.
* One hardware accelerator block containing AES/DES/SHA/MD5 called SA2UL
  management.

See J7200 Technical Reference Manual (SPRUIU1, June 2020)
for further details: https://www.ti.com/lit/pdf/spruiu1

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index c5e3e4aeda8e..829751209543 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -28,4 +28,8 @@ properties:
       - description: K3 J721E SoC
         items:
           - const: ti,j721e
+
+      - description: K3 J7200 SoC
+        items:
+          - const: ti,j7200
 ...
-- 
2.28.0

