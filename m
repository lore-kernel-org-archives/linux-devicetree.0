Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA30C433E6
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 06:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6A6820672
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 06:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rwuFLbad"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgGUGKW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 02:10:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50024 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgGUGKW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 02:10:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06L6AEAg101909;
        Tue, 21 Jul 2020 01:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595311814;
        bh=oKRAwy1gVFVujNKnJrnrL1LYZ5HRD7zeciasF6OCHBk=;
        h=From:To:CC:Subject:Date;
        b=rwuFLbadm9G0YuKBAe6/DuohbR+aAvEZW7JArnqUksS5gi3iWJ0W5Q8/e4f8e76GC
         JOE8oRjpzlLJsqAPNuVfCFBfzcwEy9WQ72TLuqowcAO6N5h+a4UDEZ0mpeqcICKDHC
         QBp3R9O/PAalWoTa99z/abKdPFAOI++zsG9B4LjQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06L6AEpk126277
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 01:10:14 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 21
 Jul 2020 01:10:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 21 Jul 2020 01:10:14 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06L6A8J3091920;
        Tue, 21 Jul 2020 01:10:09 -0500
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
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 0/9] irqchip: ti,sci-intr/inta: Update the dt bindings to accept different interrupt parents
Date:   Tue, 21 Jul 2020 11:39:58 +0530
Message-ID: <20200721061007.28324-1-lokeshvutla@ti.com>
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

[0] https://lore.kernel.org/linux-arm-kernel/20190923042405.26064-1-lokeshvutla@ti.com/

Changes since v1:
- Rebased on top of latest Linux master
- Dropped DT patches.

Intention to re-post the series is to get it in the review queue.

Thanks and regards,
Lokesh

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
 .../interrupt-controller/ti,sci-inta.yaml     | 104 ++++++++++++
 .../interrupt-controller/ti,sci-intr.txt      |  82 ---------
 .../interrupt-controller/ti,sci-intr.yaml     | 113 +++++++++++++
 MAINTAINERS                                   |   4 +-
 drivers/firmware/ti_sci.c                     | 155 ++++++++----------
 drivers/irqchip/irq-ti-sci-inta.c             |  90 ++++++++--
 drivers/irqchip/irq-ti-sci-intr.c             | 150 ++++++++++-------
 include/linux/soc/ti/ti_sci_protocol.h        |  13 ++
 9 files changed, 468 insertions(+), 309 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml

-- 
2.27.0

