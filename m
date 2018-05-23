From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] gpio: syscon: Add gpio-syscon for rockchip
Date: Wed, 23 May 2018 14:53:53 -0500
Message-ID: <CAL_Jsq+VBspzCaLD2Wy=fyC-S+LKGZbVsB+b+Etkx91ioXOCuQ@mail.gmail.com>
References: <1526614328-6869-1-git-send-email-djw@t-chip.com.cn>
 <6ffb43dc-55a5-14eb-eb18-3a731cdaf424@t-chip.com.cn> <CAL_Jsq+_QEBWdxW=J4oVGWeokc-+nMzxzX_pgCayaxg-ehivfQ@mail.gmail.com>
 <1685755.J6GI985WX3@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1685755.J6GI985WX3@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Levin Du <djw@t-chip.com.cn>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 10:12 AM, Heiko St=C3=BCbner <heiko@sntech.de> wrot=
e:
> Hi Rob, Levin,
>
> sorry for being late to the party.
>
> Am Mittwoch, 23. Mai 2018, 16:43:07 CEST schrieb Rob Herring:
>> On Tue, May 22, 2018 at 9:02 PM, Levin Du <djw@t-chip.com.cn> wrote:
>> > On 2018-05-23 2:02 AM, Rob Herring wrote:
>> >> On Fri, May 18, 2018 at 11:52:05AM +0800, djw@t-chip.com.cn wrote:
>> >>> From: Levin Du <djw@t-chip.com.cn>
>> >>>
>> >>> Some GPIOs sit in the GRF_SOC_CON registers of Rockchip SoCs,
>> >>> which do not belong to the general pinctrl.
>> >>>
>> >>> Adding gpio-syscon support makes controlling regulator or
>> >>> LED using these special pins very easy by reusing existing
>> >>> drivers, such as gpio-regulator and led-gpio.
>> >>>
>> >>> Signed-off-by: Levin Du <djw@t-chip.com.cn>
>> >>>
>> >>> ---
>> >>>
>> >>> Changes in v2:
>> >>> - Rename gpio_syscon10 to gpio_mute in doc
>> >>>
>> >>> Changes in v1:
>> >>> - Refactured for general gpio-syscon usage for Rockchip SoCs.
>> >>> - Add doc rockchip,gpio-syscon.txt
>> >>>
>> >>>   .../bindings/gpio/rockchip,gpio-syscon.txt         | 41
>> >>>
>> >>> ++++++++++++++++++++++
>> >>>
>> >>>   drivers/gpio/gpio-syscon.c                         | 30
>> >>>
>> >>> ++++++++++++++++
>> >>>
>> >>>   2 files changed, 71 insertions(+)
>> >>>   create mode 100644
>> >>>
>> >>> Documentation/devicetree/bindings/gpio/rockchip,gpio-syscon.txt
>> >>>
>> >>> diff --git
>> >>> a/Documentation/devicetree/bindings/gpio/rockchip,gpio-syscon.txt
>> >>> b/Documentation/devicetree/bindings/gpio/rockchip,gpio-syscon.txt
>> >>> new file mode 100644
>> >>> index 0000000..b1b2a67
>> >>> --- /dev/null
>> >>> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-syscon.tx=
t
>> >>> @@ -0,0 +1,41 @@
>> >>> +* Rockchip GPIO support for GRF_SOC_CON registers
>> >>> +
>> >>> +Required properties:
>> >>> +- compatible: Should contain "rockchip,gpio-syscon".
>> >>> +- gpio-controller: Marks the device node as a gpio controller.
>> >>> +- #gpio-cells: Should be two. The first cell is the pin number and
>> >>> +  the second cell is used to specify the gpio polarity:
>> >>> +    0 =3D Active high,
>> >>> +    1 =3D Active low.
>> >>
>> >> There's no need for this child node. Just make the parent node a gpio
>> >> controller.
>> >>
>> >> Rob
>> >
>> > Hi Rob, it is not clear to me. Do you suggest that the grf node should=
 be
>> > a
>> > gpio controller,
>> > like below?
>> >
>> > +    grf: syscon at ff100000 {
>> > +        compatible =3D "rockchip,gpio-syscon", "rockchip,rk3328-grf",
>> > "syscon", "simple-mfd";
>>
>> Yes, but drop "rockchip,gpio-syscon" and "simple-mfd".
>
> I would disagree quite a bit here. The grf are the "general register file=
s",
> a bunch of registers used for quite a lot of things, and so it seems
> among other users, also a gpio-controller for some more random pins
> not controlled through the regular gpio controllers.
>
> For a more fully stocked grf, please see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm/boot/dts/rk3288.dtsi#n855
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm64/boot/dts/rockchip/rk3399.dtsi#n1338
>
> So the gpio controller should definitly also be a subnode.

Sigh, yes, if there are a bunch of functions needing subnodes like the
above, then yes that makes sense. But that's not what has been
presented. Please make some attempt at defining *all* the functions.
An actual binding would be nice, but I'll settle for just a list of
things. The list should have functions that have DT dependencies (like
clocks for phys in the above) because until you do, you don't need
child nodes.

> The gpio in question is called "mute", so I'd think the gpio-syscon drive=
r
> should just define a "rockchip,rk3328-gpio-mute" compatible and contain
> all the register voodoo in the driver itself and not define it in the dt.

Is there really just one GPIO? If it has a defined function, then is
it really GP? Can you control direction? I know Linus W doesn't like
that kind of abuse of GPIO.

> So it should probably look like
>
> grf: syscon at ff100000 {
>         compatible =3D "rockchip,rk3328-grf", "syscon", "simple-mfd";
>
>         [all the other syscon sub-devices]
>
>         gpio_mute: gpio-mute {
>                 compatible =3D "rockchip,rk3328-gpio-mute";
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>         };
>
>         [more other syscon sub-devices]
> };
