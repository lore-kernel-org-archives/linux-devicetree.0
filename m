From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] of: dts: enable memory@0 quirk for PPC32 only
Date: Sat, 19 Apr 2014 01:36:34 +0100
Message-ID: <20140419003634.GI5904@bivouac.eciton.net>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
 <CAL_JsqL8B2ZY7ACXKX3J8VN5ukjKWuycgfDZpp4kYzBxg6BLmQ@mail.gmail.com>
 <20140418124821.GE5904@bivouac.eciton.net>
 <CAL_JsqKdFyhHfkcC1E9QuKjQTrXwoELYG+CFTpgf2-jqDvxGmA@mail.gmail.com>
 <20140418201313.GG5904@bivouac.eciton.net>
 <CAL_Jsq+L14rgYq5swC3H109DThiyDajmTJpO=y562jcE97K-fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+L14rgYq5swC3H109DThiyDajmTJpO=y562jcE97K-fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 18, 2014 at 04:28:17PM -0500, Rob Herring wrote:
> >> > Apart from the current code permitting recreating a 15+ year old
> >> > firmware bug into completely new platform ports?
> >>
> >> I would prefer to see a "WARN_ON(!IS_ENABLED(CONFIG_PPC32));" added here.
> >
> > In addition to, or instead of, the QUIRK ifdef?
> 
> Instead of because I don't see how you handle the ARM board
> compatibility with the ifdef. (And please, no ifdef for that board).

Umm, according to my memory as well as my sent mail folder, I cc:d you
on v2 of part 3. Could you have a look at that, please?

A WARN_ON would still mean this ancient workaround for a specific ppc32
platform remains enabled on ~10 architectures that don't use it.

> >> Really, I would like to see quirks like this fixed up out of line from
> >> the normal flow somewhat like how PCI quirks are handled. So in this
> >> example, we would just add the missing property to the dtb for the
> >> broken platform before doing the memory scan. That does then require
> >> libfdt which is something I'm working on.
> >
> > Getting rid of all this handling from generic code would clearly be
> > preferable. Is that code going in in the near future, or could we add
> > the quirk as a stopgap?
> 
> Some sort of quirk infrastructure is not going to happen soon. It's
> just an idea bouncing in my head ATM.

Mmm...

> > What would be the effect of the UEFI code adding all its memblocks,
> > minus the reserved areas, and then the DT code doing a memblock_add
> > of all RAM (including reserved areas)? Would memblock_reserve()s on
> > the protected regions suffice to prevent crazy stuff from happening?
> 
> So use UEFI to add the memory, but then add reserved areas with DT?

No, to add memory and reserved areas based on UEFI memory map.
And then add any memory@0/!type nodes as well, if they're left around.

> I'm not sure I follow, but even if I did I don't know memblock code
> well enough to say what it would do.

If we did end up with stray memory@0/!type nodes, we could initialise
memblock multiple times with overlapping but incompatible areas.
And I don't know if that would be a problem. Which makes me a little
bit nervous.

/
    Leif
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
