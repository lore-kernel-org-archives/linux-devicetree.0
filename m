From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM X-Gene SoC EDAC DTS binding
Date: Thu, 30 Apr 2015 11:01:43 +0200
Message-ID: <7128860.xHITr0VFap@wuerfel>
References: <1430259045-19012-1-git-send-email-lho@apm.com> <4411194.KCIZ9l536O@wuerfel> <20150430084549.GB3488@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430084549.GB3488-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 30 April 2015 10:45:50 Borislav Petkov wrote:
> On Thu, Apr 30, 2015 at 10:31:12AM +0200, Arnd Bergmann wrote:
> > The problem with your approach is that a lot of these blocks are not
> > vendor specific. You will probably see a server chip that contains a
> > memory controller from DesignWare, a cache controller from ARM, and
> > some other device from the chip vendor, and each of them comes with
> > EDAC support. Then you get three other vendors that have various
> > combinations of the same memory controller, cache controller and
> > other EDAC devices. Not all of these chips would have ARM CPU cores,
> > some may be e.g. MIPS or PowerPC.
> 
> I don't mean system-vendor specific but IP-block vendor specific. So
> doing a designware-edac, arm-edac, apm-edac and so on...

Ok, but I'd also do multiple drivers for one vendor if they have several
blocks that are clearly unrelated. My understanding was that this is the
case here, but I have not looked too closely.

Note that a lot of vendors do not like to say who they licensed IP
blocks from, or they are contractually required not to say it.

> Also, I really want for people thinking of writing EDAC drivers to think
> hard before doing so. Whether it is even worth to expose *every* RAS
> functionality in some driver. And to consider that exposing it might
> cause more trouble than benefit.

Definitely agreed on this point.

> We've had that experience on x86 with reporting innocuous DRAM ECC
> errors which were corrected by the hardware. People weren't even reading
> the error message and running around wanting to RMA their processors
> because something in dmesg screamed "Hardware Error".
> 
> And now APEI does the firmware-first thing where it gets to look at the
> error first and then decide to report it up to the OS or not.
> 
> Which is a good thing because in most cases it unnecessarily upsets the
> user.

Yes, that is helpful feedback, but seems unrelated to the discussion
about how to split this driver or not.

> So to get back on track: I think having the IP-block vendor stuff in one
> EDAC module would make this whole heterogeneity much more manageable.
> 
> On that system above, we will load - if I can count correctly - 6 EDAC
> drivers anyway. But the EDAC pile would remain sane.

Ok, let me try to state what I think we agree on:

- For EDAC devices that are clearly unrelated (in particular, made by
  different vendors, but possibly part of the same chip), there should
  be one module per device type that registers one platform_driver.

- For EDAC drivers that are variants of one another (e.g. different
  generations of the same memory controller), we want one module with
  one platform_driver that can handle all variants.

Let me know if you disagree with the above. If that's fine, I think it
leaves the case where we have one chip that has multiple EDAC blocks
and we can't easily tell if those blocks are all inter-related or not.
For this case, I would like to rely on your judgment as subsystem
maintainer on whether the parts look related enough to have a single
driver (with matching all device variants) or one driver for each
class of device, as well as spotting cases where a part already has
a driver from a different chip vendor that was licensing the same IP
block.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
