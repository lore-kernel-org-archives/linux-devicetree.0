From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 10:23:18 -0800
Message-ID: <20131119182318.GB20967@quad.lixom.net>
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
Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 02:38:40PM +0000, Mark Rutland wrote:
> On Tue, Nov 19, 2013 at 01:56:26PM +0000, Stefano Stabellini wrote:

> > I would not go as far as requiring that only one is available.
> > Certainly I would mandate that either of them are independently complete
> > and sufficient to describe the platform.
> 
> At that point we need to choose one to prefer. This will be a completely
> arbitrary choice, but as in the EFI case we would expect a DTB stub (for
> passing some options in /chosen), preferring the DT if it's more than a
> stub would make sense to me.
> 
> The key point is that the kernel will rely solely on one of them to
> provide hardware description.

Given that the likley path is to have a static DT override a broken ACPI
table on a system, giving preference to DT seems like the logical choice
at this time.

There's also presendence from x86 to allow bootargs such as "noacpi" to disable
one or the other, but hopefully we can avoid that as long as possible.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
