From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: Check for phys_addr_t overflows in early_init_dt_add_memory_arch
Date: Thu, 19 Jun 2014 09:43:24 +0200
Message-ID: <CAMuHMdUaL19dN=p1pVw9PvNPRhzvtr+hLvoqASwPopXhdmUNhg@mail.gmail.com>
References: <1403154257-14591-1-git-send-email-lauraa@codeaurora.org>
	<CAMuHMdW854ThGRUSVohvowJksTbVAzZ2cWmjBrsD804LqmBH8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW854ThGRUSVohvowJksTbVAzZ2cWmjBrsD804LqmBH8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Simon Horman <horms@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

Fixed Rob's and devicetree's addresses

On Thu, Jun 19, 2014 at 9:31 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Laura,
>
> On Thu, Jun 19, 2014 at 7:04 AM, Laura Abbott <lauraa@codeaurora.org> wrote:
>> The common early_init_dt_add_memory_arch takes the base and size
>> of a memory region as u64 types. The function never checks if
>> the base and size can actually fit in a phys_addr_t which may
>> be smaller than 64-bits. This may result in incorrect memory
>> being passed to memblock_add if the memory falls outside the
>> range of phys_addr_t. Add range checks for the base and size if
>> phys_addr_t is smaller than u64.
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
>> ---
>> Geert, can you drop my other patch and give this a test to see if it fixes
>> your bootup problem?
>
> Thanks, works fine!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
