From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2 v4] clk: Add Gemini SoC clock controller
Date: Thu, 15 Jun 2017 14:57:53 +0200
Message-ID: <CACRpkdY+aSyec9PZaoXErzsRefWg2zzw1xihQt_whmote-jBBw@mail.gmail.com>
References: <20170524082044.8473-1-linus.walleij@linaro.org>
 <20170601070208.GO20170@codeaurora.org> <CACRpkdZv8MzXVecEXVdJ+P0MxVscYSy=MxC-yQAR0S4yQ6-rwQ@mail.gmail.com>
 <20170605195812.GH20170@codeaurora.org> <CACRpkdbya9xaN-i7AkG0bTyuFYfZc59sSTYhWB43=9btSKfPpQ@mail.gmail.com>
 <CACRpkdapAgHix2vw-woDFi4sh+H3_EX7w-5q=opBGMyegFrXbA@mail.gmail.com>
 <20170612210248.GP20170@codeaurora.org> <CACRpkdaZJbzC0-xg_go=-o+0cQ-JOY3mUe27HUnwQ+DnZYbyMA@mail.gmail.com>
 <CAMuHMdXdYNTLCUfQ9rdj8Fffff5G6fGREcHs5-E5LbwPU9yyLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXdYNTLCUfQ9rdj8Fffff5G6fGREcHs5-E5LbwPU9yyLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 10:55 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:

> If clocks and resets are provided by the same hardware module, you can
> have a single (platform) driver registering both the clock and reset
> controllers.
> Cfr. drivers/clk/renesas/renesas-cpg-mssr.c.

That is indeed an option.

So I would say, clk & reset maintainers: would you prefer that I merge the
reset control into the clock driver as well, ask Philipp to drop the pending
reset control patches from his subsystem tree and have you manage the
combined driver and bindings?

It seems to me as very ugly from a divide & conquer subsystem and file
split point of view.

I seems elegant from the "make clocks a platform device" point of view.

I am happy with either approach as long as it works.

I guess it is up to the taste of the subsystem maintainers, especially
clk.

If I get some time I might just hack this up and send the patches so
it is on the table as an alternative to the current v5 patch. Certainly it is
better than going back and augmenting the DT bindings.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
