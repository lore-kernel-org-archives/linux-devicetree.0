From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] fpga manager: Add cyclonespi driver for Altera fpgas
Date: Fri, 7 Oct 2016 11:42:23 -0700
Message-ID: <CAAtXAHfax5qve7bpxNoObZOZGZk1CoJkusMecMXyMc_w1JBbvw@mail.gmail.com>
References: <cover.1475783742.git.stillcompiling@gmail.com>
 <4b4432c04b4ea92a2af814e3d7866c33f2eb12ea.1475783742.git.stillcompiling@gmail.com>
 <CAAtXAHcWLpn3DFP6YLWqBxsMQ0O=HNNCmB+kHbHhyAHFHQUbwA@mail.gmail.com> <alpine.DEB.2.02.1610071248320.32627@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1610071248320.32627@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, julia-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Fri, Oct 7, 2016 at 11:21 AM, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:

> Moritz, Can you remind me what that issue was there (or point me to
> that email, I can't find it)?  I don't think I had a problem with that
> in your case.  In general I think if these drivers can take the
> bitstream that comes from the manufacturer's tools and stuff it into
> the FPGA, then we are accomplishing what we want.  So I am OK with
> this here.  The intent of the driver is to load a standard rbf, same
> as the other Altera FPGA drivers.

My first version of the zynq fpga manager had byte swapping in there
and detection of which format was used. Greg even (accidentially)
merged my initial code
which I then cleaned up in 4d10eaff5bfc69997a769f9c83b749f0a8c542fa
("fpga: zynq-fpga: Change fw format to handle bin instead of bit.") to
address the review
comments.

I do see your point about useability, and if this is something that
keeps coming up
we could pull that into the framework with a flag to SWAP or as part
of the image_information
struct.

Thoughts?

Cheers,

Moritz

[1] https://mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg995245.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
