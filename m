From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of/irq: do irq resolution in platform_get_irq
Date: Thu, 24 Apr 2014 21:47:02 +0100
Message-ID: <CACxGe6uni+=7JS-Sn-WViPMnVSXg-L35=S9pvz95Gm4kgDqLhg@mail.gmail.com>
References: <1398293861-7682-1-git-send-email-robherring2@gmail.com>
 <1398293861-7682-3-git-send-email-robherring2@gmail.com> <20140424184207.GC27443@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140424184207.GC27443@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 24, 2014 at 7:42 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Apr 23, 2014 at 05:57:41PM -0500, Rob Herring wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Currently we get the following kind of errors if we try to use interrupt
>> phandles to irqchips that have not yet initialized:
>>
>> irq: no irq domain found for /ocp/pinmux@48002030 !
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 1 at drivers/of/platform.c:171 of_device_alloc+0x144/0x184()
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.12.0-00038-g42a9708 #1012
>> (show_stack+0x14/0x1c)
>> (dump_stack+0x6c/0xa0)
>> (warn_slowpath_common+0x64/0x84)
>> (warn_slowpath_null+0x1c/0x24)
>> (of_device_alloc+0x144/0x184)
>> (of_platform_device_create_pdata+0x44/0x9c)
>> (of_platform_bus_create+0xd0/0x170)
>> (of_platform_bus_create+0x12c/0x170)
>> (of_platform_populate+0x60/0x98)
>>
>> This is because we're wrongly trying to populate resources that are not
>> yet available. It's perfectly valid to create irqchips dynamically, so
>> let's fix up the issue by resolving the interrupt resources when
>> platform_get_irq is called.
>>
>> And then we also need to accept the fact that some irqdomains do not
>> exist that early on, and only get initialized later on. So we can
>> make the current WARN_ON into just into a pr_debug().
>>
>> We still attempt to populate irq resources when we create the devices.
>> This allows current drivers which don't use platform_get_irq to continue
>> to function. Once all drivers are fixed, this code can be removed.
>>
>> Suggested-by: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/base/platform.c |  7 ++++++-
>>  drivers/of/irq.c        | 26 ++++++++++++++++++++++++++
>>  drivers/of/platform.c   |  4 +++-
>>  include/linux/of_irq.h  |  7 ++++++-
>>  4 files changed, 41 insertions(+), 3 deletions(-)
>
> Hehe... that's largely what we already had back in January[0]. Glad to
> see that people could finally agree on what to do about this.
>
> Thierry
>
> [0]: https://lkml.org/lkml/2014/1/8/240

Sometimes it takes prodding around with the other options to figure
out an earlier approach was on the right track. I'm very happy to
finally have a solution here that appears to be working.

I've pushed it out to my tree so it gets into linux-next. Please test
before I ask Linus to pull.

git://git.secretlab.ca/git/linux devicetree/merge

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
