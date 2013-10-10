From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: integrator: move CM base into device tree
Date: Thu, 10 Oct 2013 17:06:41 +0200
Message-ID: <CACRpkdY4Ao64nfppsU5HV-c41ci1Wei9T=LUvXvs3Lbwqfgp7Q@mail.gmail.com>
References: <1380816228-3209-1-git-send-email-linus.walleij@linaro.org>
	<20131008095639.GE28972@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008095639.GE28972-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 8, 2013 at 11:56 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

>>  Required nodes:
>> +- core-module: the root node to the Integrator platforms must have
>> +  a core-module with regs and the compatible-string
>> +  "arm,core-module-integrator"
>
> s/compatible-string/compatible string/
>
> What are the regs -- one entry, or several?
>
> What do they correspond to?
>
> How big are they?

OK, sent a revised patch clarifying and extending the documentation.

>> +- cpcon/syscon: the root node the Integrator/CP must have a /cpcon
>> +  node pointing to the CP control registers, and the Integrator/AP
>> +  must have a /syscon node pointing to the Integrator/AP system
>> +  controller. The AP syscon node must include the logical module
>> +  interrupts.
>
> It's a shame we can't fix this up to have a compatible string...

Who says we can't ;-)

I feel a bit guilty for this since it's my invention (I was young, I
needed the DT support so badly) so now I feel I need to go in
and write a patch for this.

In this patch it is just documenting the state of things so this
needs to be a separate cleanup.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
