From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: Add L2 cache topology to ARM Ltd boards/models
Date: Mon, 16 Feb 2015 10:19:35 +0000
Message-ID: <20150216101935.GA8676@leverpostej>
References: <1421841750-26722-1-git-send-email-sudeep.holla@arm.com>
 <20150121164632.GK5044@leverpostej>
 <20150212140702.GF1522@leverpostej>
 <54E1BEC5.5070009@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54E1BEC5.5070009-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "ksankaran-qTEPVZfXA3Y@public.gmane.org" <ksankaran-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, "suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org" <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Thomas Lendacky <Thomas.Lendacky-5C7GfCeVMHo@public.gmane.org>, Joel Schopp <Joel.Schopp-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 16, 2015 at 09:56:21AM +0000, Sudeep Holla wrote:
> Hi Mark,
> 
> On 12/02/15 14:07, Mark Rutland wrote:
> > Hi,
> >
> > On Wed, Jan 21, 2015 at 04:46:32PM +0000, Mark Rutland wrote:
> >> On Wed, Jan 21, 2015 at 12:02:30PM +0000, Sudeep Holla wrote:
> >>> Commit 5d425c18653731af6 ("arm64: kernel: add support for cpu
> >>> cache information") adds cacheinfo support for ARM64. Since
> >>> there's no architectural way of detecting the cpus that share
> >>> particular cache, device tree can be used and the core cacheinfo
> >>> already supports the same.
> >>
> >> This still leaves the possibility that misleading information is
> >> exposed for systems from other vendors. I've made a quick attempt
> >> to Cc the authors of other arm64 dts here.
> >>
> >> Given that in the absence of these nodes we can't derive a complete
> >> view of the cache hierarchy, shouldn't we only expose the cacheinfo
> >> when we have these nodes and can therefore produce correct values?
> >
> > I'm still rather concerned about exposing misleading cache info in
> > this manner. Is there no way we can limit the exposure of this
> > information to those cases where we actually have the information?
> >
> 
> Yes I have a patch to check all the device nodes in the cache hierarchy
> before initializing the sysfs. So cacheinfo won't be setup if all the
> device nodes aren't found(at-least on architecture like ARM/ARM64 which
> depends on DT). I will post it soon, was waiting for a week so that it's
> not lost during merge window.

Great, that's exactly what I was hoping for!

> > Do we know if/how this will work for ACPI systems?
> >
> 
> It should be similar to DT i.e. the hierarchy must be completely
> detected through ACPI tables/methods, but I have not thought of
> implementation specifics yet.

Ok.

Thanks,
Mark
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
