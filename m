From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 12:48:48 +0100
Message-ID: <CAFEAcA9MiK3cnxnrd3bOygXMeEAu9_sO20+CMCsYKNEJEuRxOQ@mail.gmail.com>
References: <20131020220839.GT2443@sirena.org.uk> <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg> <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg> <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef> <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg>
 <20131022201228.GB8037@mithrandir> <20131022204238.GG29341@beef> <20131023100456.GE11954@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131023100456.GE11954-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 October 2013 11:04, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I think there's some broad agreement about what stable bindings entail.
> Essentially it means at no point in the future a new kernel is allowed
> to stop working with an old binding.
>
> It also entails that bindings can change, but only in ways that don't
> break backwards-compatibility.

In my opinion it should also mean that all the same functionality
you got with the old kernel remains enabled. In other words,
if the old kernel could drive the framebuffer because the framebuffer
was still handled by platform data, then you can't break this when
you introduce a new dt binding for the framebuffer; you have to
cope with "dt blob has no node for this device because it's old".
"The kernel boots but it doesn't find half the devices" is just as broken
as "the kernel doesn't boot" if you're an end user trying to use the
old device tree blob with a new kernel...

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
