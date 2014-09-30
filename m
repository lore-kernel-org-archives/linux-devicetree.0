From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 1/7] clk: sunxi: Specify number of child clocks for
 divs clocks
Date: Tue, 30 Sep 2014 23:56:24 +0800
Message-ID: <CAGb2v64RPi2J4gpWu7X15xSx89guPSoEs2_7Bxs9ywj023fabA@mail.gmail.com>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-2-git-send-email-wens@csie.org> <20140930154043.GN4081@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140930154043.GN4081@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 11:40 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Sat, Sep 27, 2014 at 04:49:49PM +0800, Chen-Yu Tsai wrote:
>> Currently sunxi_divs_clk_setup assumes the number of child clocks
>> to be the same as the number of clock-output-names, and a maximum
>> of SUNXI_DIVS_MAX_QTY child clocks.
>>
>> On sun6i, PLL6 only has 1 child clock, but the parent would be used
>> as well, thereby also having it's own clock-output-names entry. This
>> results in an extra bogus clock being registered.
>
> Isn't PLL6 having two childs as well?

No. It has one child, the normal PLL6 output clock.

The last "clock-output-names" entry refers to the factors clock itself,
in this case, the 2x clock output.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
