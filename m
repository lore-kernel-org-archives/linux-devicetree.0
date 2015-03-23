From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: drivers/of: Add empty ranges quirk for PA-Semi
Date: Mon, 23 Mar 2015 15:06:35 +1100
Message-ID: <1427083595.4770.221.camel@kernel.crashing.org>
References: <20150323035004.2D6B9140134@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150323035004.2D6B9140134-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: linuxppc dev list <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-03-23 at 14:50 +1100, Michael Ellerman wrote:
> On Mon, 2015-23-03 at 03:16:38 UTC, Benjamin Herrenschmidt wrote:
> > The "sdc" node is missing the ranges property, it needs to be treated
> > as having an empty one otherwise translation fails for its children.
> > 
> > Tested-by: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
> > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> 
> Fixes: 746c9e9f92dd ("of/base: Fix PowerPC address parsing hack")
> 
> Which went into 3.18-rc6, and was CC'ed to stable. So this should probably also
> go to stable no?

Sure, go for it.

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
