Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74537C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 03:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CAD6208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 03:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LEr4JJb5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgH1DOl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 23:14:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47196 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgH1DOk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 23:14:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07S3EZlD118838;
        Thu, 27 Aug 2020 22:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598584475;
        bh=loeDIemJjUVPeE1cWTUci6Wghq6KHUlVFllx5h1Rt+k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LEr4JJb5eOURW/J17iHQT1EtWfV/vv2k2k82dO2M3E2aS1+jjedPCNfiNCCtToJAX
         pPdwWjpk3qhBCzGCXusqKHu3m4FldlP+7BdXVniNql0q6zQZo+7f4x8tHxtiFg0dZ+
         eA0AGPuCnVqKzuD3+BLAqwbO+kiY+4eypgg3YCWg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07S3EZ54017744
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 22:14:35 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 22:14:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 22:14:35 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S3EVhc015962;
        Thu, 27 Aug 2020 22:14:32 -0500
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ti: Convert K3 board/soc
 bindings to DT schema
To:     Nishanth Menon <nm@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
References: <20200827065144.17683-1-lokeshvutla@ti.com>
 <20200827065144.17683-2-lokeshvutla@ti.com>
 <20200828004105.givypeu3vextefc6@akan>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <1c9508ce-9336-e20a-5b58-5dd257247273@ti.com>
Date:   Fri, 28 Aug 2020 08:44:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200828004105.givypeu3vextefc6@akan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nishanth,

On 28/08/20 6:11 am, Nishanth Menon wrote:
> On 12:21-20200827, Lokesh Vutla wrote:
>> Convert TI K3 Board/SoC bindings to DT schema format.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  .../devicetree/bindings/arm/ti/k3.txt         | 26 ----------------
>>  .../devicetree/bindings/arm/ti/k3.yaml        | 31 +++++++++++++++++++
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 32 insertions(+), 27 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt
>>  create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.yaml
> 
> 
> Thanks for doing this, but I have a problem with dbs_check and dtbs
> W=2 build warnings on existing dts files that this exposes further..

IMHO, that should not block the conversion to yaml bindings. May I know the
problem you are seeing?

> Do you mind pulling this patch out of this j7200 series ? I would
> rather us cleanup the warnings a bit as well, and deal with yaml
> conversion seperate from j7200 bindings?

Ill wait for Rob's view on this. He already asked to convert it during J721e
binding update. Not sure we would like to delay any further.

Thanks and regards,
Lokesh

> 
> We will need Rob's ack anyways, I would rather we look at things
> independently.
> 
