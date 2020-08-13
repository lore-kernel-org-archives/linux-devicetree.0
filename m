Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A68C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 09:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EC182080C
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 09:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y8aOEZwI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgHMJjz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 05:39:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38598 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgHMJjy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 05:39:54 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07D9dZQd070040;
        Thu, 13 Aug 2020 04:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597311575;
        bh=rZEumhrIkKKM9dbtiYQsEtPLv1wJRa51pymiLJTtqG4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y8aOEZwIJEAMzV0FFwB/xJ1A6Wagw5XGJKfLz7J3cjzM9YClqUadgli2BOwpBT9/R
         7rBlYllXGqNhnoDi9X7fPSSNBFg/ATr1RNhXAeJ1D3JTYf/ebtQWWTkepoUI6m19Vc
         Fz/3/O7zqkYdR+eCrSVK4DQ6Hp9uYw+ja8oDu+Jo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07D9dZSf122124
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Aug 2020 04:39:35 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 13
 Aug 2020 04:39:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 13 Aug 2020 04:39:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07D9dVVt068509;
        Thu, 13 Aug 2020 04:39:32 -0500
Subject: Re: [PATCH v6 00/13] irqchip: ti,sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
To:     Lokesh Vutla <lokeshvutla@ti.com>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod <vkoul@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <31a0d207-cafa-8524-0364-b0bc55db6f6d@ti.com>
Date:   Thu, 13 Aug 2020 12:41:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Lokesh,

On 06/08/2020 10.48, Lokesh Vutla wrote:
> Hi Marc,
> 	This is continuation of the RFC patches[0] regarding the driver
> updates to support for following interrupt parent connection:
> - INTR -> INTR
> - INTA -> GICv3
> The current existing driver assumes that INTR is always connected to
> GICv3 and INTA is always connected to INTR.
>=20
> As discussed this change breaks the DT backward compatibility but it
> allows to not depend on TISCI firmware properties in DT node. IMHO, thi=
s
> will ensure that any future changes will not effect DT properties.

Just to note:
this series will demand new sysfw (with ABI 3.0+) to boot (well, to have
usable intr/inta). Sysfw ABI 3.0 carries other non compatible changes
affecting DMA on am654: TR mode channels for servicing peripherals will
fail at request time since the channel OES offset value is different
compared to older sysfw ABI.

The good news is that other channels are _not_ affected by this, so
packet mode channels and mem2mem TR channel pairs will work just fine -
as you have tested it already w/ NFS boot.
We do not have upstream users for TR mode channels for peripherals, it
is only in my local branch for audio.

I can send a patch for UDMA to be picked up by Marc on top of this
series to avoid this, if it is OK with Marc to pick it up.

The change is well isolated away from the rest of the driver, so it
should be safe (famous last words?)

- P=C3=A9ter

> This series depends on the the new Yaml bindings for common TISCI[1].
>=20
> [0] https://lore.kernel.org/linux-arm-kernel/20190923042405.26064-1-lok=
eshvutla@ti.com/
> [1] https://patchwork.kernel.org/patch/11676843/
>=20
> Tested with: (There is a build error on Today's master while building d=
tbs. So I enabled
> 	      only the TI specific components for building DTBS).
> - DT_SCHEMA_FILES=3D"Documentation/devicetree/bindings/interrupt-contro=
ller/ti,sci-intr.yaml"
>   v8make dt_binding_check
> - DT_SCHEMA_FILES=3D"Documentation/devicetree/bindings/interrupt-contro=
ller/ti,sci-inta.yaml"
>   v8make dt_binding_check
> - DT_SCHEMA_FILES=3D"Documentation/devicetree/bindings/interrupt-contro=
ller/ti,sci-intr.yaml"
>   v8make dtbs_check
> - DT_SCHEMA_FILES=3D"Documentation/devicetree/bindings/interrupt-contro=
ller/ti,sci-inta.yaml"
>   v8make dtbs_check
> - v8make allmodconfig
>=20
> Changes since v5:
> - Rebased on latest master.
> - Collected Reviewed-by from Rob.
> - Included DT changes in the same series so that everything can be merg=
ed in a single go.
>   Without DT changes, there are regressions for DMA and other consumer =
peripherals so suggestion
>   is to merge everthing in a single go. DT changes apply cleanly on nex=
t and Linus's master
>   without any merge conflicts.
>=20
> Changes since v4:
> - Fixed Rob's comment on INTR and INTA yaml documentation
> - Collected Reviewed-by's and Acked-by's
>=20
> Changes since v3:
> - Hardcode param_count based on parent instead of reading it from DT.
> - Drop storing TISCI device id in platform device id field.
>=20
> Changes since v2:
> - Fixed comments from Rob
> - Fixed DT schema warnings.
>=20
> Changes since v1:
> - Rebased on top of latest Linux master
> - Dropped DT patches.
>=20
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
>=20
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
>  drivers/firmware/ti_sci.c                     | 155 ++++++++----------=

>  drivers/irqchip/irq-ti-sci-inta.c             |  95 +++++++++--
>  drivers/irqchip/irq-ti-sci-intr.c             | 152 ++++++++++-------
>  include/linux/soc/ti/ti_sci_protocol.h        |  13 ++
>  16 files changed, 516 insertions(+), 376 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/ti,sci-inta.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/ti,sci-inta.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/ti,sci-intr.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/ti,sci-intr.yaml
>=20


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

