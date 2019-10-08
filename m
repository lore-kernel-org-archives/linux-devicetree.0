From: djw@t-chip.com.cn
Subject: Re: [PATCH 1/6] arm64: dts: rockchip: Fix rk3399-roc-pc pwm2 pin
Date: Tue, 08 Oct 2019 11:11:10 +0800
Message-ID: <87eezolynl.fsf@archiso.i-did-not-set--mail-host-address--so-tickle-me>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
 <20190919052822.10403-2-jagan@amarulasolutions.com>
 <6797961.eJj5WIFbM9@phil>
 <CAMty3ZDKaywoPxCSD-5N2pLjtGmZ-dZ7ZgUOJqiB1V_9rfR26A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMty3ZDKaywoPxCSD-5N2pLjtGmZ-dZ7ZgUOJqiB1V_9rfR26A@mail.gmail.com>
 (Jagan Teki's message of "Tue, 1 Oct 2019 15:56:14 +0530")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <akash@openedev.com>, Da Xue <da@lessconfused.com>, linux-amarula <linux-amarula@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Jagan Teki <jagan@amarulasolutions.com> writes:

> Hi Heiko,
>
> On Mon, Sep 30, 2019 at 2:51 AM Heiko Stuebner <heiko@sntech.de> wrote:
>>
>> Hi Jagan,
>>
>> Am Donnerstag, 19. September 2019, 07:28:17 CEST schrieb Jagan Teki:
>> > ROC-PC is not able to boot linux console if PWM2_d is
>> > unattached to any pinctrl logic.
>> >
>> > To be precise the linux boot hang with last logs as,
>> > ...
>> > .....
>> > [    0.003367] Console: colour dummy device 80x25
>> > [    0.003788] printk: console [tty0] enabled
>> > [    0.004178] printk: bootconsole [uart8250] disabled
>> >
>> > In ROC-PC the PWM2_d pin is connected to LOG_DVS_PWM of
>> > VDD_LOG. So, for normal working operations this needs to
>> > active and pull-down.
>> >
>> > This patch fix, by attaching pinctrl active and pull-down
>> > the pwm2.
>>
>> This looks highly dubious on first glance. The pwm subsystem nor
>> the Rockchip pwm driver do not do any pinctrl handling.
>>
>> So I don't really see where that "active" pinctrl state is supposed
>> to come from.
>>
>> Comparing with the pwm driver in the vendor tree I see that there
>> is such a state defined there. But that code there also looks strange
>> as that driver never again leaves this active state after entering it.
>>
>> Also for example all the Gru devices run with quite a number of pwm-
>> regulators without needing additional fiddling with the pwm itself, so
>> I don't really see why that should be different here.
>
> I deed, I was supposed to think the same. but the vendor kernel dts
> from firefly do follow the pwm2 pinctrl [1]. I wouldn't find any
> information other than this vensor information, ie one of the reason I
> have marked "Levin Du" who initially supported this board.
>
> One, think I have seen was this pinctrl active fixed the boot hang.
> any inputs from would be very helpful.
>
> Levin Du, any inputs?
>
> [1] https://github.com/FireflyTeam/kernel/blob/stable-4.4-rk3399-linux/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi#L1184
>

A grep of the `pwm2` shows that there's such block in rk3399-nanopi4.dtsi:

    &pwm2 {
            pinctrl-names = "active";
            pinctrl-0 = <&pwm2_pin_pull_down>;
            status = "okay";
    };

But last time I checked, using the mainline U-Boot (the roc-rk3399-pc is
in mainline now) with mainline linux v5.2-rc7, no such setting is
necessary, and the board boots happily.

I cannot find the use of "active" pinctrl state in the
`drivers/pwm/pwm-rockchip.c`. If the pinctrl state needs to be setup as
default, the `pinctrl-names` needs to be "default" or "init" (see
`drivers/base/pinctrl.c`) .

Jagan, what version of board do you use? I checked with
"ROC-RK3399-PC-V1.0-A 2018-07-12". 

Thanks

--
Levin Du
