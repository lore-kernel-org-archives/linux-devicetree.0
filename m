From: Silvio Pellicano <8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 0/5] ARM: dts: sunxi: Add backlight node
 to q8 tablets
Date: Thu, 31 Dec 2015 16:17:21 -0800 (PST)
Message-ID: <6cd9718a-3339-4779-8772-004923077fb0@googlegroups.com>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
 <fc4adcf5-4362-4d4c-b42e-729922c79f65@googlegroups.com>
 <5677F7CF.3050308@redhat.com>
Reply-To: 8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_697_785438814.1451607441727"
Return-path: <linux-sunxi+bncBDB4XENY4EMRBEULS62AKGQEL72ANHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5677F7CF.3050308-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: 8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_697_785438814.1451607441727
Content-Type: multipart/alternative;
	boundary="----=_Part_698_467393797.1451607441727"

------=_Part_698_467393797.1451607441727
Content-Type: text/plain; charset=UTF-8


>
> the backlight-pwm driver / add CONFIG_BACKLIGHT_PWM=y to your .config 
> (and make sure it stays that way after a "make oldconfig"). 
>
>
> Ok kernel with pwm_backligth leave on backlight, now i must turn on VUSB 
for OTG , uboot 
turn otg vbus on kernel NOT(switch off).
------=_Part_698_467393797.1451607441727--

------=_Part_697_785438814.1451607441727--
