From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 09:56:39 +0200
Message-ID: <1815499.tpfeUKmP6V@flatron>
References: <1379300274.4098.77.camel@pasglop> <1379371567.3721.46.camel@pasglop> <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 16 of September 2013 15:48:22 Olof Johansson wrote:
> On Mon, Sep 16, 2013 at 3:46 PM, Benjamin Herrenschmidt
> 
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Mon, 2013-09-16 at 10:17 -0600, Stephen Warren wrote:
> >> On 09/15/2013 08:57 PM, Benjamin Herrenschmidt wrote:
> >> > [resent to the right list this time around]
> >> > 
> >> > Hi folks !
> >> > 
> >> > So I don't have the bandwidth to follow closely what's going on,
> >> > but I
> >> > just today noticed the crackpot that went into 3.11 as part of
> >> > commit:
> >> > 
> >> > 9d8eab7af79cb4ce2de5de39f82c455b1f796963
> >> > drivers: of: add initialization code for dma reserved memory
> >> > 
> >> > Fist of all, do NOT add (or change) a binding as part of a patch
> >> > implementing code, it's gross.
> >> 
> >> Personally, I would argue the opposite; it's much easier to see
> >> what's
> >> going on when it's all together in one patch.
> > 
> > One patch series eventually, but not the same patch.
> > 
> >> Ensuring ABI stability can
> >> only be achieved through code review, i.e. splitting into separate
> >> DT/code patches won't achieve that, so that argument doesn't affect
> >> this.
> >> 
> >> ...
> >> 
> >> > Additionally, it has the following issues:
> >> >  - It describes the "memory" node as /memory, which is WRONG
> >> > 
> >> > It should be "/memory@unit-address, this is important because the
> >> > Linux
> >> > kernel of_find_device_by_path() isn't smart enough to do partial
> >> > searches (unlike the real OFW one) and thus to ignore the unit
> >> > address
> >> > for search purposes, and you *need* the unit address if you have
> >> > multiple memory nodes (which you typically do on NUMA machines).
> >> 
> >> Perhaps /memory should have had a unit-address, but it never has had
> >> on
> > 
> >> ARM; see arch/arm/boot/dts/skeleton.dtsi which says:
> > Well, this is a mistake ARM folks might have done from day one but it
> > should still be fixed :-)
> > 
> > A node that has a "reg" property should have the corresponding unit
> > address.
> 
> No, absolutely _NOT_ a requirement. Unit address is only required if
> needed to disambiguate two properties with the same name.
> 
> If there are no ambiguities, then leaving off the unit address is much
> preferred.

I'm afraid that I must disagree. For consistency I'd rather go with what 
Ben said. Please see ePAPR chapter 2.2.1.1, which clearly defines how 
nodes should be named.

Having unit-address whenever the node has a reg property has the nice 
property of eliminating the need to rename any nodes when adding new one. 
(Consider the case that you have one subnode somewhere and you omit the 
unit-address and then you find out that you have to add another subnode 
with the same name, but another reg value.)

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
