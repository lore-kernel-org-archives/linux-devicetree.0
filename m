Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434B8C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 04:18:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F411C2082E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 04:18:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AOlCn6WH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgEGESK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 00:18:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39306 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgEGESK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 00:18:10 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0474I3H7126858;
        Wed, 6 May 2020 23:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588825083;
        bh=GcWsPZiMfU+VZv3O8zyDrNBYFrf3vnShAR4Ivpe24S0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AOlCn6WHBLltyz367DATmLQfsgEUkK3hvs3jPpxK5nb9WNsuapelOrhUikC2DvfYk
         7wQGQLNQAqszA2tntGcBmeqtyFkZDLvmlsKaTcYhPn9s29B54TSzXJk1j6U7oDrvAL
         Y9+u0WAFkzCx/pvuNQPB1QdQZOhqCNM4vJ3+E30g=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0474I3f3107756
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 May 2020 23:18:03 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 23:18:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 23:18:03 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0474Hxvd019783;
        Wed, 6 May 2020 23:18:00 -0500
Subject: Re: [PATH v4 1/2] phy: cadence: salvo: add salvo phy driver
To:     Peter Chen <hzpeterchen@gmail.com>
CC:     Oliver Graute <oliver.graute@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
        <jun.li@nxp.com>, <linux-imx@nxp.com>,
        Vinod Koul <vkoul@kernel.org>
References: <20200401013851.16227-1-peter.chen@nxp.com>
 <20200409143205.GA15163@portage>
 <CAL411-rfxO-88aPaiDcjW+ri+RKMFz=C6tkNMztWYA-+uNvopA@mail.gmail.com>
 <d91e7b91-4197-3f5e-ba0d-854281b94403@ti.com>
 <CAL411-oycAoGFwStjcr4Xjxat=p0syketTLf7yN+ntBrFsCY-Q@mail.gmail.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <c448d7cd-402f-c75a-1fe3-378e4b33d606@ti.com>
Date:   Thu, 7 May 2020 09:47:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAL411-oycAoGFwStjcr4Xjxat=p0syketTLf7yN+ntBrFsCY-Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

+Vinod

On 5/7/2020 9:18 AM, Peter Chen wrote:
> On Mon, Apr 27, 2020 at 8:47 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>
>> Hi Peter,
>>
>> On 4/26/2020 12:30 PM, Peter Chen wrote:
>>> On Fri, Apr 10, 2020 at 12:30 AM Oliver Graute <oliver.graute@gmail.com> wrote:
>>>>
>>>> On 01/04/20, Peter Chen wrote:
>>>>> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
>>>>> According to the Cadence, this PHY is a legacy Module, and Sierra and
>>>>> Torrent are later evolutions from it, and their sequence overlap is
>>>>> minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
>>>>> drivers.
>>>>>
>>>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>>>
>>>> Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
>>>
>>> Hi Kithon,
>>>
>>> Rob has already acked the dt-binding patch, would you please merge
>>> these two patches,
>>
>> Sure, I'll be merging it this week.
>>
> 
> HI Kishon,
> 
> I still not find it at your next tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/tree/drivers/phy/cadence?h=next
> 
> Would you please merge it, I have patches based on it, thanks.

merged this now, thanks!

-Kishon
