From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and
 evaluation board dts
Date: Fri, 13 Mar 2015 10:34:54 +0000
Message-ID: <20150313103453.GA3592@leverpostej>
References: <1426107080-29079-1-git-send-email-galak@codeaurora.org>
 <1426107080-29079-2-git-send-email-galak@codeaurora.org>
 <20150312170541.GE30145@leverpostej>
 <E114AF0E-5DA9-412A-B3E2-DDD95D224C66@codeaurora.org>
 <20150312182508.GF30145@leverpostej>
 <F0B0524B-AC0E-4E60-9A21-1208C4A978F5@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <F0B0524B-AC0E-4E60-9A21-1208C4A978F5-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > Which of spin-table/psci are you planning on using for SMP support, and
> > when would that be likely to appear?
> 
> We have a qcom specific SMP enablement method for this device.  This
> was one of our first devices so it utilized as much from arm 32-bit as
> possible.

Implementation specific enable methods are something we really don't
want to see for arm64. If PSCI is out of the question then a spin-table
shim in your bootloader shouldn't be too hard to implement.

> > Which exception level do CPUs enter the kernel? Even without a
> > virt-capable GIC booting at EL2 is less work for the FW and gives the
> > kernel a better chance of fixing things up (e.g. CNTVOFF).
> 
> I think the enter in EL1.

That's unfortunate, but so long as they are consistent, it's not the end
of the world.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
