From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Fri, 15 Nov 2013 15:07:45 +0000
Message-ID: <20131115150745.GB24831@e106331-lin.cambridge.arm.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
 <5285EE5A.1070202@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5285EE5A.1070202-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-73nT9ZVIoz3k1uMJSBkQmQ@public.gmane.org" <linux-73nT9ZVIoz3k1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Mehall <contact-U/VwWUtD1TkEIRV9q1A9vg@public.gmane.org>, Marek Czerski <ma.czerski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 09:50:18AM +0000, Jonas Bonn wrote:
[...]

> > +	gpio0: gpio@91000000 {
> > +		compatible = "opencores,jbtrivial";
> 
> There's no project called 'jbtrivial' at OpenCores.  Should this be 
> "linux,jbtrivial" to indicate that this refers to a Linux driver?

I would prefer not. Having driver names in bindings is an antipattern;
drivers should be free to change independently of the hardware or
bindings, and we should be able to create new drivers that handle
existing bindings.

Either a new compatible string should be allcoated, or one of the
generic bindings should be used. While we do have drivers for the
generic cases, the *-generic bindings are treated as a specification
that hardware can meet, and are not intended to change. They are also
there fore independent of Linux.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
