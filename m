From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Subject: Re: [PATCH 11/21] mfd: use devm_irq_of_parse_and_map() where appropriate
Date: Wed, 18 Jun 2014 15:31:57 +0400
Message-ID: <53A178AD.3060003@dev.rtsoft.ru>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru> <1401880402-30091-12-git-send-email-nyushchenko@dev.rtsoft.ru> <20140617151226.GM29841@lee--X1> <53A0606C.6030400@dev.rtsoft.ru> <20140618084838.GR21030@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140618084838.GR21030@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org
List-Id: devicetree@vger.kernel.org

>> Hmm...  probably it was too early to apply this?  I was just going
>> to prepare v2, based on discussion...
>
> Which discussion?

One you are replying in?

https://lkml.org/lkml/2014/6/4/136

>> Also, applying only 11/21, without 01/21, will just cause build errors ...
>
> CC'ing me on this patch alone when you know you have build
> dependencies on other patches in the set is a bad idea.  Failing to
> mention that you wanted the patch to be handled in a special and/or
> unconventional way is an even worse idea.
>
> How are you expecting this patch(-set) to be handled?

Sorry but I did not CC you this patch.

I sent entire patchset to mailing lists and to maintainers of IRQ and 
device tree subsystems.
I used git send-email, and all mails went out to the same recipients.
Recipient addresses extracted using scripts/get_maintainer.pl applied to 
the "main" patch of the patchset.
I did not sent entire patchset to maintainers of individual changed 
drivers because this makes recipient address too big and too much looks 
like spamming.
I did not send individual patches to individual addresses to avoid cases 
of partially-applied patchset that will just break things (actually this 
is what happened with 11/21)

I'm quite sorry if I did things wrong, it was my first attempt to sent 
patchset with tree-wide fixes. However, I don't see what I've done 
wrong... any hints on that will be appreciated.

Nikita

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
