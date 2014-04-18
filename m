From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] of: dts: enable memory@0 quirk for PPC32 only
Date: Fri, 18 Apr 2014 21:13:13 +0100
Message-ID: <20140418201313.GG5904@bivouac.eciton.net>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
 <CAL_JsqL8B2ZY7ACXKX3J8VN5ukjKWuycgfDZpp4kYzBxg6BLmQ@mail.gmail.com>
 <20140418124821.GE5904@bivouac.eciton.net>
 <CAL_JsqKdFyhHfkcC1E9QuKjQTrXwoELYG+CFTpgf2-jqDvxGmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKdFyhHfkcC1E9QuKjQTrXwoELYG+CFTpgf2-jqDvxGmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 18, 2014 at 10:37:58AM -0500, Rob Herring wrote:
> >> But why do you need this?
> >
> > Apart from the current code permitting recreating a 15+ year old
> > firmware bug into completely new platform ports?
> 
> I would prefer to see a "WARN_ON(!IS_ENABLED(CONFIG_PPC32));" added here.

In addition to, or instead of, the QUIRK ifdef?

> Really, I would like to see quirks like this fixed up out of line from
> the normal flow somewhat like how PCI quirks are handled. So in this
> example, we would just add the missing property to the dtb for the
> broken platform before doing the memory scan. That does then require
> libfdt which is something I'm working on.

Getting rid of all this handling from generic code would clearly be
preferable. Is that code going in in the near future, or could we add
the quirk as a stopgap?

> > Because the UEFI stub for arm/arm64 needs to delete all of the "memory"
> > nodes from the DT. And it would be nice to at least not have to compile
> > the "and also delete anything called memory@0" into the arm64 image. Or
> > any image not including support for affected platforms.
> 
> I don't see why you would handle that in the EFI stub. Given our lack
> of validation, I can see there is a chance this happens but I think it
> is pretty small. Given we only have a ARM board, I'd say we are doing
> surprisingly well.

I'm not too bothered personally, but Mark Rutland handed me a patch to
improve the memory node handling in the stub, and he seemed to really
want this there. You guys can fight it out :)

What would be the effect of the UEFI code adding all its memblocks,
minus the reserved areas, and then the DT code doing a memblock_add
of all RAM (including reserved areas)? Would memblock_reserve()s on
the protected regions suffice to prevent crazy stuff from happening?

/
    Leif
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
