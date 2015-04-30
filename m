From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM
 X-Gene SoC EDAC DTS binding
Date: Thu, 30 Apr 2015 10:45:50 +0200
Message-ID: <20150430084549.GB3488@pd.tnic>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <CAL_JsqL8UnDco14Z8H7ZcxS=fLNiYgSb6ivv=zzpVctiD0FptA@mail.gmail.com>
 <20150430082051.GA3488@pd.tnic>
 <4411194.KCIZ9l536O@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4411194.KCIZ9l536O@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 30, 2015 at 10:31:12AM +0200, Arnd Bergmann wrote:
> The problem with your approach is that a lot of these blocks are not
> vendor specific. You will probably see a server chip that contains a
> memory controller from DesignWare, a cache controller from ARM, and
> some other device from the chip vendor, and each of them comes with
> EDAC support. Then you get three other vendors that have various
> combinations of the same memory controller, cache controller and
> other EDAC devices. Not all of these chips would have ARM CPU cores,
> some may be e.g. MIPS or PowerPC.

I don't mean system-vendor specific but IP-block vendor specific. So
doing a designware-edac, arm-edac, apm-edac and so on...

Also, I really want for people thinking of writing EDAC drivers to think
hard before doing so. Whether it is even worth to expose *every* RAS
functionality in some driver. And to consider that exposing it might
cause more trouble than benefit.

We've had that experience on x86 with reporting innocuous DRAM ECC
errors which were corrected by the hardware. People weren't even reading
the error message and running around wanting to RMA their processors
because something in dmesg screamed "Hardware Error".

And now APEI does the firmware-first thing where it gets to look at the
error first and then decide to report it up to the OS or not.

Which is a good thing because in most cases it unnecessarily upsets the
user.

So to get back on track: I think having the IP-block vendor stuff in one
EDAC module would make this whole heterogeneity much more manageable.

On that system above, we will load - if I can count correctly - 6 EDAC
drivers anyway. But the EDAC pile would remain sane.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
