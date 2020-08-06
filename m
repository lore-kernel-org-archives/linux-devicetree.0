Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997B0C43619
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E95E2312E
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DpBIL8xU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgHFHtW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:49:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgHFHtH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767mXMg108540;
        Thu, 6 Aug 2020 02:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700113;
        bh=3M4CuMX5MIgPdgE/0mpUEmd2g7W/gj9qcBLithCYER0=;
        h=From:To:CC:Subject:Date;
        b=DpBIL8xU6g7SKTMGtoI++/Mfufa4dze3+iDQHCTADFVGSPgtjao0VGT1PH5lEVo9O
         3NMjVDwbpVuZLWbxnxAV+7D9lcetAs5223SpyVn61p/6ikvRVyuvHQLgpP0WMKye4R
         z5cnZHxuc3SfCTOWX5hT5Cq8LHwGO2nuVAzJ0Y40=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767mXOn078259
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:48:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:48:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:48:32 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSYn051454;
        Thu, 6 Aug 2020 02:48:29 -0500
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
Subject: [PATCH v6 00/13] irqchip: ti,sci-intr/inta: Update the dt bindings to accept different interrupt parents 
Date:   Thu, 6 Aug 2020 13:18:13 +0530
Message-ID: <20200806074826.24607-1-lokeshvutla@ti.com>
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

This series depends on the the new Yaml bindings for common TISCI[1].

[0] https://lore.kernel.org/linux-arm-kernel/20190923042405.26064-1-lokeshvutla@ti.com/
[1] https://patchwork.kernel.org/patch/11676843/

Tested with: (There is a build error on Today's master while building dtbs. So I enabled
	      only the TI specific components for building DTBS).
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml"
  v8make dt_binding_check
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml"
  v8make dt_binding_check
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml"
  v8make dtbs_check
- DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml"
  v8make dtbs_check
- v8make allmodconfig

Changes since v5:
- Rebased on latest master.
- Collected Reviewed-by from Rob.
- Included DT changes in the same series so that everything can be merged in a single go.
  Without DT changes, there are regressions for DMA and other consumer peripherals so suggestion
  is to merge everthing in a single go. DT changes apply cleanly on next and Linus's master
  without any merge conflicts.

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

Lokesh Vutla (13):
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
  arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
  arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
  arm64: dts: k3-am65: Update the RM resource types

 .../interrupt-controller/ti,sci-inta.txt      |  66 --------
 .../interrupt-controller/ti,sci-inta.yaml     |  98 +++++++++++
 .../interrupt-controller/ti,sci-intr.txt      |  82 ---------
 .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++
 MAINTAINERS                                   |   4 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  36 ++--
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       |  12 +-
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |   8 +-
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |   4 +-
 .../dts/ti/k3-j721e-common-proc-board.dts     |  10 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  43 ++---
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  12 +-
 drivers/firmware/ti_sci.c                     | 155 ++++++++----------
 drivers/irqchip/irq-ti-sci-inta.c             |  95 +++++++++--
 drivers/irqchip/irq-ti-sci-intr.c             | 152 ++++++++++-------
 include/linux/soc/ti/ti_sci_protocol.h        |  13 ++
 16 files changed, 516 insertions(+), 376 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml

-- 
2.27.0

