From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 13:56:26 +0000
Message-ID: <alpine.DEB.2.02.1311191304260.27757@kaball.uk.xensource.com>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131115175241.GB27174@quad.lixom.net> <20131119113015.GH5914@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131119113015.GH5914-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 19 Nov 2013, Mark Rutland wrote:
> > We all know DT considerably better to a point where I would recommend
> > that they flash a DTB in their UEFI firmware instead of go with ACPI. For
> > simple hardware and basic devices we've got most bindings sorted out by
> > now, and we've decided on backwards compatibility from here on out.
> 
> If a vendor does this, with a DTB that correctly describes their
> hardware then I am not against it (and would prefer this case to mapping
> from ACPI to DT).

I think that the firmware passing a DTB to the bootloader/kernel is the
best option we have.


> For that case we will also require a nailed-down boot
> protocol that allows for either DTB or ACPI.

The latest documentation patch for the "arm/arm64 UEFI boot protocol"
implies that UEFI on ARM is already capable of passing a DTB to the
kernel:

"The implementation depends on receiving information about the UEFI
environment in a Flattened Device Tree (FDT) - so is only available with
CONFIG_OF."

Maybe we just need to better document it?


> (only one at a time)

I would not go as far as requiring that only one is available.
Certainly I would mandate that either of them are independently complete
and sufficient to describe the platform.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
