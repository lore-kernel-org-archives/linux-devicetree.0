From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/5] of: Add support for ePAPR "stdout-path" property
Date: Fri, 28 Mar 2014 17:32:01 -0700
Message-ID: <20140329003201.EA13EC434EC@trevor.secretlab.ca>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org> < 1396022885-6102-2-git-send-email-grant.likely@linaro.org> <1396042396.11529 .27.camel@pasglop> <CAL_Jsq+xTeocLtS9GFWLCkoV+USACma+w0=O_ysekvTGhYVhZg@ mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+xTeocLtS9GFWLCkoV+USACma+w0=O_ysekvTGhYVhZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 28 Mar 2014 16:56:28 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Mar 28, 2014 at 4:33 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Fri, 2014-03-28 at 09:08 -0700, Grant Likely wrote:
> >> ePAPR 1.1 defines the "stdout-path" property for specifying the console
> >> device, but Linux currently only handles the older "linux,stdout-path"
> >> property. This patch adds parsing for the new property name.
> >
> > Generally a good idea I think, but of course I need time to review and
> > test ... :-)
> >
> > One thing that's been annoying me lately with the existing code which
> > you don't address is ... in a few cases my consoles are usable *VERY*
> > early. For example PAPR hvc and OPAL hvc can be used before we even turn
> > the MMU on on powerpc (and thus before we unflatten the device-tree).
> >
> > It would be nice to be able to have the console going that early,
> > unfortunately that would imply using the flat device-tree for the
> > parsing / matching of the stdout-path in those drivers.
> 
> I'm working on getting just that working. See my series for "generic
> earlycon". I'm working on cleaning up the FDT part still, but have
> something functional. The "hardest" part with FDT is doing the address
> translation for serial devices, but I just stole that from u-boot.

:-) There have been several use-cases wanting to property parse reg
properties from the flat tree recently. It would be good to get that as
a generic helper.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
