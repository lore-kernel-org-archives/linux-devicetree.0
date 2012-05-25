From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH RFC v3 3/3] pinctrl: add pinctrl gpio binding support
Date: Thu, 24 May 2012 22:59:47 -0600
Message-ID: <4FBF11C3.3030207@wwwdotorg.org>
References: <1337779362-31259-1-git-send-email-b29396@freescale.com> <1337779362-31259-3-git-send-email-b29396@freescale.com> <4FBD4C13.8080209@wwwdotorg.org> <CAA+hA=Rb1Qix67QBthPjo_4d5ATWjA7pePembZRwJkPMtQNpjg@mail.gmail.com> <4FBE5225.301@wwwdotorg.org> <20120525032250.GA13524@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120525032250.GA13524@shlinux2.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@freescale.com>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, Dong Aisheng <dongas86@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 05/24/2012 09:22 PM, Dong Aisheng wrote:
> On Thu, May 24, 2012 at 11:22:13PM +0800, Stephen Warren wrote:
...
>> The problem is this:
>>
>> Thread 1: Call of_node_to_gpiochip(), returns a gpio_chip.
>> Thread 2: Unregisters the same gpio_chip that was returned above.
>> Thread 1: Accesses the now unregistered (and possibly free'd) gpio_chip
>> -> at best, bad data, at worst, OOPS.
>>
> Correct. We did have this issue.
> Thanks for clarify.
> 
>> In order to prevent this, of_node_to_gpiochip() should take measures to
>> prevent another thread from unregistering the gpio_chip until thread 1
>> has completed its step above.
>>
>> The existing of_get_named_gpio_flags() is safe from this, since
>> gpiochip_find() acquires the GPIO lock, and all accesses to the fouond
>> gpio chip occur with that lock held, inside the match function. Perhaps
>> a similar approach could be used here.
>
> Why it looks to me of_get_named_gpio_flags has the same issue and also not safe?
> For of_node_to_gpiochip itself called in of_get_named_gpio_flags, it's safe.

Uggh. Yes, I meant that of_node_to_gpiochip() itself doesn't have this
issue, but you're right, it looks like of_get_named_gpio_flags() does.

> But after that, i'm suspecting it has the same issue as you described above, right?
> 
> For example:
> int of_get_named_gpio_flags(struct device_node *np, const char *propname,
>                            int index, enum of_gpio_flags *flags)
> {
> ...
> 	gc = of_node_to_gpiochip(gpiospec.np);
> 	if (!gc) {
> 		pr_debug("%s: gpio controller %s isn't registered\n",
> 			 np->full_name, gpiospec.np->full_name);
> 		ret = -ENODEV;
> 		goto err1;
> 	}
> 
> 	===> the gc may be unregistered here by another thread and
> 	     even already have been freed, right?
> 
> 	ret = gc->of_xlate(gc, &gpiospec, flags);
> ...
> }
> 
> Maybe we need get the lock in of_node_to_gpiochip and release it by calling
> of_gpio_put(..) after using?

Yes, something like that; it should take the module lock, not the gpio lock.
