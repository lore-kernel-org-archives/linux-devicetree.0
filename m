From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/7] ECHI Platform: Merge ppc-of EHCI driver into the ehci-platform driver
Date: Fri, 21 Feb 2014 15:21:32 +0100
Message-ID: <9352625.f2QvCl1mNy@wuerfel>
References: <20140221114803.GB8783@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140221114803.GB8783-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 21 February 2014 11:48:03 Mark Rutland wrote:
> > +
> > +       np = of_find_compatible_node(NULL, NULL, "ibm,usb-ohci-440epx");
> > +       if (np != NULL) {
> > +               /* claim we really affected by usb23 erratum */
> > +               if (!of_address_to_resource(np, 0, &res))
> > +                       ehci->ohci_hcctrl_reg =
> > +                               devm_ioremap(&pdev->dev,
> > +                                            res.start + OHCI_HCCTRL_OFFSET,
> > +                                            OHCI_HCCTRL_LEN);
> > +               else
> > +                       ehci_dbg(ehci, "%s: no ohci offset in fdt\n", __FILE__);
> > +               if (!ehci->ohci_hcctrl_reg) {
> > +                       ehci_dbg(ehci, "%s: ioremap for ohci hcctrl failed\n",
> > +                               __FILE__);
> > +               } else {
> > +                       ehci->has_amcc_usb23 = 1;
> > +               }
> > +       }
> 
> As this is being dropped into a generic driver, it would be nice to have
> a comment explaining why we need to do this -- not everyone using this
> will know the powerpc history. It certainly seems odd to look for
> another node in the tree that this driver isn't necessarily handling,
> and that should probably be explained.
> 
> As this bit of fixup is only needed for powerpc, it would be nice to not
> have to do it elsewhere. Perhaps these could be factored out into a
> ppc_platform_reset function that could be empty stub for other
> architectures.

How about using the .data field of the of_device_id array to point to
a structure of functions? That way you don't even have to call
of_device_is_compatible() here. Note that using of_find_compatible_node()
is the wrong approach anyway, you want to check the current device
for compatibility, not just any device I assume.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
