From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun5i: Move display blocks to sun5i.dtsi
Date: Wed, 08 Jun 2016 17:28:08 +0200
Message-ID: <87oa7bd7jr.fsf@dell.be.48ers.dk>
References: <1465063524-4925-1-git-send-email-hdegoede@redhat.com>
	<1465063524-4925-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465063524-4925-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Hans de
	Goede's message of "Sat, 4 Jun 2016 20:05:24 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Hans" == Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

 > All sun5i models share, the same die, so the display-engine is

Drop comma after share.

> identical, except for which outputs / encoders all available.

s/all/are/

 > All models support parallel / lvds lcd panels, the R8 and A10s also
 > support tv-out and the A10s also supports HDMI out.

 > This commit prepares for enabling display blocks on A10s boards,
 > but it also is a bug-fix for A10s boards, because before this commit
 > the simplefb nodes for A10s where not listing the recently added

s/where/were/

 > pll3 as clock, causing the display to go block when the kernel

s/block/black/

-- 
Bye, Peter Korsgaard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
