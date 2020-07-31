Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214B1C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 18:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0832822B42
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 18:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GxaFQAVR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387760AbgGaSYZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 14:24:25 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51236 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387716AbgGaSYZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 14:24:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06VIOIDp042321;
        Fri, 31 Jul 2020 13:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596219858;
        bh=Q4sB5JsOZu0IoX+j8z1C39WAET3Gz/Fy0CLyBNmJLO0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GxaFQAVRltzw/tSGUmtUfuIyFXLpcvO/eAjnY023j9t5otTnDx0aBNdIf/F2iVW97
         grpIgprSjkifeX6DzMOzL/hOEWXZeCSnx9G8Bgn3QZlQIL2cZ788gLoVfevbM0E7/E
         +u+9lRnPQ0iSE5bgyR3nM/S3Rv3ZJXTh0rk/FZ7o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06VIOI89065067
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 Jul 2020 13:24:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 31
 Jul 2020 13:24:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 31 Jul 2020 13:24:17 -0500
Received: from [10.250.34.248] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06VIOHag073540;
        Fri, 31 Jul 2020 13:24:17 -0500
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
To:     Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200728051735.6187-1-lokeshvutla@ti.com>
 <d017863c0da4950016f6d4e7fb34d7c7@kernel.org> <20200731181658.GA500828@bogus>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <733bbcdc-8d29-51cc-f16e-7f95abb56ff2@ti.com>
Date:   Fri, 31 Jul 2020 13:24:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731181658.GA500828@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 7/31/20 1:16 PM, Rob Herring wrote:
> On Fri, Jul 31, 2020 at 06:01:50PM +0100, Marc Zyngier wrote:
>> On 2020-07-28 06:17, Lokesh Vutla wrote:
>>> Hi Marc,
>>> 	This is continuation of the RFC patches[0] regarding the driver
>>> updates to support for following interrupt parent connection:
>>> - INTR -> INTR
>>> - INTA -> GICv3
>>> The current existing driver assumes that INTR is always connected to
>>> GICv3 and INTA is always connected to INTR.
>>
>> I'm OK to take this if I can get an Ack from RobH on the three
>> DT patches that still need it.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> However, there's a dependency on
> bindings/arm/keystone/ti,k3-sci-common.yaml.
> 
> That's a dependency on this being merged. I don't care if it breaks in
> your tree, but I care for -next and Linus' tree. There could also be
> other 'make dt_bindings_check' failures/warnings with this as the above
> dependency prevents further testing.
> 

Bjorn did pick up the above common binding file through the remoteproc 
tree, and it is available in -next. That said, I donno the merge order 
between remoteproc and irq subsystem trees into -next, and if that is a 
concern.

regards
Suman
