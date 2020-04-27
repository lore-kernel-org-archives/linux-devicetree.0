Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90218C54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 12:48:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48DB720663
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 12:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="og4BrfRc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgD0MsC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 08:48:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42390 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0MsC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 08:48:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RClvUb031518;
        Mon, 27 Apr 2020 07:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587991677;
        bh=wFp1uW4oVyqo4XUTEBnZc+chQAinP/gEUIiYLAAyvfo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=og4BrfRcXPOS4RZrz3PZ1lx5YOxTEQ++Uo6MQsl9AqP1KexYRh3ANrWoJEUa1IvrI
         Nl4cbqECaIWWPtrrLJGxWfV6vQTh/wJau2F03Ltxp0STnO96+6DZby+VCnQaDtnF+K
         bO4UinxQm/NxlVrZhPQ4N/GZVZYyv3dQOliRoE9A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RClvIk125927
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 07:47:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 07:47:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 07:47:57 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RClsKx047815;
        Mon, 27 Apr 2020 07:47:55 -0500
Subject: Re: [PATH v4 1/2] phy: cadence: salvo: add salvo phy driver
To:     Peter Chen <hzpeterchen@gmail.com>,
        Oliver Graute <oliver.graute@gmail.com>
CC:     Peter Chen <peter.chen@nxp.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
        <jun.li@nxp.com>, <linux-imx@nxp.com>
References: <20200401013851.16227-1-peter.chen@nxp.com>
 <20200409143205.GA15163@portage>
 <CAL411-rfxO-88aPaiDcjW+ri+RKMFz=C6tkNMztWYA-+uNvopA@mail.gmail.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <d91e7b91-4197-3f5e-ba0d-854281b94403@ti.com>
Date:   Mon, 27 Apr 2020 18:17:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAL411-rfxO-88aPaiDcjW+ri+RKMFz=C6tkNMztWYA-+uNvopA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peter,

On 4/26/2020 12:30 PM, Peter Chen wrote:
> On Fri, Apr 10, 2020 at 12:30 AM Oliver Graute <oliver.graute@gmail.com> wrote:
>>
>> On 01/04/20, Peter Chen wrote:
>>> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
>>> According to the Cadence, this PHY is a legacy Module, and Sierra and
>>> Torrent are later evolutions from it, and their sequence overlap is
>>> minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
>>> drivers.
>>>
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>
>> Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
> 
> Hi Kithon,
> 
> Rob has already acked the dt-binding patch, would you please merge
> these two patches,

Sure, I'll be merging it this week.

Thanks
Kishon
