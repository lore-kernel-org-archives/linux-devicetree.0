From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Subject: Re: [PATCH 00/21] add and use devm_irq_of_parse_and_map()
Date: Mon, 16 Jun 2014 12:36:34 +0400
Message-ID: <539EAC92.1040606@dev.rtsoft.ru>
References: <53997AF6.1040003@gaisler.com> <5399AE1B.1080301@gaisler.com> <5399F92B.50406@dev.rtsoft.ru> <539EA986.1090501@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539EA986.1090501-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Cc: lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>> SPARC does not use OF_IRQ and has a different implementation of
>>> irq_of_parse_and_map than the one in drivers/of/irq.c. All code
>>> converted from irq_of_parse_and_map to devm_irq_of_parse_and_map in this
>>> patch set will be unlinkable for SPARC. This includes SPI in general and
>>> many drivers that are used for SPARC (of which several are currently
>>> only used on SPARC platforms).
>>
>> Can this be fixed by adding a copy of devm_irq_of_parse_and_map() to
>> arch/sparc/kernel/of_device_common.c ?
> 
> Not a copy of the version in irq.c no. On SPARC, IRQ_DOMAIN is not
> selected in general.
> 
> However, there is no technical problem that I can see with having a
> SPARC version of devm_irq_of_parse_and_map that just calls
> irq_of_parse_and_map as there are no mappings that needs to be disposed
> of. (The empty dummy for irq_dispose_mapping is used if any
> irq_dispose_mapping calls are made from drivers).

Ok, I will post an updated patchset that adds sparc
devm_irq_of_parse_and_map() that just calls irq_of_parse_and_map(), and
devm_irq_dispose_mapping() that does nothing.

Also, you mentioned that some drivers that my original patchset touches
are sparc-only?  Then, maybe better not convert these to devm_? Could
you please give a list of such drivers?

Nikita

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
