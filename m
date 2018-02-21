Return-Path: <SRS0=Zag9=FP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64995 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750740AbeBUFj5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Feb 2018 00:39:57 -0500
Subject: Re: [PATCH] mmc: dw_mmc-k3: Fix out-of-bounds access through DT
 alias
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-id: <7b59b34b-92ee-da85-9c76-1d7f8f72c318@samsung.com>
Date: Wed, 21 Feb 2018 14:39:53 +0900
MIME-version: 1.0
In-reply-to: <CAMuHMdWa5RgkGCAucN5ykGRW=FdHUZw=+t5jMAsKhdixMUSQzQ@mail.gmail.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-US
Content-transfer-encoding: 7bit
References: <1519117393-31302-1-git-send-email-geert+renesas@glider.be>
        <CGME20180220105101epcas1p32dced553004bbcb54512e5c144ca2a1c@epcas1p3.samsung.com>
        <CAMuHMdWa5RgkGCAucN5ykGRW=FdHUZw=+t5jMAsKhdixMUSQzQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On 02/20/2018 07:50 PM, Geert Uytterhoeven wrote:
> On Tue, Feb 20, 2018 at 10:03 AM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> The hs_timing_cfg[] array is indexed using a value derived from the
>> "mshcN" alias in DT, which may lead to an out-of-bounds access.
>>
>> Fix this by adding a range check.
>>
>> Fixes: 7d92895208a008a2 ("mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias")
> 
> Oops
> 
> Fixes: 361c7fe9b02eee7e ("mmc: dw_mmc-k3: add sd support for hi3660")

Could you resend the patch with changing commit-msg?
Then i will pick yours.

Best Regards,
Jaehoon Chung

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 

