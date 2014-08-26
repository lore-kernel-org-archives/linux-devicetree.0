From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization
 order based on the DT)
Date: Tue, 26 Aug 2014 12:18:35 +0200
Message-ID: <53FC5EFB.6020109@ahsoftware.de>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>	<20140514141914.446F7C4153D@trevor.secretlab.ca>	<20140821140211.GD19293@ulmo.nvidia.com> <53F64624.5000403@ahsoftware.de>	<20140822131919.GX21734@leverpostej> <20140825093931.GB2399@ulmo>	<E1XLu15-0002DP-6o@jdl.com> <20140826085128.958A9C40989@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140826085128.958A9C40989-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 26.08.2014 10:51, schrieb Grant Likely:

> Getting the dependency tree I think is only half the problem. The other
> have is how to get the driver model to actually order probing using that
> list. That problem is hard because the order drivers are probed is
> currently determined by the interaction of driver link order, driver
> initcall level, and device registration order. The first devices are
 > registered at an early initcall, before their drivers, and therefore
 > bind order is primarily determined by initcall level and driver link
 > order. However, later devices (ie. i2c clients) are registered by the
 > bus driver (ie. again, i2c) and probe order may be primarily link order
 > (if the driver is not yet registered) or registration order (if the
 > driver was registered before the parent bus).

Using my patches, the problem which still exists is how to handle 
devices (not drivers). I've build the patches based on the assumption 
that device-handling happens automatically. Unfortunately that isn't 
really true and device-handling looks awkward. Some drivers build them 
themself, some require that a device already exists and some require 
that a device doesn't already exist.

But I haven't looked in deep at that. I'm sure that can be fixed by 
fixing drivers which do things differently than they should (maybe 
because they needed to do such for dirty workarounds because no order 
was guaranteed, which wouldn't be true anymore).

Anyway, I've not looked further into that problem (with devices, not 
drivers) as it already seems quiet impossible to get the other necessary 
stuff into the kernel in a reasonable time (before 32bit-HW which does 
use DT will not be available anymore).

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
