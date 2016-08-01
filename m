From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
Date: Mon, 1 Aug 2016 17:13:34 +0800
Message-ID: <CAGb2v67+1rG1kj+7cGO=TMwSgpktP4xMAeZ9Zfy8PRWXyRLi+g@mail.gmail.com>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <fb559224-561c-3476-1146-96f7aea427f0@arm.com> <20160801103024.cc74c093466d7fdfd91a2587@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160801103024.cc74c093466d7fdfd91a2587-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 1, 2016 at 4:30 PM, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org> wrote:
> On Mon, 1 Aug 2016 02:43:06 +0100
> André Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>
>> As this became quite a long read, here a TL;DR:
>> - We consider using an SCPI based clock system for the A64, alongside
>> allwinner,simple-gates and fixed clocks. We try to avoid any Allwinner
>> specific clocks (apart from the simple-gates).
>> - ARM Trusted Firmware provides the SCPI implementation - for now, later
>> we may move this into a possible arisc firmware.
>> - We upstream some basic DT first, possibly omitting any controversial
>> clock parts at all.
>>
>> Let me know what you think!
>
> Hi André,
>
> This looks interesting.
> As I understand, the clock enable/rate setting functions would be in
> the arisc. The arisc firmware would be loaded only once in the Soc and
> would contain the code for handling this specific SoC.
> From my calculations, this would save about 1Mb of clock descriptions
> in the kernel for a universal Allwinner kernel.
>
> But I don't see why you are keeping the simple-gates. The bus gate may
> be ungated/gated when the clock is enabled/disabled, and that's what
> Allwinner's software does.

For peripherals that have a separate mod clock, having them separate
is a good thing. One example might be the audio codecs. You could ungate
the bus gate to access its registers to program it, but only enable
the mod clock when you actually play something.

Regards
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
