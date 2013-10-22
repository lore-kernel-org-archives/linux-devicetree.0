From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution,
 or is there something better?
Date: Tue, 22 Oct 2013 11:27:32 +0100
Message-ID: <52665314.2040904@imgtec.com>
References: <52644A9E.3060007@wwwdotorg.org>	<20131021085420.GA21518@ulmo.nvidia.com> <52658C49.80400@wwwdotorg.org> <5265AFED.1040503@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5265AFED.1040503-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/10/13 23:51, Guenter Roeck wrote:
> In my opinion, not being able to describe behavior (or what people refer
> to as "describe how the hardware is used") is a severe limitation of
> devicetree usage in Linux. That is not a devicetree limitation per se,
> though, it is simply a matter of choice (or, in some cases, the ability
> of those arguing for new bindings to sell those bindings as "hardware
> description").

I agree this is a real problem, and I think it hinders upstream
submission, since platform data was permitted to describe behaviour as
well as describe the hardware, and platform data is being replaced with
DT which is only permitted to describe the hardware. How then should we
specify the behaviour to the kernel?

I've already mentioned specific examples of this on the "Clock DT
bindings" thread, and would be very interested if anybody has thoughts
about it:
http://lkml.kernel.org/r/520E1DF5.4030409-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org

Cheers
James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
