From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of/address: Don't throw errors on absent ranges
 properties
Date: Fri, 21 Nov 2014 10:07:59 +1100
Message-ID: <1416524879.5704.55.camel@kernel.crashing.org>
References: <1415948303.666.50.camel@kernel.crashing.org>
	 <20141118165739.7382AC40966@trevor.secretlab.ca>
	 <1416364351.5704.22.camel@kernel.crashing.org>
	 <20141119103140.2B9F4C40551@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141119103140.2B9F4C40551-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-11-19 at 10:31 +0000, Grant Likely wrote:
> was my explanation being full of crap. It's my i2c
> > _controller_ which is a platform device, and is on the xscom bus
> which
> > isn't directly MMIO translatable.
> 
> Okay, that makes more sense, but if xscom is a different bus with
> different access methods, then why is it using platform_bus_type? I
> would expect it to have it's own bus_type and container for struct
> device.

There is no point really. It's not really a bus we expose as such to
Linux (mostly the FW uses it) though we use the xscom nodes as chip
nodes.

We do expose selected devices we pick from underneath xscom such
as the LPC bus and the i2c controllers as platform devices which then
use FW interfaces to perform the actual LPC or i2c accesses.

Creating a dedicated bus type would be completely pointless.

The FW itself uses what's there more intensively.

> > The patch still stands :)
> 
> Indeed, I merged it yesterday. :)

Thanks!

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
