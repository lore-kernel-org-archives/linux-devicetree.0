From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 00/39] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Date: Wed, 30 Nov 2016 17:02:16 +0900
Message-ID: <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com> <20161127160459.5894be93@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161127160459.5894be93@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi.

2016-11-28 0:04 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> +Andy
>
> Hi Masahiro,
>
> On Sun, 27 Nov 2016 03:05:46 +0900
> Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>
>> As I said in the 1st round series, I am tackling on this driver
>> to use it for my SoCs.
>>
>> The previous series was just cosmetic things, but this series
>> includes *real* changes.
>>
>> After some more cleanups, I will start to add changes that
>> are really necessary.
>> One of the biggest problems I want to solve is a bunch of
>> hard-coded parameters that prevent me from using this driver for
>> my SoCs.
>>
>> I will introduce capability flags that are associated with DT
>> compatible and make platform-dependent parameters overridable.
>>
>> I still have lots of reworks to get done (so probably 3rd round
>> series will come), but I hope it is getting better and
>> I am showing a big picture now.
>>
>
> Thanks for posting this 2nd round of patches, I know have a clearer
> view of what you're trying to achieve.
> Could you be a bit more specific about the remaining rework (your 3rd
> round)?


[1]
I want to remove
get_samsung_nand_para()
get_onfi_nand_para()

The driver should not hard-code timing parameters of Samsung specific
chips.  For ONFI, it is duplicating effort of the core framework.

I am thinking if it would be possible to implement
chip->setup_data_interface() in order to set up
timings in a generic way.

[2]
Remove driver-internal bounce buffer.
The current Denali driver allocate DMA_BIDIRECTIONAL buffer
to use it as a driver-internal bounce buffer.

The hardware transfer page data into the bounce buffer,
then CPU copies from the bounce buffer to a given buf (and oob_poi).
This is not efficient.

So, I want to set NAND_USE_BOUNCE_BUFFER flag
and do dma_map_single directly for a given buffer.

[3]
Fix raw and oob callbacks.

I asked in another thread,
the current driver just puts the physically accessed OOB data
into oob_poi, which is not a collection of ECC data.
Raw write/read() are wrong as well.

After fixing those, enable BBT scan by removing the following flag:
    /* skip the scan for now until we have OOB read and write support */
    chip->options |= NAND_SKIP_BBTSCAN;



> Also, if you don't mind, I'd like to have reviews and testing from intel
> users before applying the series. Can you Cc Andy (and possibly other
> intel maintainers) for the next round.

Sure.

Anyway, this series already missed the pull-req for 4.10-rc1,
we have plenty of time until 4.11-rc1.

Review/test from Intel engineers are very appreciated
because I have no access to their boards.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
