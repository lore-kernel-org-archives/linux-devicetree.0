From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 5/8] rtc: ac100: Add clk output support
Date: Sun, 26 Jun 2016 22:58:07 +0800
Message-ID: <CAGb2v64YnSz5MnnF==ZeeqZw4yBY2R=dNVdyi9BczVR5WCNZ3g@mail.gmail.com>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-6-git-send-email-wens@csie.org> <20160626004557.GX5809@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160626004557.GX5809@piout.net>
Sender: linux-clk-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, rtc-linux@googlegroups.com, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 26, 2016 at 8:45 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 20/06/2016 at 10:52:15 +0800, Chen-Yu Tsai wrote :
>> +struct ac100_clk32k {
>> +     struct clk_hw hw;
>> +     struct regmap *regmap;
>> +     u8 offset;
>> +};
>> +
>> +#define to_ac100_clk32k(_hw) container_of(_hw, struct ac100_clk32k, hw)
>> +
>> +#define AC100_RTC_32K_NAME   "ac100-rtc-32k"
>> +#define AC100_RTC_32K_RATE   32768
>> +#define AC100_ADDA_4M_NAME   "ac100-adda-4M"
>> +#define AC100_ADDA_4M_RATE   4000000
>> +#define AC100_CLK32K_NUM     3
>> +
>> +static const char * const ac100_clk32k_names[] = {
>> +     "ac100-clk32k-ap",
>> +     "ac100-clk32k-bb",
>> +     "ac100-clk32k-md",
>> +};
>> +
>
> Well, naming things is hard but I don't feel ac100_clk32k and
> ac100-clk32k are good prefixes for those clocks as they are actually
> dividing a 32KHz or 4MHz clock (one configuration out of 128 is 32KHz).

I agree it's a bit misleading. There are 2 names used throughout the
datasheet: 1) CKOn_RTC for the pin names, and 2) CLK32Kxx for the
register names and block diagram.

I'll switch to the pin names, since this is probably what is shown on
board schematics.

> Else, I don't have any objection.

Thanks!
ChenYu
