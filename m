Return-Path: <SRS0=CYZL=OQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41207 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbeLGSgv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Dec 2018 13:36:51 -0500
Subject: Re: [PATCH 1/2] ARM: dts: stout: Convert to new LVDS DT bindings
References: <20181203151242.25875-1-geert+renesas@glider.be>
 <2301881.HCRvWxNAtB@avalon> <9715f969-2487-6699-70af-3e3c4d176f72@gmail.com>
 <6335524.oXJRfKre9U@avalon>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6326f516-5cb9-5ff7-308e-4e539b7f00fd@gmail.com>
Date: Fri, 7 Dec 2018 19:36:42 +0100
MIME-Version: 1.0
In-Reply-To: <6335524.oXJRfKre9U@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/05/2018 06:41 AM, Laurent Pinchart wrote:
> Hi Marek,
> 
> On Wednesday, 5 December 2018 03:10:18 EET Marek Vasut wrote:
>> On 12/03/2018 11:48 PM, Laurent Pinchart wrote:
>>> On Tuesday, 4 December 2018 00:24:32 EET Marek Vasut wrote:
>>>> On 12/03/2018 10:48 PM, Laurent Pinchart wrote:
>>>>> On Monday, 3 December 2018 17:12:41 EET Geert Uytterhoeven wrote:
>>>>>> As of commit 6d2ca85279becdff ("dt-bindings: display: renesas:
>>>>>> Deprecate LVDS support in the DU bindings"), the internal LVDS encoder
>>>>>> has DT bindings separate from the DU.  The Lager device tree was ported
>>>>>> over to the new model, but the Stout device tree was forgotten.
>>>>>>
>>>>>> Fixes: 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT
>>>>>> bindings") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>> ---
>>>>>> Compile-tested only.
>>>>>
>>>>> I can't test the patch either but it looks fine to me.
>>>>>
>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>
>>>>> I assume you will send this directly to Simon, so I don't plan to take
>>>>> the patch in my tree.
>>>>
>>>> I have a Stout if you need me to test something.
>>>
>>> Could you test HDMI output ? We just need to ensure that everything is
>>> probed correctly, so display anything on the HDMI output will do.
>>
>> Sure, can you push me a branch somewhere, so I don't have to hunt down
>> patches ?
> 
> Only this patch should be needed. You can get it from https://
> patchwork.kernel.org/patch/10709781/ and apply it on top of v4.19. Please 
> don't use v4.20-rc is there's one missing regression fix there (it has been 
> merged in the media tree and should make it to the final release).

On R8A7790 H2 ES3.0 Stout

Tested-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
