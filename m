From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 15:59:18 +0100
Message-ID: <20131119145917.GC24997@rocoto.smurfnet.nu>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <20131115175241.GB27174@quad.lixom.net>
 <20131119113015.GH5914@e106331-lin.cambridge.arm.com>
 <alpine.DEB.2.02.1311191304260.27757@kaball.uk.xensource.com>
 <20131119143840.GN5914@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131119143840.GN5914-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 02:38:40PM +0000, Mark Rutland wrote:
> > > For that case we will also require a nailed-down boot
> > > protocol that allows for either DTB or ACPI.
> > 
> > The latest documentation patch for the "arm/arm64 UEFI boot protocol"
> > implies that UEFI on ARM is already capable of passing a DTB to the
> > kernel:
> > 
> > "The implementation depends on receiving information about the UEFI
> > environment in a Flattened Device Tree (FDT) - so is only available with
> > CONFIG_OF."
> > 
> > Maybe we just need to better document it?
> 
> Yes, we just need to document it.

Better document it than what is currently in Booting?

> As far as I'm aware, there are two ways we might boot the kernel:
 
Nope, just one.

> 1) Via the current boot protocol, passing a DTB in a particular
> register.
 
This is the only bit relevant to the kernel proper. It does not change
with UEFI/ACPI.

> 2) As an EFI application. As I understand it in this case the DTB will
> be saved in a system table (I may have got the terminology wrong here),
> and the EFI stub will need to look it up to pass it to the kernel.
 
This applies only to the stub itself, and relates to dealing with a
firmware that provides a preloaded tree. As well as an obscurity
relating to _stub_ command line passing.

It has also not been included in the patch sets sent out so far.

> As long as that's well defined and does not preclude ACPI, then I am
> happy.

This is already well defined. I'll agree it may not be explicit enough.
If we do need any documentation changes, I feel they belong in Booting,
to explain that a minimal DT will be used even with ACPI in order _not_
to break the existing boot protocol.

/
    Leif
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
