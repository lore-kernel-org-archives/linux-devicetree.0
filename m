From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [kbuild-all] [PATCH V3 4/4] dma: add Qualcomm Technologies HIDMA channel driver
Date: Wed, 11 Nov 2015 09:42 +0100
Message-ID: <4119660.BobUIRMK6T@wuerfel>
References: <201511090323.GmbQltpW%fengguang.wu@intel.com> <563FEC48.2010404@codeaurora.org> <20151111022103.GA29459@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151111022103.GA29459-q6ZYBFIlbFFi0tQiZxhdj1DQ4js95KgL@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fengguang Wu <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 11 November 2015 10:21:03 Fengguang Wu wrote:
> Hi Sinan,
> 
> Sorry please ignore this warning -- it's actually a problem specific
> to the mn10300 arch. I'll disable such warning in mn10300 in future.

I just tried to find what happened here. mn10300 appears to define
the type based on the gcc version:

#if __GNUC__ == 4
typedef unsigned int    __kernel_size_t;
typedef signed int      __kernel_ssize_t;
#else
typedef unsigned long   __kernel_size_t;
typedef signed long     __kernel_ssize_t;
#endif

while gcc defines it based on whether you are using a Linux targetted
gcc or a bare-metal one:

gcc/config/mn10300/linux.h:#undef SIZE_TYPE
gcc/config/mn10300/mn10300.h:#undef  SIZE_TYPE
gcc/config/mn10300/mn10300.h:#define SIZE_TYPE "unsigned int"

I can think of two reasons why it went wrong here:

a) You are using gcc-5.x, and the check in the kernel should be ">="
   rather than "==". We should probably fix that regardless

b) You are using a bare-metal gcc rather than a Linux version.

I couldn't find an mn10300 gcc on kernel.org, which one do you use?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
