From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Mon, 22 Oct 2012 13:34:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210221324580.1724-100000@iolanthe.rowland.org>
References: <50856F41.7000205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50856F41.7000205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 22 Oct 2012, Stephen Warren wrote:

> On 10/20/2012 04:10 PM, Tony Prisk wrote:
> > Add a binding document for ehci-platform driver.

> > +Optional properties:
> > +- caps-offset : offset to the capabilities register (default = 0)
> > +- has-tt : controller has transaction translator(s).
> > +- has-synopsys-hc-bug : controller has the synopsys hc bug
> 
> That would normally be determined by the driver based on the particular
> compatible value that is in device tree.

I don't understand this comment.  Isn't "has-synopsys-hc-bug" the 
compatible value in question?

> > +- big-endian : descriptors and registers are both big endian. This
> > +  is the equivalent of specifying big-endian-desc and big-endian-regs.
> > +OR
> > +- big-endian-desc : descriptors are in big-endian format
> > +- big-endian-regs : mmio is in big-endian format
> 
> Hmmm. That looks odd. Presumably if those properties aren't specified,
> the default is little-endian? Shouldn't this be a tri-state: big,
> little, native, with default native? I don't know what the EHCI
> specification mandates here (and if it does mandate something, the
> default should match the specification). Isn't this something that
> readl/writel would take care of, or are there cases where the register
> endianness of just this one HW block mismatches all other HW blocks?

The EHCI spec assumes a PCI implementation; it doesn't consider other
sorts.  And it doesn't say anything about the endianness of multi-byte
descriptors in memory.

Yes, there are cases where one HW block has an endianness that doesn't
match other HW blocks.  Or to be more accurate, it doesn't match what
the other HW blocks expect.  For example, on ARM readl and writel
expect to do byte-swapping but some particular EHCI blocks don't need
it.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
