From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 5/8] arm64: dts: allwinner: add R_PIO node
Date: Fri, 10 Feb 2017 17:59:45 +0800
Message-ID: <CAGb2v65L4TBGZo8r=wo_U6grTtutupaoCmZQkNGcyRQoM2EUzw@mail.gmail.com>
References: <20170210113215.W9Rqn4js@smtp2m.mail.yandex.net>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKM663CAKGQEUNJXYSQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170210113215.W9Rqn4js-/T50SzA6+Nc0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 4:32 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>
> 2017=E5=B9=B42=E6=9C=8810=E6=97=A5 16:07=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Wed, Feb 08, 2017 at 07:08:46PM +0800, Icenowy Zheng wrote:
>> > 08.02.2017, 18:15, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> > > On Wed, Feb 08, 2017 at 06:00:06PM +0800, Icenowy Zheng wrote:
>> > >>  Allwinner A64 SoC has a R_PIO node like the one in H3.
>> > >>
>> > >>  Add the node as well as needed clocks and resets.
>> > >>
>> > >>  As there's no document for apb0_gates, I only added the R_PIO bit =
here.
>> > >>
>> > >>  Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> > >>  ---
>> > >>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 40 ++++++++++++++=
+++++++++++++
>> > >>   1 file changed, 40 insertions(+)
>> > >>
>> > >>  diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/=
arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> > >>  index 1c64ea2d23f9..4b0baa79554c 100644
>> > >>  --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> > >>  +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> > >>  @@ -98,6 +98,15 @@
>> > >>                   clock-output-names =3D "osc32k";
>> > >>           };
>> > >>
>> > >>  + apb0: apb0_clk {
>> > >>  + compatible =3D "fixed-factor-clock";
>> > >>  + #clock-cells =3D <0>;
>> > >>  + clock-div =3D <1>;
>> > >>  + clock-mult =3D <1>;
>> > >>  + clocks =3D <&osc24M>;
>> > >>  + clock-output-names =3D "apb0";
>> > >>  + };
>> > >>  +
>> > >>           psci {
>> > >>                   compatible =3D "arm,psci-0.2";
>> > >>                   method =3D "smc";
>> > >>  @@ -392,5 +401,36 @@
>> > >>                           interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL=
_HIGH>,
>> > >>                                        <GIC_SPI 41 IRQ_TYPE_LEVEL_H=
IGH>;
>> > >>                   };
>> > >>  +
>> > >>  + apb0_gates: clk@1f01428 {
>> > >>  + compatible =3D "allwinner,sun50i-a64-apb0-gates-clk",
>> > >>  + "allwinner,sun4i-a10-gates-clk";
>> > >>  + reg =3D <0x01f01428 0x4>;
>> > >>  + #clock-cells =3D <1>;
>> > >>  + clocks =3D <&apb0>;
>> > >>  + clock-indices =3D <0>;
>> > >>  + clock-output-names =3D "apb0_pio";
>> > >>  + };
>> > >>  +
>> > >>  + apb0_rst: reset@1f014b0 {
>> > >>  + reg =3D <0x01f014b0 0x4>;
>> > >>  + compatible =3D "allwinner,sun6i-a31-clock-reset";
>> > >>  + #reset-cells =3D <1>;
>> > >>  + };
>> > >
>> > > Please make a sunxi-ng driver for those clocks.
>> >
>> > We have no enough materials to make such a CCU driver.
>> >
>> > Clocks in CPUs are usually undocumented, and difficult to
>> > be collected -- even the clk-sun50iw1.c in BSP do not have
>> > all clocks in CPUs.
>>
>> That's unfortunate, but we can deal with that by simply extending the
>> clocks we have. Nothing too complicated or unconvenient to deal with.
>
> I did a WIP R_CCU driver based on the info on the wiki -- https://github.=
com/Icenowy/linux/commit/8d215986f4d33ded68c705d4bb152bbb863446c9
>
> Only infomation about H3 and A64 is included, because A31 and A23 PRCM is=
 a MFD, and I have no hackable device with A83T.

The most complex PRCMs (that we know of) are the A80 and the A83T.
Some code can be found for A33 and A64. I cannot find where I got
the information for the A23. I probably assumed it was similar to
the A31.

The parts we know that are constant across SoCs are the register
offsets for the CPUS, APBS, APBS bus gates and reset controls.
The APBS divider is slightly different. Offsets for the gates
and reset controls are fairly standardized, except for the trusted
watchdog on the A80. We can treat the A80 as the canonical source
of possible peripheral gates if you want to do a single driver
for all SoCs.

Also the A8X chips have extra muxes for osc24M not available on
other chips. This should be made available for the main CCU on
them.

As for the ones that already have an MFD binding, it is possible
to support it even with the new driver. It's just going to be
messy as hell.


Regards
ChenYu

>
>>
>> > We should only make it sunxi-ng until it's fully discovered (all
>> > functions in CPUs are functional).
>>
>> No, I expect that by 4.12 we have converted every users to sunxi-ng,
>> PRCM included.
>>
>> Maxime
>>
>> --
>> Maxime Ripard, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
