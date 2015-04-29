From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock support
Date: Wed, 29 Apr 2015 16:33:11 +0200
Message-ID: <CAMuHMdVdtoXGhK97Ky5hoVcjM6XZAZXKWELL64MFQebMpFr2Ng@mail.gmail.com>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
	<1428432239-4114-5-git-send-email-lee.jones@linaro.org>
	<20150407191746.GA26727@lukather>
	<20150408081450.GB5162@x1>
	<20150408094349.GC26727@lukather>
	<20150408103832.GG5162@x1>
	<20150408155705.GF26727@lukather>
	<20150408172344.GH5162@x1>
	<20150422093446.GA28007@lukather>
	<20150429141751.GR9169@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429141751.GR9169@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, Apr 29, 2015 at 4:17 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This useful binding should be accepted and people should not abuse
> it.  If they do and the vendor Maintainer's review and accept then
> they have no foundation for recourse.
>
> Would you prefer it if I made the warning starker?

Perhaps you can add a check for "clock-always-on" to scripts/checkpatch.pl,
to make people aware they should think twice?

Nah, people don't read documentation, don't run checkpatch, ignore compiler
warnings, etc...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
