From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] mtd: atmel_nand: remove unneeded ifdef CONFIG_OF
Date: Mon, 16 Sep 2013 15:54:57 -0700
Message-ID: <CAOesGMjYUOerSSZvM6VVLQNQP=Dft6CwNELqP9tyT=Hz0-2qLQ@mail.gmail.com>
References: <1378200028-15415-1-git-send-email-josh.wu@atmel.com>
	<20130911230207.GE4550@ld-irv-0074.broadcom.com>
	<5232DAAD.4020700@atmel.com>
	<20130913182144.GF4550@ld-irv-0074.broadcom.com>
	<CAOesGMjczRxKhDS9W9SZk4ivuxEsn0Mp6j0Xotz+qZgoKO4=xg@mail.gmail.com>
	<CAN8TOE965=_HfK0aqB6oUWF66xXZEdwFR8AL9KcwRmQ0AWmisg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN8TOE965=_HfK0aqB6oUWF66xXZEdwFR8AL9KcwRmQ0AWmisg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2013 at 3:50 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Sep 16, 2013 at 3:28 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> Guys,
>>
>> On Fri, Sep 13, 2013 at 11:21 AM, Brian Norris
>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> + devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>
>>> On Fri, Sep 13, 2013 at 05:28:13PM +0800, Josh Wu wrote:
>>>> On 9/12/2013 7:02 AM, Brian Norris wrote:
>>>> >On Tue, Sep 03, 2013 at 05:20:27PM +0800, Josh Wu wrote:
>>>> >>Since following commit
>>>> >>   f3b391425d21e6138e57b2432d91134e0bc2b975
>>>
>>> ...
>>>
>>>> >>   (of_mtd: Add no-op stubs to support CONFIG_OF=n)
>>>> >>
>>>> >>implements the stub for CONFIG_OF=n. Now we can safely remove all
>>>> >>CONFIG_OF in atmel_nand. (Thanks to Ezequiel Garcia's for this protype)
>>>> >I'm not quite so sure about this patch, as I was about the pxa3xx patch.
>>>> >With pxa3xx, the compiler can easily tell that pxa3xx_nand_probe_dt()
>>>> >will return 0 without doing anything in the !CONFIG_OF case (and so will
>>>> >likely remove the dead code), so it's no benefit to have the #ifdef. But
>>>> >in this driver, the atmel_of_init_port() function can't be trivially
>>>> >determined to do nothing (and in fact, it does something in either
>>>> >CONFIG_OF=y or =n case). It's only protected by the 'if
>>>> >(pdev->dev.of_node)' check, which the compiler can't predict.
>>>>
>>>> I understand your concern here.
>>>>
>>>> >
>>>> >So, I don't know if we should remove the #ifdef at the expense of likely
>>>> >significantly larger code. I won't protest, but I won't merge it yet
>>>> >either. Perhaps others have better ideas, or perhaps you can find a good
>>>> >way to work around this -- e.g., check the of_* helpers for -ENOSYS early
>>>> >in atmel_of_init_port()?
>>
>>
>> Can we please get less fumbling around on this and just merge a fix,
>> please? You guys have broken the PXA3xx builds for the whole merge
>> window, while there's been a patch sitting in linux-next with
>> _exactly_ this contents since August 30, committed by David.
>
> How about you read the thread you're responding to? This is a
> different driver, and it is not broken.

Ah, oops, my apologies. I came across this when searching for the
(committed) patch in my mail history and didn't notice the driver name
differences. :)

> If you look at the thread for the patch which fixes the actual
> breakage (in pxa3xx), you will see a plain and clear explanation of
> the situation.
>
> http://lists.infradead.org/pipermail/linux-mtd/2013-September/048595.html
> http://lists.infradead.org/pipermail/linux-mtd/2013-September/048598.html
>
> David has been sufficiently notified, and he is not acting. I have
> even pinged him on our IRC channel, with no response, although I'm not
> surprised.
>
> (BTW, I assume the "committed by David" is simply because of
> git-rebase. It doesn't necessarily reflect his acknowledgment of the
> patch. I can only assume that it was an oversight on his part.)

That in itself seems broken; if he is pulling code from you he shouldn't rebase.

>> If this is't fixed within the next few days I'll just pick that patch
>> up and include it in our next batch of arm-soc fixes. This is
>> ridiculous.
>
> My hands are tied, as the only thing I could do would be to submit a
> pull request around David's back. I am just as frustrated as you, but
> for different reasons. The (lack of) response from the head MTD
> maintainer is unacceptable, IMO, and it is a recurring problem that we
> are trying to solve by my involvement as a submaintainer. But
> merge-window problems are not quite under my authority...

What you could do is send just a patch, not a pull request. But anyway:

> Anyway, I don't care if the patch goes in via another tree, as long as
> this debacle (notably, for the pxa3xx_nand driver, not the atmel_nand
> driver) is resolved.

Ok. Russell was asking what the status of the fix was as well. I'll
queue it up with our current fixes for -rc2.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
