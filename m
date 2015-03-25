From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: drivers/of: Add empty ranges quirk for PA-Semi
Date: Wed, 25 Mar 2015 09:15:43 -0700
Message-ID: <20150325161543.27663C408FE@trevor.secretlab.ca>
References: <20150323035004.2D6B9140134@ozlabs.org>
	<1427083595.4770.221.camel@kernel.crashing.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427083595.4770.221.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc dev list <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 23 Mar 2015 15:06:35 +1100
, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
 wrote:
> On Mon, 2015-03-23 at 14:50 +1100, Michael Ellerman wrote:
> > On Mon, 2015-23-03 at 03:16:38 UTC, Benjamin Herrenschmidt wrote:
> > > The "sdc" node is missing the ranges property, it needs to be treated
> > > as having an empty one otherwise translation fails for its children.
> > > 
> > > Tested-by: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
> > > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > 
> > Fixes: 746c9e9f92dd ("of/base: Fix PowerPC address parsing hack")
> > 
> > Which went into 3.18-rc6, and was CC'ed to stable. So this should probably also
> > go to stable no?
> 
> Sure, go for it.

Applied, thanks.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
