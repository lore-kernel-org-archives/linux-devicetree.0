Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DC1C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 13:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D6772076C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 13:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F/Mcb8Ga"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHLNkq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 09:40:46 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48764 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgHLNkp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 09:40:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CDeUSq006226;
        Wed, 12 Aug 2020 08:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597239630;
        bh=XZyI6ATGBEktft+tTBs7WYlJW2zc+4f4sVgdedX/G20=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=F/Mcb8GazliPQqaXlMW6cM3evNmFx+Sfnu52qdjTgeHputFkdrLdPq257hLfk6SAD
         qVow87pmGQfp1N0wa2DOMsW++6lS1XnBopJyD739JpmwEfZNnigelMrmLZrCRdL1Lx
         65f9s+qi/7AoCRa/J9HxgfjNA2LgMzIhEhAWObc4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07CDeUtj057289
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Aug 2020 08:40:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 08:40:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 08:40:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CDeUem095297;
        Wed, 12 Aug 2020 08:40:30 -0500
Date:   Wed, 12 Aug 2020 08:40:30 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
CC:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v6 00/13] irqchip: ti,sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
Message-ID: <20200812134030.pxkxsj4427pawv66@akan>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 13:18-20200806, Lokesh Vutla wrote:
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
> 
> [0] https://lore.kernel.org/linux-arm-kernel/20190923042405.26064-1-lokeshvutla@ti.com/
> [1] https://patchwork.kernel.org/patch/11676843/


Marc,
Noticed that Bjorn's merges seem all done, and checked if the series
applies to irq/base-5.9 (but I am not entirely sure where you want the
series to go to) - but anyways, I have acked the dts series if you are
planning on picking it up in 5.9 - does'nt conflict in master or next-20200812

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
