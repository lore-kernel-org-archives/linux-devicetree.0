Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D3DC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 10:19:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0011D20768
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 10:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jy/tVGmt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgHMKTY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 06:19:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48334 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMKTY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 06:19:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07DAJI58017721;
        Thu, 13 Aug 2020 05:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597313958;
        bh=Cbz33r3CX7ZnUZ3oHwbZWdp+GkcWAew0QE81gMWOJxY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jy/tVGmtrbxXIEyQN/iQkL/UUfvD3LotOoqldkrcvi+xJtp4lFvcyebDTFgrK3G4a
         SOAB1e0khUs1LPWPGLojx/RLuuaqBVTNZ2ikTUSudLLkZblr5msY2YEVMV2RUEUCJN
         BZyO7tj6P+WMfJWcl1ri6379YNIsHPQn/dy28amE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07DAJIeb061523
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Aug 2020 05:19:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 13
 Aug 2020 05:19:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 13 Aug 2020 05:19:18 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07DAJFA9056032;
        Thu, 13 Aug 2020 05:19:15 -0500
Subject: Re: [PATCH v6 00/13] irqchip: ti,sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
To:     Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod <vkoul@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
 <31a0d207-cafa-8524-0364-b0bc55db6f6d@ti.com>
 <26dffb1a-8e1b-db7f-dde6-98af607799f5@ti.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <09e3054c-efa8-b700-b285-85629f276681@ti.com>
Date:   Thu, 13 Aug 2020 13:20:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <26dffb1a-8e1b-db7f-dde6-98af607799f5@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sekhar,

On 13/08/2020 13.03, Sekhar Nori wrote:
> On 8/13/20 3:11 PM, Peter Ujfalusi wrote:
>> Hi Lokesh,
>>
>> On 06/08/2020 10.48, Lokesh Vutla wrote:
>>> Hi Marc,
>>> 	This is continuation of the RFC patches[0] regarding the driver
>>> updates to support for following interrupt parent connection:
>>> - INTR -> INTR
>>> - INTA -> GICv3
>>> The current existing driver assumes that INTR is always connected to
>>> GICv3 and INTA is always connected to INTR.
>>>
>>> As discussed this change breaks the DT backward compatibility but it
>>> allows to not depend on TISCI firmware properties in DT node. IMHO, t=
his
>>> will ensure that any future changes will not effect DT properties.
>>
>> Just to note:
>> this series will demand new sysfw (with ABI 3.0+) to boot (well, to ha=
ve
>> usable intr/inta). Sysfw ABI 3.0 carries other non compatible changes
>> affecting DMA on am654: TR mode channels for servicing peripherals wil=
l
>> fail at request time since the channel OES offset value is different
>> compared to older sysfw ABI.
>>
>> The good news is that other channels are _not_ affected by this, so
>> packet mode channels and mem2mem TR channel pairs will work just fine =
-
>> as you have tested it already w/ NFS boot.
>> We do not have upstream users for TR mode channels for peripherals, it=

>> is only in my local branch for audio.
>>
>> I can send a patch for UDMA to be picked up by Marc on top of this
>> series to avoid this, if it is OK with Marc to pick it up.
> This series is already straddling too many subsystems, I would not
> complicate this any further.
>=20
> Moreover, since there are no upstream users for TR mode peripheral
> channels those changes can wait, right?

It can, yes. I can send the patch for -rc2 of the release this series is
merged.

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

