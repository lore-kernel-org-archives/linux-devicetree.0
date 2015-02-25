From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm64: Add L2 cache topology to ARM Ltd boards/models
Date: Wed, 25 Feb 2015 17:14:09 +0100
Message-ID: <2231708.1y1gnmyPQn@wuerfel>
References: <1421841750-26722-1-git-send-email-sudeep.holla@arm.com> <1542574.d99bFx24pn@wuerfel> <54EC9546.50005@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54EC9546.50005-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 February 2015 15:14:14 Sudeep Holla wrote:
> Hi Arnd,
> 
> On 21/01/15 14:43, Arnd Bergmann wrote:
> > On Wednesday 21 January 2015 12:02:30 Sudeep Holla wrote:
> >>
> >> Hi Arnd/Olof,
> >>
> >> Though this patch and commit 5d425c18653731af6 ("arm64: kernel: add
> >> support for cpu cache information") which is in -next(via arm64) are
> >> dependent to provide desired functionality, then can go indepedently
> >> if you think there could be conflicts if this change is taken via arm64.
> >> If not, Catalin can pick up with your acks after the review.
> >
> > I think it would be better to take this through arm-soc. It's not
> > extremely likely to cause conflicts, but as you say there are no
> > strict dependencies on which goes in first, so there is no harm
> > in merging them separately.
> >
> 
> I think this patch got missed for -rc1. The arm64 architectural
> support patch for cacheinfo got merged via arm64 tree. It would be good
> if this is also merged so that cache information can be exposed
> to the user-space on ARM Ltd boards.
> 

Ah, bummer. I've applied this one as a fix for 4.0 because I said we'd
take it and dropped the ball on it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
