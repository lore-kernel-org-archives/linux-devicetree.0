From: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: sunxi: dts: Add A10 uarts pin muxing options
Date: Mon, 27 Apr 2015 08:36:02 +0200
Message-ID: <CACQ1gAgkhxpHxWSRSQe3WNG7hj+EEyS3Yzsnf7TpHQV35jFhGw@mail.gmail.com>
References: <1430043338-28982-1-git-send-email-richard.genoud@gmail.com> <20150426161157.GM5627@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150426161157.GM5627@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-04-26 18:11 GMT+02:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi Richard,
>
> On Sun, Apr 26, 2015 at 12:15:38PM +0200, Richard Genoud wrote:
>> The A10 has 8 uarts, only uart0 and uart1 where filled.
>> This patch adds all the missing uarts(2 to 7) pin muxing to the dtsi.
>>
>> Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> It's obviously correct, but I'd rather not add new pinctrl nodes that
> don't have any users so that it doesn't bloat the DT without any
> particular reason.
>
> Feel free to resubmit this patch if one of these nodes become actually
> useful.

Ok, I'll resend-it with only the uarts accessible via the cubieboard
A10 expansion headers.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
