Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A877CC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A18C20714
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jJ/j4nzK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgEFId0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 04:33:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54836 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728571AbgEFIdZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 04:33:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0468XFKH097065;
        Wed, 6 May 2020 03:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588753995;
        bh=qxLW8zfbMo7VUHjzjBXSAyvs4iufNiJAQThCFJXXZvQ=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=jJ/j4nzKPGh624uH+vhCYYcGX4/AJAgM1/bbUjdPUz73rjWXg4g7eAeg/4Ctv6Anx
         hiOKrJ36WwiuqVW6cpUOyeiM7WQtX7/Yq2btHXsufvD/7ICGTtAwXVp67sF7Ov2Ru5
         y+g/f59tWMjc3o2pcg5FTqPA2aFul46zdfFQNCQY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0468XF0b100984;
        Wed, 6 May 2020 03:33:15 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 03:33:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 03:33:15 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0468XD6p121387;
        Wed, 6 May 2020 03:33:13 -0500
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
 <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
 <20200506082843.mkhip2n2uiimcf2z@rcn-XPS-13-9360>
CC:     <devicetree@vger.kernel.org>, <jason@lakedaemon.net>,
        <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        <kernel@collabora.com>, <linux-arm-kernel@lists.infradead.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a571c6a8-1b36-10fa-e0e1-c535563c62e9@ti.com>
Date:   Wed, 6 May 2020 11:33:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506082843.mkhip2n2uiimcf2z@rcn-XPS-13-9360>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06/05/2020 11:28, Ricardo Cañuelo wrote:
> Hi Tomi,
> 
> On mié 06-05-2020 11:01:07, Tomi Valkeinen wrote:
>> Doesn't all this just point to a bug or missing feature in dt_binding_check?
>> That's not a reason to change the ABI.
> 
> I agree and I'd vote for "missing feature", but seeing that there aren't
> any other examples of this use case in the whole kernel dts collection
> (at least I couldn't find any) I thought that maybe it's us who are
> going against the norm here.

A valid point. I'm not aware of anyone using the deskew property. My guess is that Laurent added it 
just because it was in the spec, not because he had a need for it. So I don't think changing the 
binding is totally out of the question.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
