From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 02/13] clk: sunxi-ng: sun6i: Rename HDMI DDC clock to
 avoid name collision
Date: Wed, 27 Sep 2017 11:45:02 +0800
Message-ID: <CAGb2v67dTG536S00nNCg_D1aNPkxTsGAF3c20x7fN-LqCjhNzA@mail.gmail.com>
References: <20170926065919.24446-1-wens@csie.org> <20170926065919.24446-3-wens@csie.org>
 <20170926093247.blcu52dzluqawzb5@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170926093247.blcu52dzluqawzb5@flea>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 5:32 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Sep 26, 2017 at 06:59:08AM +0000, Chen-Yu Tsai wrote:
>> The HDMI DDC clock found in the CCU is the parent of the actual DDC
>> clock within the HDMI controller. That clock is also named "hdmi-ddc".
>>
>> Rename the one in the CCU to "hdmi-ddc-parent". This makes more sense
>> than renaming the one in the HDMI controller to something else.
>>
>> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> I'd rather stick to the datasheet names. What about "DDC" ?

Works for me.

Thanks
ChenYu
