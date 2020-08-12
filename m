Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DDEC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 02:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9062206DA
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 02:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lefbEPYF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgHLCOt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 22:14:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42518 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgHLCOt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Aug 2020 22:14:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07C2EM9o070631;
        Tue, 11 Aug 2020 21:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597198462;
        bh=vz9BEO3i2jUTUw/IKHhLkCoRWIB1qfwD0VHvKfxxhec=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lefbEPYFL+kZdcIKAEEOULw6p6eYv2ctX7LCeJyOFTEAnmIybsgXQH22PCGCZQ1ix
         7nnn5aO6+I2am+1xRe3h89WT6C7Hmy0ML2EayPEwwyR+mhnQq2uM4rtz5CRguCQkn4
         Yci6SwmTispJqko2bfeF9xRNGeGYYRvCONdiJ0i8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07C2EMPn011412;
        Tue, 11 Aug 2020 21:14:22 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 11
 Aug 2020 21:14:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 11 Aug 2020 21:14:22 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07C2EHeE066337;
        Tue, 11 Aug 2020 21:14:18 -0500
Subject: Re: [PATCH v6 00/13] irqchip: ti,sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
To:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <1fdd24e2-6579-857b-b62d-cff17c0250ef@ti.com>
Date:   Wed, 12 Aug 2020 07:44:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marc

On 06/08/20 1:18 pm, Lokesh Vutla wrote:
> Hi Marc,
> 	This is continuation of the RFC patches[0] regarding the driver
> updates to support for following interrupt parent connection:
> - INTR -> INTR
> - INTA -> GICv3
> The current existing driver assumes that INTR is always connected to
> GICv3 and INTA is always connected to INTR.
> 
> As discussed this change breaks the DT backward compatibility but it
> allows to not depend on TISCI firmware properties in DT node. IMHO, this
> will ensure that any future changes will not effect DT properties.
> 
> This series depends on the the new Yaml bindings for common TISCI[1].

This dependency is merged into mainline[0]. Is it possible to pull this series
in or is it too late to ask now?


[0]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt?id=2a2180206ab62b42c6a7fd3d77c47c3675cbc893

Thanks and regards,
Lokesh

> 
> [0] https://lore.kernel.org/linux-arm-kernel/20190923042405.26064-1-lokeshvutla@ti.com/
> [1] https://patchwork.kernel.org/patch/11676843/
> 
> Tested with: (There is a build error on Today's master while building dtbs. So I enabled
> 	      only the TI specific components for building DTBS).
> - DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml"
>   v8make dt_binding_check
> - DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml"
>   v8make dt_binding_check
> - DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml"
>   v8make dtbs_check
> - DT_SCHEMA_FILES="Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml"
>   v8make dtbs_check
> - v8make allmodconfig
> 
> Changes since v5:
> - Rebased on latest master.
> - Collected Reviewed-by from Rob.
> - Included DT changes in the same series so that everything can be merged in a single go.
>   Without DT changes, there are regressions for DMA and other consumer peripherals so suggestion
>   is to merge everthing in a single go. DT changes apply cleanly on next and Linus's master
>   without any merge conflicts.
> 
> Changes since v4:
> - Fixed Rob's comment on INTR and INTA yaml documentation
> - Collected Reviewed-by's and Acked-by's
> 
> Changes since v3:
> - Hardcode param_count based on parent instead of reading it from DT.
> - Drop storing TISCI device id in platform device id field.
> 
> Changes since v2:
> - Fixed comments from Rob
> - Fixed DT schema warnings.
> 
> Changes since v1:
> - Rebased on top of latest Linux master
> - Dropped DT patches.
> 
> Lokesh Vutla (13):
>   firmware: ti_sci: Drop the device id to resource type translation
>   firmware: ti_sci: Drop unused structure ti_sci_rm_type_map
>   firmware: ti_sci: Add support for getting resource with subtype
>   dt-bindings: irqchip: ti,sci-intr: Update bindings to drop the usage
>     of gic as parent
>   dt-bindings: irqchip: Convert ti,sci-intr bindings to yaml
>   irqchip/ti-sci-intr: Add support for INTR being a parent to INTR
>   dt-bindings: irqchip: ti,sci-inta: Update docs to support different
>     parent.
>   dt-bindings: irqchip: Convert ti,sci-inta bindings to yaml
>   irqchip/ti-sci-inta: Do not store TISCI device id in platform device
>     id field
>   irqchip/ti-sci-inta: Add support for INTA directly connecting to GIC
>   arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
>   arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
>   arm64: dts: k3-am65: Update the RM resource types
> 
>  .../interrupt-controller/ti,sci-inta.txt      |  66 --------
>  .../interrupt-controller/ti,sci-inta.yaml     |  98 +++++++++++
>  .../interrupt-controller/ti,sci-intr.txt      |  82 ---------
>  .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++
>  MAINTAINERS                                   |   4 +-
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  36 ++--
>  arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       |  12 +-
>  arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |   8 +-
>  .../arm64/boot/dts/ti/k3-am654-base-board.dts |   4 +-
>  .../dts/ti/k3-j721e-common-proc-board.dts     |  10 +-
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  43 ++---
>  .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  12 +-
>  drivers/firmware/ti_sci.c                     | 155 ++++++++----------
>  drivers/irqchip/irq-ti-sci-inta.c             |  95 +++++++++--
>  drivers/irqchip/irq-ti-sci-intr.c             | 152 ++++++++++-------
>  include/linux/soc/ti/ti_sci_protocol.h        |  13 ++
>  16 files changed, 516 insertions(+), 376 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> 
