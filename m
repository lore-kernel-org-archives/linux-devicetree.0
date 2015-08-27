From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [PATCH 00/16] deps: deterministic driver initialization order
Date: Thu, 27 Aug 2015 21:15:26 +0200
Message-ID: <55DF61CE.9030303@ahsoftware.de>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
 <55DF5E7C.8030806@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DF5E7C.8030806-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russel King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 27.08.2015 um 21:01 schrieb Alexander Holler:
> Am 26.08.2015 um 14:28 schrieb Alexander Holler:
>
>> The final 2 patches are fixes which should end up in mainline, regardless
>> if this feature is merged or not.
>
> Just in case your serial or MTD-NAND partitions don't work, the drivers
> drivers/tty/serial/8250/8250_core.c and drivers/mtd/ofpart.c need the
> same trivial fix for their initcall level as found in the last two
> patches of my series. I'm not going to post these patches now until I've
> got some feedback for the other stuff.

And just in case, I also have an idea how to fix such dependencies for 
drivers without DT (by adding hard-wired dependencies directly to 
drivers). That would also be usable for ACPI and x86.

But one step after another. Based on my past experiences, I don't even 
think the stuff I've just posted will ever end up in the kernel.

> Regards,
>
> Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
