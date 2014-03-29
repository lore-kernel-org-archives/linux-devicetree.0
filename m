From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/5] of: Add support for ePAPR "stdout-path" property
Date: Fri, 28 Mar 2014 17:30:50 -0700
Message-ID: <20140329003050.C5A31C434EC@trevor.secretlab.ca>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org> < 1396022885-6102-2-git-send-email-grant.likely@linaro.org> <1396042396.11529 .27.camel@pasglop>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396042396.11529.27.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 29 Mar 2014 08:33:16 +1100, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2014-03-28 at 09:08 -0700, Grant Likely wrote:
> > ePAPR 1.1 defines the "stdout-path" property for specifying the console
> > device, but Linux currently only handles the older "linux,stdout-path"
> > property. This patch adds parsing for the new property name.
> 
> Generally a good idea I think, but of course I need time to review and
> test ... :-)
> 
> One thing that's been annoying me lately with the existing code which
> you don't address is ... in a few cases my consoles are usable *VERY*
> early. For example PAPR hvc and OPAL hvc can be used before we even turn
> the MMU on on powerpc (and thus before we unflatten the device-tree).
> 
> It would be nice to be able to have the console going that early,
> unfortunately that would imply using the flat device-tree for the
> parsing / matching of the stdout-path in those drivers.

I think we can get that done. Rob's series goes a long way to that, and
I don't think the flattree parsing will be all that complex.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
