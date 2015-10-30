From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4] EDAC: Add ARM64 EDAC
Date: Fri, 30 Oct 2015 18:51:15 +0100
Message-ID: <20151030175115.GI20952@pd.tnic>
References: <1446048829-3359-1-git-send-email-brijeshkumar.singh@amd.com>
 <20151028164053.GG25451@leverpostej>
 <56339A52.8060701@amd.com>
 <20151030170605.GI31073@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151030170605.GI31073@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 05:06:06PM +0000, Mark Rutland wrote:
> > * Correctable errors does not generate any interrupt:
> >   If we have to implement error parsing inside the firmware then work need
> >   to be split between OS and firmware. Maybe OS can call SMC instruction to 
> >   dial into firmware and then firmware can check error syndrome registers; 
> >   if it finds correctable error then build HEST table. This method will introduce
> >   performance issue because it require OS executing SMC every 100ms or so to just
> >   poll for correctable error. If you have any other recommendation then please share it.
> 
> I agree that this is a problem, and is an unfortunate hardware
> limitation.
> 
> I am still wary of making use of IMPLEMENTATION DEFINED features like
> this in the kernel.

Well, you could do all the correctable errors collecting in the firmware
and only report those errors to the OS when they're overflowing/reach a
certain threshold.

The idea behind it being that you don't really want to upset the user
about *every* correctable error happening because it was correctable and
the hardware, well, doh, corrected it. No problem.

But when those errors start repeating and hitting the same DIMM and
addresses in close proximity, there might be a problem which you should
report.

Btw, we have been looking for doing something like that on x86:

https://lkml.kernel.org/r/1404242623-10094-1-git-send-email-bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org

and one of those days I'll upstream the damn thing!

:-)

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
