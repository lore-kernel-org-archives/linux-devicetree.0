From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 11:37:14 +1000
Message-ID: <1379381834.3721.63.camel@pasglop>
References: <1379300274.4098.77.camel@pasglop>
	 <52372F2A.2050003@wwwdotorg.org> <1379371567.3721.46.camel@pasglop>
	 <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com>
	 <1379375239.3721.51.camel@pasglop>
	 <CAOesGMjDFOThCYPgPq5mS8-Uk5Ye=omye329EKRsb-q_akTP4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjDFOThCYPgPq5mS8-Uk5Ye=omye329EKRsb-q_akTP4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-09-16 at 16:48 -0700, Olof Johansson wrote:
> On Mon, Sep 16, 2013 at 4:47 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Mon, 2013-09-16 at 15:48 -0700, Olof Johansson wrote:
> >> > A node that has a "reg" property should have the corresponding unit
> >> > address.
> >>
> >> No, absolutely _NOT_ a requirement. Unit address is only required if
> >> needed to disambiguate two properties with the same name.
> >>
> >> If there are no ambiguities, then leaving off the unit address is much
> >> preferred.
> >
> > I disagree :-)
> 
> Well, good thing you've got your own arch to litter the device trees
> with unit specifiers in then. :)

Right :-) We tend to have multiple memory nodes on server anyway so it's
not a big deal.

> > Also this would be only true of our find_node_by_path was capable of
> > handling it, which it isn't. Thus you end up with generic code looking
> > for /memory and finding nothing ...
> 
> Yes, this should be fixed.

Right, the whole thing becomes mostly a non-issue once that's fixed. My
main objection isn't that ARM doesn't use unit address specifiers. My
objection is that the binding documents no unit address :-) It should
instead document the unit address with a note indicating that it can be
omitted if there is no ambiguity.

But first, do we have a volunteer to fix the path parsing code ? Also do
we *really* need to keep the path parsing code for fdt ? IE. It would be
annoying to have to duplicate that code for before and after
expansion...

Cheers,
Ben.

> -Olof
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
