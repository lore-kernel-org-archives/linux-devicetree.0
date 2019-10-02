From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/6] clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
Date: Wed, 02 Oct 2019 11:04:42 +0200
Message-ID: <1jbluzr00l.fsf@starbuckisacylon.baylibre.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com> <20190921151835.770263-3-martin.blumenstingl@googlemail.com> <1jftkcr3uy.fsf@starbuckisacylon.baylibre.com> <CAFBinCCED4YWYkdtrfrC80C8WLE=fyMJdjTa3wFNMJgC1OsoOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFBinCCED4YWYkdtrfrC80C8WLE=fyMJdjTa3wFNMJgC1OsoOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Tue 01 Oct 2019 at 20:53, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

>
> [...]
>> > +static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
>> > +     .hws = {
>> > +             [DDR_CLKID_DDR_PLL_DCO]         = &meson8_ddr_pll_dco.hw,
>> > +             [DDR_CLKID_DDR_PLL]             = &meson8_ddr_pll.hw,
>>
>> I wonder if onecell is not overkill for this driver. We won't expose the
>> DCO, so only the post divider remains
>>
>> Do you expect this provider to have more than one leaf clock ?
>> If not, maybe you could use of_clk_hw_simple_get() instead ?
> there's some more clock bits in DDR_CLK_CNTL - the public A311D
> datasheet has a description for these bits but I'm not sure they do
> the same on Meson8/Meson8b/Meson8m2
> all I know is that some magic bytes are written to DDR_CLK_CNTL in the
> old u-boot code
>
> that's why I don't want to make any assumptions and play safe here (by
> using a onecell clock provider)

Understood. Let's keep onecell then.
