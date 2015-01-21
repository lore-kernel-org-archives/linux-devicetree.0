From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm64: Add L2 cache topology to ARM Ltd boards/models
Date: Wed, 21 Jan 2015 15:43:23 +0100
Message-ID: <1542574.d99bFx24pn@wuerfel>
References: <1421841750-26722-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421841750-26722-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 21 January 2015 12:02:30 Sudeep Holla wrote:
> 
> Hi Arnd/Olof,
> 
> Though this patch and commit 5d425c18653731af6 ("arm64: kernel: add
> support for cpu cache information") which is in -next(via arm64) are
> dependent to provide desired functionality, then can go indepedently
> if you think there could be conflicts if this change is taken via arm64.
> If not, Catalin can pick up with your acks after the review.

I think it would be better to take this through arm-soc. It's not
extremely likely to cause conflicts, but as you say there are no
strict dependencies on which goes in first, so there is no harm
in merging them separately.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
