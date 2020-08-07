Return-Path: <SRS0=8zDs=BR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Aug 2020 06:33:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84E08221E5
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Aug 2020 06:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R45U7rAJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgHGGdC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Aug 2020 02:33:02 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59128 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgHGGdC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Aug 2020 02:33:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0776WroD122174;
        Fri, 7 Aug 2020 01:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596781973;
        bh=SL76Kd6zMU76Cf9ukWAJUzm1OHNHCcXaOnuyQ+rJIDs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=R45U7rAJHR99e3h4QDnRebkK9nEOopqtG8eRPGfQy84DiO1CDlO8i6krMCA9/aiMD
         XeTCPY9q2LXuCTqwyPfQysLERzfzcnGWBGiE7w6ExCmwaZOe5lDZud/Zt++ga319V1
         iFciNwuJiBtBGPPorYaHb9c6wV9DcpUQeskAgwDc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0776WrEN063691;
        Fri, 7 Aug 2020 01:32:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 7 Aug
 2020 01:32:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 7 Aug 2020 01:32:52 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0776Wm1j065941;
        Fri, 7 Aug 2020 01:32:49 -0500
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
Message-ID: <7063a71c-2b91-3314-4ae9-283a38374806@ti.com>
Date:   Fri, 7 Aug 2020 12:02:48 +0530
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

Nishanth, Tero,

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

Can you Ack the DT patches?

Thanks and regards,
Lokesh
