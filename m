Return-Path: <SRS0=MwFQ=G7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42221 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751546AbeDJRMk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Apr 2018 13:12:40 -0400
Received: by mail-lf0-f66.google.com with SMTP id q9-v6so12749691lfk.9
        for <devicetree@vger.kernel.org>; Tue, 10 Apr 2018 10:12:39 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a77970: add LVDS support
References: <1523357646-3946-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523357646-3946-4-git-send-email-jacopo+renesas@jmondi.org>
 <0baa0f6e-f275-4a27-c76b-e4f8aec0b5f6@cogentembedded.com>
 <20180410121352.GD6436@w540>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9f54ba77-368f-3d0c-cb58-4849672af449@cogentembedded.com>
Date: Tue, 10 Apr 2018 20:12:36 +0300
MIME-Version: 1.0
In-Reply-To: <20180410121352.GD6436@w540>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On 04/10/2018 03:13 PM, jacopo mondi wrote:

>>> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>
>>> Add the LVDS device to r8a77970.dtsi in a disabled state. Also connect
>>> the it to the LVDS output of the DU.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> ---
>>> v1 -> v2:
>>> - Rebased on the modified endpoint name and changed patch subject to
>>>   comply with other patches in the series from Sergei.
>>
>>    Stop, what was wrong with my R8A77970 LVDS patch, reposted on the popular
>> demand? :-)
>>
> 
> Nothing wrong, I found out about your right now.
> I see a very small difference as
>          lvds@feb90000 vs lvds-encoder@feb90000

   Yes, I thought the latter was closer to a "generic" name that DT spec requires...

> You can add your signed-off-by ofc if you think that's the case.

   Didn't understand what you mean here...

> Thanks
>    j

MBR, Sergei

