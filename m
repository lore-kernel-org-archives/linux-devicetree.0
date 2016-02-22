MIME-Version: 1.0
In-Reply-To: <20160218145954.GI7129@sirena.org.uk>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
	<1455673992-16469-4-git-send-email-jay.xu@rock-chips.com>
	<20160217110306.GJ7544@sirena.org.uk>
	<20160218143702.GN9654@rob-hp-laptop>
	<20160218145954.GI7129@sirena.org.uk>
Date: Mon, 22 Feb 2016 14:12:22 -0600
Message-ID: <CAL_JsqJpzbYjC7L71Z61pAzzx8cp8fAwYsLVvnkysB_LwbiviQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: rockchip: add bindings for rk3399 i2s
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Mark Brown <broonie@kernel.org>
Cc: "jianqun.xu" <jay.xu@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, huangtao@rock-chips.com, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 18, 2016 at 8:59 AM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Feb 18, 2016 at 08:37:02AM -0600, Rob Herring wrote:
>> On Wed, Feb 17, 2016 at 11:03:06AM +0000, Mark Brown wrote:
>
>> > As with the other patch I'd expect to see a matching driver update if
>> > only for documentation purposes.
>
>> Why? They match on the prior chip's compatible until there is some
>> difference the driver needs to handle.
>
> That then requires anyone using a compatible string to also know the
> full set of other compatible strings that can be used for this device
> and that they have to list the others too in the correct order which
> isn't something the binding document tells them.  It also feels better
> to record in the code how we think we should support the device when we
> know it, seems more helpful.
