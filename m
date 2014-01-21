From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/1] of/irq: create interrupts-extended-2 property
Date: Tue, 21 Jan 2014 12:02:14 +0000
Message-ID: <20140121120214.GK28747@e106331-lin.cambridge.arm.com>
References: <1389786445-10598-1-git-send-email-plagnioj@jcrosoft.com>
 <20140115161224.GH25824@e106331-lin.cambridge.arm.com>
 <20140120224742.EC905C40B12@trevor.secretlab.ca>
 <CAOesGMjrLs9eEPurjUpOfgyexnc__FJkRYmAR84_f7C15HH07Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjrLs9eEPurjUpOfgyexnc__FJkRYmAR84_f7C15HH07Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 01:03:23AM +0000, Olof Johansson wrote:
> On Mon, Jan 20, 2014 at 2:47 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, 15 Jan 2014 16:12:24 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> >> >
> >> > Another, more invasive option would be extend the dts syntax and teach
> >> > dtc to handle property appending. Then the soc dts could stay as it is,
> >> > and the board dts could have something like:
> >> >
> >> >     /append-property/ interrupts = <&intc1 6 1>;
> >> >     /append-property/ interrupt-names = "board-specific-irq";
> >> >
> >> > Both these options solve the issue at the source, are general to other
> >> > properties, and allow more than one level of hierarchy (the proposed
> >> > interrupts-extended-2 only allows one level).
> >>
> >> I've just had a go at implementing the append-property mechanism above
> >> in dtc, and it was far easier than I expected (patch below).
> >>
> >> Does anyone have any issues with the /append-property/ idea?
> >
> > I think that is reasonable.
> 
> 
> The main problem with this (same for clocks) is if you need to append
> something with a name when the original didn't have any.

Can you not just add a name in the original file? I assume we're not
going to use this to adjust dts files we're not already in full control
of.

> 
> Reordering entries might not work for interrupts, since the bindings
> might have requirements on order.

That's a fair point.

Do we currently have any optional/board-specific interrupts which must
appear at the start or middle of the list?

For those, could we add names? The kernel should be abel to fall back to
ordering if names aren't present, and we can recommend a particular
ordering for compatiblity with older kernels.

As a general preventative measure it would be nice to have named
elements whenever elements can be optional.

> 
> I'm not aware of a good solution for this. Suggestions welcome.

Me neither. Prepending and appending is easy.

Inserting and/or modifying the list requires knowledge of the size of
each element (and for variable-sized entries requires knowledge of the
particular binding, which we cannot embed in dtc). 

I suspect adding richer syntax for modifying properties in arbitrary
ways will devolve into a turing tarpit.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
