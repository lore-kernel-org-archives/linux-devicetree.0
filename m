Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52511C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 17:52:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29A2E22B40
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 17:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U3E1dHh4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgGaRwC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 13:52:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43082 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbgGaRwC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 13:52:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06VHps8D021098;
        Fri, 31 Jul 2020 12:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596217914;
        bh=u6Crb4yfZhq7ntoHoh8rws+4hwYhhRM8x9dTgzvcrmU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=U3E1dHh4Xf5hI9+ROErEYYey2yaF7zeNYXvpAIEtBe2iTSwjgD61qwl76nkbceoEj
         IdzxYM3VZpogxnf7bc90h5c+DZ7szYpp6Jb86eTinMkimdG3HY5SackxmBNz+nzMGp
         x+rKS+cGabplITs14kb04lfAlyYuSTlQnA5eKSKg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06VHpsle019414
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 Jul 2020 12:51:54 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 31
 Jul 2020 12:51:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 31 Jul 2020 12:51:53 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06VHpnD1019210;
        Fri, 31 Jul 2020 12:51:50 -0500
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
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
References: <20200728051735.6187-1-lokeshvutla@ti.com>
 <d017863c0da4950016f6d4e7fb34d7c7@kernel.org>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <380e0f07-9e36-3413-1016-4cde6a22e26f@ti.com>
Date:   Fri, 31 Jul 2020 23:21:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d017863c0da4950016f6d4e7fb34d7c7@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 31/07/20 10:31 pm, Marc Zyngier wrote:
> On 2020-07-28 06:17, Lokesh Vutla wrote:
>> Hi Marc,
>>     This is continuation of the RFC patches[0] regarding the driver
>> updates to support for following interrupt parent connection:
>> - INTR -> INTR
>> - INTA -> GICv3
>> The current existing driver assumes that INTR is always connected to
>> GICv3 and INTA is always connected to INTR.
> 
> I'm OK to take this if I can get an Ack from RobH on the three
> DT patches that still need it.

Thanks Marc.

Rob,
	If you don't have any further comments on DT bindings, can you please ack the
patches?

Thanks and regards,
Lokesh
