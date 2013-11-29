From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
	generic bus properties
Date: Fri, 29 Nov 2013 09:57:03 +0000
Message-ID: <20131129095703.GV16735@n2100.arm.linux.org.uk>
References: <20131127172806.GC2291@e103592.cambridge.arm.com> <20131128203322.GB14689@mithrandir> <20131128211009.GA26447@obsidianresearch.com> <20131128222232.GF14689@mithrandir> <20131128233147.GA19387@obsidianresearch.com> <20131129023554.GA14239@kroah.com> <20131129093713.GC22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129093713.GC22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 10:37:14AM +0100, Thierry Reding wrote:
> There's a large gap between how fast new SoCs are supposed to tape out
> and the rate at which new code can be merged upstream. Perhaps some of
> that could be mitigated by putting more of the complexity into firmware
> and that's already happening to some degree for ARMv8. But I suspect
> there's a limit to what you can hide away in firmware while at the same
> time giving the kernel enough information to do the right thing.

One of the bigger issues which stands in the way of companies caring
about mainstream support is closed source IPs like VPUs and GPUs.

If you have one of those on your chip, even if the kernel side code
is already under the GPL, normally that code is not "mainline worthy".
Also, as the userspace code may not be open source, some people object
to having the open source part in the kernel.

So for customers to be able to get the performance out of the chip,
they have to stick with having non-mainline kernel.

At that point, why bother spending too much time getting mainline
support for the device.  It's never going to be fully functional in
mainline.  It doesn't make sense for these SoC companies.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
