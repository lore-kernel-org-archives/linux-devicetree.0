From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 10:19:48 -0700
Message-ID: <CAD=FV=Wk1QV6oKhVML6eu74cnSYAXPGBuY54D3vLcxqZAjHb8w@mail.gmail.com>
References: <1408505461-24200-1-git-send-email-zyw@rock-chips.com>
	<20140820092117.GI4266@lee--X1>
	<53FA9D1E.8040202@rock-chips.com>
	<20140826092205.GG9574@lee--X1>
	<20140826162831.GA22842@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826162831.GA22842@core.coreip.homeip.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Chris Zhong <zyw@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Mike Turquette <mturquette@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, rtc-linux@googlegroups.com, Grant Likely <grant.likely@linaro.org>, Lin Huang <hl@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, xxx <xxx@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Olof Johansson <olof@l>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 26, 2014 at 9:28 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> Hi Lee,
>
> On Tue, Aug 26, 2014 at 10:22:05AM +0100, Lee Jones wrote:
>> On Mon, 25 Aug 2014, Chris Zhong wrote:
>> > On 08/20/2014 05:21 PM, Lee Jones wrote:
>> > >On Wed, 20 Aug 2014, Chris Zhong wrote:
>> > >
>> > >>The RK808 chip is a power management IC for multimedia and handheld
>> > >>devices. It contains the following components:
>> > >>
>> > >>- Regulators
>> > >>- RTC
>> > >>
>> > >>The rk808 core driver is registered as a platform driver and provides
>> > >>communication through I2C with the host device for the different
>> > >>components.
>> > >>
>> > >>Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>> > >>---
>>
>> [...]
>>
>> > >>+ rk808->pdata = pdata;
>> > >Remove pdata from 'struct rk808'.  You can obtain it from dev.
>> >
>> > Can I keep this pdata in rk808, because it is used in the regulator driver.
>> > The one obtain from dev maybe empty.
>>
>> If the one in dev is empty, you should populate that instead.
>
> No, drivers should not populate platform data in devices - they do not
> own it (unlike drvdata). Platform data should be read-only so that if
> one would unbind and then try to re-bind the driver we'd end up in
> exactly same state as before.
>
> For DT systems we should be allocating platform data separately and make
> sure we clean up after ourselves.

Given Dmitry's advice it seems like Chris's old code (allocate pdata
and store it in the driver's private structures) was correct.  That
also seems to match what I've seen other drivers do.

Of course what Chris ended up doing was basically saying that "device
tree" is required for rk808 and that you can't pass data into the
driver using pdata (at least in v6 you can't specify
"rockchip,system-power-controller" unless you're using device tree).
To me that doesn't seem terrible.  ...though he should probably finish
what he started by:

* Moving "struct rk808_board" so it's private to the regulator .c file

* Don't even pretend you can get stuff from dev_get_platdata() in
rk808-regulator.c

* Add a dependency on "OF" in the Kconfig for rk808.

-Doug
