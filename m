Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20A3C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 14:19:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A311320771
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 14:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K+CBxmdh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgGXOTI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 10:19:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52786 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgGXOTH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jul 2020 10:19:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06OEIm62085739;
        Fri, 24 Jul 2020 09:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595600329;
        bh=19k8DA4Q1cHUv4MK3B2ZIf6flcxWQj/5hijdVVn7j68=;
        h=From:To:CC:Subject:Date;
        b=K+CBxmdhDoSLrxEBtWYv0Dy8ChL+UYB1Jdmz7FF+9hUBLsEVBNAqCpz754KC+Xoqk
         mNbjpp09SI3qEOB0rtRo6Q0ksGI/Hx9CYQNKrOXeyOMkjM+OPUK42LIPWxZ9UuDltb
         7BkyCj36e8DL4GalSNYZZnrhShMp9q0CB6612QWM=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06OEImor022277
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jul 2020 09:18:48 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Jul 2020 09:18:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Jul 2020 09:18:48 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OEIiXo016316;
        Fri, 24 Jul 2020 09:18:44 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v3 0/9] irqchip: ti, sci-intr/inta: Update the dt bindings to accept different interrupt parents
Date:   Fri, 24 Jul 2020 19:48:28 +0530
Message-ID: <20200724141837.4542-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marc,
	This is continuation of the RFC patches[0] regarding the driver
updates to support for following interrupt parent connection:
- INTR -> INTR
- INTA -> GICv3
The current existing driver assumes that INTR is always connected to
GICv3 and INTA is always connected to INTR.

As discussed this change breaks the DT backward compatibility but it
allows to not depend on TISCI firmware properties in DT node. IMHO, this
will ensure that any future changes will not effect DT properties.

This series depends on the the new Yaml bindings for common TISCI[1]

[0] https://lore.kernel.org/linux-arm-kernel/20190923042405.26064-1-lokeshvutla@ti.com/
[1] https://patchwork.kernel.org/patch/11676843/

Changes since v2:
- Fixed comments from Rob
- Fixed DT schema warnings.

Changes since v1:
- Rebased on top of latest Linux master
- Dropped DT patches.

Lokesh Vutla (9):
  firmware: ti_sci: Drop the device id to resource type translation
  firmware: ti_sci: Drop unused structure ti_sci_rm_type_map
  firmware: ti_sci: Add support for getting resource with subtype
  dt-bindings: irqchip: ti,sci-intr: Update bindings to drop the usage
    of gic as parent
  dt-bindings: irqchip: Convert ti,sci-intr bindings to yaml
  irqchip/ti-sci-intr: Add support for INTR being a parent to INTR
  dt-bindings: irqchip: ti,sci-inta: Update docs to support different
    parent.
  dt-bindings: irqchip: Convert ti,sci-inta bindings to yaml
  irqchip/ti-sci-inta: Add support for INTA directly connecting to GIC

 .../interrupt-controller/ti,sci-inta.txt      |  66 --------
 .../interrupt-controller/ti,sci-inta.yaml     |  98 +++++++++++
 .../interrupt-controller/ti,sci-intr.txt      |  82 ---------
 .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++
 MAINTAINERS                                   |   4 +-
 drivers/firmware/ti_sci.c                     | 155 ++++++++----------
 drivers/irqchip/irq-ti-sci-inta.c             |  90 ++++++++--
 drivers/irqchip/irq-ti-sci-intr.c             | 150 ++++++++++-------
 include/linux/soc/ti/ti_sci_protocol.h        |  13 ++
 9 files changed, 451 insertions(+), 309 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml

-- 
2.27.0

