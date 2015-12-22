From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/irq: Export of_irq_count()
Date: Wed, 23 Dec 2015 00:55:53 +0100
Message-ID: <CACRpkdYUbKARq-8YBV7omWX7-7NC6S0e8LLiohTxgps1Hu625g@mail.gmail.com>
References: <1450786942-13292-1-git-send-email-broonie@kernel.org>
	<CAL_JsqJELQc316UkkpzLrbSsYMYh69uxX5Jw8p4TpWm6eqmfuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJELQc316UkkpzLrbSsYMYh69uxX5Jw8p4TpWm6eqmfuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2015 at 6:12 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 22, 2015 at 6:22 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> Some of the Qualcomm pinctrl drivers have started trying to use
>> of_irq_count() in modular code but this fails to build as the symbol is
>> not exported.  Since there doesn't seem to be any reason not to export
>> the symbol make it available to modules.
>
> The reason it has not been exported is because we want to stick with
> the platform_* APIs for IRQs. There's not really an equivalent
> function though. Perhaps we should make one? Usually it is just used
> for allocating some driver data. If that is the case, is it really
> enough data to not just allocate the max?

Hm that seems like a bigger solution. Should we try to mitigate
the issue by making the Qualcomm drivers builtin for the time being?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
