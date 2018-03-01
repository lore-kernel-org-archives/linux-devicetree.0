From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Kconfig: OF_OVERLAY, select OF_EARLY_FLATTREE
Date: Thu, 1 Mar 2018 08:14:04 -0800
Message-ID: <449f7ec6-e07b-7787-92c2-55b9404baa1c@gmail.com>
References: <1519000156-14319-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqLa83SKe5vbCkU8pwjPzBszsHrWQEA-ThMMciMwLO1XmA@mail.gmail.com>
 <300becd6-db35-59e6-1b81-6b1940070df0@gmail.com>
 <CAL_Jsq+BBHT3AyNeHWJe22KioC9s3Jm1d4pydVQLJA6jKoTGXA@mail.gmail.com>
 <d0e5e07b-cdf8-0cbc-d073-7f8982433c7f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d0e5e07b-cdf8-0cbc-d073-7f8982433c7f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On 02/28/18 13:44, Frank Rowand wrote:
> On 02/28/18 12:26, Rob Herring wrote:
>> Sorry for the delay, been away for a few days.
>>
>> On Mon, Feb 19, 2018 at 12:24 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>>>
>>> On 02/18/18 17:46, Rob Herring wrote:
>>>> On Sun, Feb 18, 2018 at 6:29 PM,  <frowand.list@gmail.com> wrote:
>>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>>
>>>>> kbuild test robot reported a new warning for a recent patch:
>>>>>>> drivers/of/overlay.c:832:2: error: implicit declaration of function 'of_fdt_unflatten_tree' [-Werror=implicit-function-declaration]
>>>>>      of_fdt_unflatten_tree(new_fdt, NULL, &overlay_root);
>>>>>
>>>>> The cause is that the prototype for of_fdt_unflatten_tree() in
>>>>> include/linux/of_fdt.c is guarded by OF_EARLY_FLATTREE.
>>
>> Umm, this is not true. of_fdt_unflatten_tree is outside the ifdef for
>> OF_EARLY_FLATTREE.
> 
> Brown paper bag.  :-(  As you note below, CONFIG_OF_FLATTREE is the
> relevant option.


< snip >

> function, so it seems all is OK from that angle.  But all use of overlays 
> for many previous releases requires manually selecting OF_FLATTREE, given
> that FDTs have been the overlay source.

I was not correct about needing to manually select OF_FLATTREE.  For
the unittest of overlays, which did the overlay unflattening, OF_UNITTEST
selected (selects until my other patch series) OF_EARLY_FLATTREE, which
selects OF_FLATTREE.

-Frank
