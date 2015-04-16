From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arch: arm: Show the serial number from devicetree in
 cpuinfo
Date: Thu, 16 Apr 2015 17:05:07 +0100
Message-ID: <20150416160506.GA12732@n2100.arm.linux.org.uk>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
 <1427564371-26039-2-git-send-email-contact@paulk.fr>
 <20150416094623.GX12732@n2100.arm.linux.org.uk>
 <1429179791.2483.13.camel@collins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429179791.2483.13.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 16, 2015 at 12:23:11PM +0200, Paul Kocialkowski wrote:
> We could simply check whether the serial-number property is there (when
> DT is enabled at all) and fallback to using serial_low/high when it's
> not the case (which would perhaps be 0), at a later point in
> initialization. If you think init_machine_late is a good fit, then I'll
> go for it.

I do.  The only user of the string right now is userspace.  We don't
expect the serial number to change over the lifetime of the kernel,
and we expect that it's initialised by the time userspace gets to run.

So, doing this at late_initcall() time seems completely sensible to me.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
