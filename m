From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: RFC: Copying Device Tree File into reserved area of VMLINUX
 before deployment
Date: Mon, 20 Nov 2017 11:44:05 +0000
Message-ID: <20171120114405.cpsf4xtvvfpuk76u@lakrids.cambridge.arm.com>
References: <0b31e22b-202f-6fca-28f2-e16e6af6c6b7@emagii.com>
 <a0f9d598-04af-fddd-58ad-09db10ec19da@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a0f9d598-04af-fddd-58ad-09db10ec19da-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-AoFPY8dbyRPQT0dZR+AlfA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 19, 2017 at 11:23:42PM -0500, Frank Rowand wrote:
> adding devicetree list, devicetree maintainers
> 
> On 11/18/17 12:59, Ulf Samuelsson wrote:
> > I noticed when checking out the OpenWRT support for the board that they have a method to avoid having to pass the device tree address to the kernel, and can thus boot device tree based kernels with U-boots that
> > does not support device trees.
> > 
> > Is this something that would be considered useful for including in mainstream:

On 32-bit arm, we support an appended DTB for cases like this. The DTB
is appended to the end of the kernel image, rather than being embedded.

Does mips not support something similar?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
