From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 15:19:01 +0000
Message-ID: <20131118151900.GF16735@n2100.arm.linux.org.uk>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com> <201311152056.47846.arnd@arndb.de> <20131115232109.GT16735@n2100.arm.linux.org.uk> <201311181605.37300.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311181605.37300.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 04:05:37PM +0100, Arnd Bergmann wrote:
> On Saturday 16 November 2013, Russell King - ARM Linux wrote:
> > On Fri, Nov 15, 2013 at 08:56:47PM +0100, Arnd Bergmann wrote:
> > > 
> > > For all I know, doing this in ACPI is something that is only now being
> > > discussed as Intel wants to be able to reuse the existing features from
> > > DT enabled drivers in the kernel and share the implementation between
> > > embedded x86 SoCs and embedded ARM/PowerPC/MIPS/... SoCs. That part actually
> > > isn't as crazy.
> > > 
> > > The existing ACPI usage however is basically all binary and cannot be
> > > shared with DT, in particular it won't help for the orthogonal problem of
> > > using ACPI to get "enterprise server" features on ARM64.
> > 
> > That's strange, because the patches I've seen from people who want to
> > add ACPI support to AMBA are all based around very similar strings to
> > those in DT to lookup the same data in ACPI.
> 
> Can you point to specific patches?

No, because they weren't publically posted, so I don't feel that I can
say all that much; they were from quite a large company though.

> I can't say I'm an expert on this, but everything I've seen with ACPI
> is tables of binary data with four-letter identifiers that are defined
> by the ACPI group, but not using strings in a similar manner to DT.

They are using strings which are the same as the DT properties, but
without the vendor prefix - but yes, to only retrieve things like
booleans, u32s and such like.  They also have support for fixed-rate
clocks via the clk API too...

I'd like them to post the patches publically so a more open discussion
could occur.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
