Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FECC433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 05:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F6FD20658
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 05:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FF/gxGyZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgG1FSJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 01:18:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47132 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgG1FSI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 01:18:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06S5HmWv096176;
        Tue, 28 Jul 2020 00:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595913468;
        bh=+PM89uaysKvtCbkKl9T6TeJCFoY4Nu7SUqmRj7w0l08=;
        h=From:To:CC:Subject:Date;
        b=FF/gxGyZfo8WbW1wriGUJK4X5l0hHRX4KJEROkPUHHdnxYhtDTNMD+AaDKIqsAKlA
         Oly9MgVqYp/qwVLQn43Rnh/G/72XCexNNN0h6rfWmQc+guXJQBHc9SYRyHVbgqPomf
         kL2y3Qg2mN5RDOAHH95G5p7VpMLcIK12xyLWvUgY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06S5HmCN028691;
        Tue, 28 Jul 2020 00:17:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 00:17:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 00:17:41 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06S5Hass005947;
        Tue, 28 Jul 2020 00:17:37 -0500
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
Subject: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt bindings to accept different interrupt parents
Date:   Tue, 28 Jul 2020 10:47:25 +0530
Message-ID: <20200728051735.6187-1-lokeshvutla@ti.com>
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

Tested with:
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml"
  v8make dt_binding_check
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml"
  v8make dt_binding_check
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml"
  v8make dtbs_check
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml"
  v8make dtbs_check
 

Changes since v4:
- Fixed Rob's comment on INTR and INTA yaml documentation
- Collected Reviewed-by's and Acked-by's

Changes since v3:
- Hardcode param_count based on parent instead of reading it from DT.
- Drop storing TISCI device id in platform device id field.

Changes since v2:
- Fixed comments from Rob
- Fixed DT schema warnings.

Changes since v1:
- Rebased on top of latest Linux master
- Dropped DT patches.


Lokesh Vutla (10):
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
  irqchip/ti-sci-inta: Do not store TISCI device id in platform device
    id field
  irqchip/ti-sci-inta: Add support for INTA directly connecting to GIC

 .../interrupt-controller/ti,sci-inta.txt      |  66 --------
 .../interrupt-controller/ti,sci-inta.yaml     |  98 +++++++++++
 .../interrupt-controller/ti,sci-intr.txt      |  82 ---------
 .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++
 MAINTAINERS                                   |   4 +-
 drivers/firmware/ti_sci.c                     | 155 ++++++++----------
 drivers/irqchip/irq-ti-sci-inta.c             |  95 +++++++++--
 drivers/irqchip/irq-ti-sci-intr.c             | 152 ++++++++++-------
 include/linux/soc/ti/ti_sci_protocol.h        |  13 ++
 9 files changed, 455 insertions(+), 312 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml

-- 
2.27.0

