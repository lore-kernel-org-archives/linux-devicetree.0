Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDA1C83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 09:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C5B2072A
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 09:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BV2Zxe4i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgD1Jtp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 05:49:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33940 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgD1Jtp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 05:49:45 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03S9nVvV082105;
        Tue, 28 Apr 2020 04:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588067371;
        bh=vi0lak+PESiDwZ0/mkWQsOclkMxH3g4XyeOihRduJy0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BV2Zxe4iPkNu9gqmZtuR65pMPOlIdfT97ro6vS3YbgPm2ft2TJUXz7uNUjFjrMRQC
         bsuhpdiehprVO7oAn7t1LvTtcfkfzR6Ob62FFWFZes+xUeE2O97t3nlCpHbVi83wMH
         HblNblvH7SfOJO0jzx3pMKO4p0Wu6nP+1TWjcxLc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03S9nVL8026251
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Apr 2020 04:49:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 04:49:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 04:49:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03S9nS0F037890;
        Tue, 28 Apr 2020 04:49:29 -0500
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC:     <kernel@collabora.com>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>, <jason@lakedaemon.net>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
Date:   Tue, 28 Apr 2020 12:49:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/04/2020 12:20, Ricardo Cañuelo wrote:

> 2) The definition of ti,deskew in the original binding seems to be
> tailored to the current driver and the way it's defined may not be very
> DT-friendly.
> 
>    This parameter maps to a 3-bit field in a hardware register that takes
>    a value from 0 to 7, so the [-4, 3] range described for this would map
>    to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.
> 
>    Then, the driver parses the parameter (unsigned) and casts it to a
>    signed integer to get a number in the [-4, 3] range.

Interestingly the current example has ti,deskew = <4>...

>    A vendor-specific property must have a type definition in json-schema,
>    so if I translate the original bindings semantics directly, I should
>    define ti,deskew as an int32, but this makes dt_binding_check fail if
>    the property has a negative value in the example because of the
>    internal representation of cells as unsigned integers:
> 
>       ti,deskew:0:0: 4294967293 is greater than the maximum of 2147483647

I don't quite understand this. We cannot have negative numbers in dts files? Or we can, but 
dt_binding_check doesn't handle them correctly? Or that int32 is not supported in yaml bindings?

>    So I can think of two solutions to this:
> 
>    a) Keep the ti,deskew property as an uint32 and document the valid
>    range ([-4, 3]) in the property description (this is what this patch
>    does currently).
> 
>    b) Redefine this property to be closer to the datasheet description
>    (ie. unsigned integers from 0 to 7) and adapt the driver accordingly.
>    This would also let us define its range properly using minimum and
>    maximum properties for it.
> 
>    I think (b) is the right thing to do but I want to know your
>    opinion. Besides, I don't have this hardware at hand and if I updated
>    the driver I wouldn't be able to test it.

I don't think anyone has used deskew property, so I guess changing it is not out of the question.

Laurent, did you have a board that needs deskew when you added it to tfp410?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
