From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] dt: Document a compatible entry for MDIO ethernet Phys
Date: Wed, 8 Jan 2014 14:16:10 -0700
Message-ID: <20140108211610.GC12358@obsidianresearch.com>
References: <20131210193947.GU5429@obsidianresearch.com>
 <CAL_JsqLpWSXd44ErAs=+xYS8ESaBSY6EJEneZFYqtbpfyM4iPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLpWSXd44ErAs=+xYS8ESaBSY6EJEneZFYqtbpfyM4iPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 08, 2014 at 12:37:03PM -0600, Rob Herring wrote:

> > Patch to parse this compatible string to follow if this binding is
> > acceptable.
> 
> One minor comment below, otherwise:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

K, I'll send a series hopefully in a few weeks after some travel.
 
> > +  If the phy's identifier is known then the list may contain an entry
> > +  of the form: "ethernet-phy-idAAAA,BBBB" where
> 
> I think this should be a period rather than a comma as we are not
> separating a vendor ID from product ID.

OK, that makes sense.

Inspecting further, the format of the 32 bit AAAABBBB is actually
broken out into:
  OUI[3:18] || OUI[19:24] || MODEL[5:0] || REV[3:0]

So a possible choice with the 'vendor ID,product ID' split is:
  ethernet-phyOOOOO,MM.R

xlate is:

AAAABBBB = ((OOOOO >> 6) << 16) |
           ((OOOOO & 0x3f) << 10) |
           (MM << 4) |
      	   R

Which doesn't textually match the register value, or any other
phy ID constants in the kernel, however makes more sense from the
'vendor ID,product ID' angle.

Eg a Marvell 88E1310 would encode into the two options as:
  ethernet-phy05043,29.0
  ethernet-phy-id0141.0e90

And the kernel has constants like this:
include/linux/marvell_phy.h:#define MARVELL_PHY_ID_88E1318S 0x01410e90

In light of this detail do you still like 'ethernet-phy-id0141.0e90' ?

Thanks,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
