From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Tue, 21 Feb 2017 11:46:32 +0100
Message-ID: <ec74f8e0-0ede-714f-fcde-d612d9a26c1c@atmel.com>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
 <CAHp75VdwQGP-qa0c0KQwrdpZmCGc3RuEsJ-E-XLbBzQSn4Yxcg@mail.gmail.com>
 <20170220213803.7ba5591e@bbrezillon> <20170220215009.0ecbf5a1@bbrezillon>
 <CAHp75VczsC9WdZWR9iCRh2JoNLFZyOtodrsDRYQoyaN7nkyf=A@mail.gmail.com>
 <CAHp75Vc_q-bEzA2-hVpHyR0GZ8mXxwJ8-UjECe31T04mb67q4w@mail.gmail.com>
 <20170221090610.6d531b94@bbrezillon>
 <CAHp75VfZfj-8ih3vg63w_dAq8xXE2Whu1bANXRcXS1_EGNq43A@mail.gmail.com>
 <20170221112641.6276c001@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170221112641.6276c001@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, "open list:MEMORY TECHNOLOGY..." <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans-Christian Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 21/02/2017 à 11:26, Boris Brezillon a écrit :
> On Tue, 21 Feb 2017 12:03:45 +0200
> Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> On Tue, Feb 21, 2017 at 10:06 AM, Boris Brezillon
>> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>> On Tue, 21 Feb 2017 01:54:37 +0200
>>> Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>  
>>>> On Tue, Feb 21, 2017 at 1:40 AM, Andy Shevchenko
>>>> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:  
>>>>> On Mon, Feb 20, 2017 at 10:50 PM, Boris Brezillon
>>>>> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:  
>>>>>> On Mon, 20 Feb 2017 21:38:03 +0100
>>>>>> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>>>  
>>>>>>> On Mon, 20 Feb 2017 22:27:17 +0200
>>>>>>> Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>>>  
>>>>>>>> On Mon, Feb 20, 2017 at 2:28 PM, Boris Brezillon
>>>>>>>> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>>>>>  
>>>>>>>>>  drivers/mtd/nand/atmel/nand-controller.c | 2269 +++++++++++++++++++++++++++
>>>>>>>>>  drivers/mtd/nand/atmel_nand.c            | 2479 ------------------------------  
>>>>>>>>
>>>>>>>> Does -M -C help you?
>>>>>>>> At least it would help reviewers
>>>>>>>>  
>>>>>>>
>>>>>>> No it doesn't, because files were not just moved around using git mv,
>>>>>>> it's a complete rewrite of the driver. IIUC, you're about to review
>>>>>>> this submission, or are you just trolling like last time?  
>>>>>>
>>>>>> My bad, I mistaken you with someone else. Sorry for being harsh, but my
>>>>>> explanation stands ;-).  
>>>>>
>>>>> No problem. I was asking since it so big and on first glance looks
>>>>> like a partial copy (I dunno if parameter to -C makes it somehow
>>>>> useful), though I can't review this. It's too big to me. Sorry I'm
>>>>> really not trolling, just didn't read commit message carefully.  
>>>>
>>>> Okay, I very quickly looked into the code, what I noticed
>>>> - you like extra parens and empty lines in some cases (not big deal)  
>>>
>>> Can you point specific places where you think these are not needed?  
>>
>> 1. For example,
>>
>> #define ATMEL_NFC_CMD(pos, cmd)                        ((cmd) <<
>> (((pos) * 8) + 2))
> 
> Well, I like to explicitly put parenthesis even when operator
> precedence guarantees the order of the calculation ('*' is preceding
> '+').

Yes

> For the parenthesis around (cmd) and (pos), they are required to
> guarantee that things like ATMEL_NFC_CMD(x + y, cmd) are working
> correctly.

Absolutely.


Even when it's not needed, please keep this habit of using more
parenthesis than required by precedence to make code clearer.


>>  *events ^= (status & *events);
> 
> I agree with this one, it's uneeded.
> 
>>
>>  (((x) * 0x4) + 0x28)
> 
> See my comment about ATMEL_NFC_CMD().
> 
>>
>>   memset(&si[1], 0, sizeof(s16) * ((2 * strength) - 1));
> 
> Ditto.
> 
>>
>> Perhaps more in the code. I'm not a LISP programmer.

[..]

>> 8. Have you checked what kernel library provides?
> 
> I think so, but again, this is really vague, what kind of
> open-coded functions do you think could be replaced with core libraries
> helpers?
> 
>> And I believe there are still issues like those. After, who is on
>> topic, might even find some logical and other issues...
>>
>> P.S. TBH, so big change is unreviewable in meaningful time. To have a
>> comprehensive review I, for example, spend ~1h/250LOC, and
>> ~2.5h/1000LOC, I would estimate ~4h/2000LOC. Imagine one to spend one
>> day for this. Any volunteer? Not me.
> 
> I'm not asking you to review the whole driver, but you started to
> comment on the code without pointing clearly to the things you wanted
> me to address.

Moreover, it's not like if the driver would come without previous code.
So, this re-factoring comes with the experience of previous driver and
its aim is to be comparable feature-wise with the old one. So the amount
of changes doesn't surprise me.

As Boris noted in his patch series, additional optimization and use of
common BCH code can be studied afterwards.

Best regards,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
