Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10633C4725A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC3E120735
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SH5rp8H6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgEFIB1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 04:01:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39940 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgEFIB1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 04:01:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04681AAp085965;
        Wed, 6 May 2020 03:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588752070;
        bh=fBYH/OX0qOF7iUC5jWzL2Vp1Y/k89aTRhZ5X4WhtbVQ=;
        h=Subject:To:References:From:CC:Date:In-Reply-To;
        b=SH5rp8H6na/BZ2COWCJ33YYXkVuSiZG9LAsdvD2sQ4mA6+y9W05Z7J64OJkPjkapV
         5xslt58ms22BNBr+0RKUUddBHlzz9nCamW3YypoxOLZGzZ2AcwXIT/nyHkrkQVWAgQ
         I6UGuipTdXpM/rUgxLt6xdVtepEkXb2wEE44O/wQ=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04681AEP016756
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 May 2020 03:01:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 03:01:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 03:01:10 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046818LP058281;
        Wed, 6 May 2020 03:01:08 -0500
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        <kernel@collabora.com>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>, <jason@lakedaemon.net>
Message-ID: <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
Date:   Wed, 6 May 2020 11:01:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On 06/05/2020 10:21, Ricardo Cañuelo wrote:
> Hi Tomi, thanks for reviewing the patch.
> 
> On mar 28-04-2020 12:49:28, Tomi Valkeinen wrote:
>> I don't quite understand this. We cannot have negative numbers in dts files?
>> Or we can, but dt_binding_check doesn't handle them correctly? Or that int32
>> is not supported in yaml bindings?
> 
> AFAICT, you can have negative numbers in dts files (see [1] and [2]) and

This is also my understanding after some googling. And there's even of_property_read_s32() in the 
kernel.

> the DT schema certainly supports signed integers, but dt_binding_check
> seems to interpret all cells as unsigned 32bit integers because that's
> what they are, really. In kernel code this is not a problem because you

Well, this is in the nitpick category, and maybe not even relevant, but I don't think that's 
correct. They're just bits. Some pieces of SW happen to use u32 containers to store the bits. But 
what the bits mean is not related to the container.

> can cast the value back to a signed int before you run your own sanity
> checks on them.

Doesn't all this just point to a bug or missing feature in dt_binding_check? That's not a reason to 
change the ABI.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
