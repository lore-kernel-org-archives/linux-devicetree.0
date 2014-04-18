From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] of: dts: enable memory@0 quirk for PPC32 only
Date: Fri, 18 Apr 2014 13:48:22 +0100
Message-ID: <20140418124821.GE5904@bivouac.eciton.net>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
 <CAL_JsqL8B2ZY7ACXKX3J8VN5ukjKWuycgfDZpp4kYzBxg6BLmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL8B2ZY7ACXKX3J8VN5ukjKWuycgfDZpp4kYzBxg6BLmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 17, 2014 at 07:43:13PM -0500, Rob Herring wrote:
> On Thu, Apr 17, 2014 at 12:41 PM, Leif Lindholm
> <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > drivers/of/fdt.c contains a workaround for a missing memory type
> > entry on longtrail firmware. Make that quirk PPC32 only, and while
> > at it - fix up the .dts files in the tree currently working only
> > because of that quirk.
> 
> But why do you need this?

Apart from the current code permitting recreating a 15+ year old
firmware bug into completely new platform ports?

Because the UEFI stub for arm/arm64 needs to delete all of the "memory"
nodes from the DT. And it would be nice to at least not have to compile
the "and also delete anything called memory@0" into the arm64 image. Or
any image not including support for affected platforms.

> >  arch/arm/boot/dts/ste-ccu8540.dts     |    1 +
> >  arch/mips/lantiq/dts/easy50712.dts    |    1 +
> >  arch/mips/ralink/dts/mt7620a_eval.dts |    1 +
> >  arch/mips/ralink/dts/rt2880_eval.dts  |    1 +
> >  arch/mips/ralink/dts/rt3052_eval.dts  |    1 +
> >  arch/mips/ralink/dts/rt3883_eval.dts  |    1 +
> 
> I'm not worried about these MIPS dts files because they are all
> built-in, but you are breaking compatibility with old dtbs for this
> ARM board.

Yeah, sorry. Sending out a v2 of part 3 shortly.

/
    Leif
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
