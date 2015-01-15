From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: Including empty regulator nodes in axp209.dtsi
 is a BAD idea
Date: Fri, 16 Jan 2015 00:48:53 +0800
Message-ID: <CAGb2v66Go1z-V8spwHvLHQC1R=vgDsk1nQ6iZWTsy+OMF1kK0w@mail.gmail.com>
References: <54B4E7B5.6060304@redhat.com> <20150113164606.GA4891@lukather> <5312007.HNApKlEIe7@x64.localnet>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCW736SQKGQEKJMTFHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5312007.HNApKlEIe7-01DtBWzyqXQXpj0+iOhflA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lars Doelle <lars.doelle-RMqqONVpFt+ELgA04lAiVw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2015 at 6:18 PM, Lars Doelle <lars.doelle-RMqqONVpFt+ELgA04lAiVw@public.gmane.org> wrote:
> On Tuesday, January 13, 2015 17:46:06 Maxime Ripard wrote:
>> On Tue, Jan 13, 2015 at 10:39:01AM +0100, Hans de Goede wrote:
>> > Hi ChenYu, Maxime,
>> >
>> > During the review of a few dts files for new boards Maxime asked me to use
>> > axp209.dtsi to avoid the standard axp209 "boilerplate" present in most
>> > boards using the axp209 pmic.
>> >
>> > But axp209.dtsi includes empty regulator nodes, e.g. :
>> >
>> >                 reg_dcdc3: dcdc3 {
>> >                         regulator-name = "dcdc3";
>> >                 };
>> >
>> > This is a BAD idea, the presence of these empty nodes causes the
>> > axp20x-regulator driver to actually register regulators for them,
>> > and then on late_init the regulator subsys turns them off, since
>> > they have absolutely no constraints set (nor users registered)
>> > and the regulator subsys assumes that when devicetree is used their
>> > is always a compete set of constraints and that thus turning them
>> > off is safe.
>> >
>> > So when I switched to using axp209.dtsi for the bananapro.dts,
>> > and booted the bananapro this is the last message I got from the
>> > kernel while booting:
>> >
>> > [    2.314014] dcdc3: disabling
>> >
>> > And away went our DRAM power-supply, oops.
>> >
>> > So for dcdc2 (CPU) and dcdc3 (DRAM), the boilerplate
>> > should contain reasonable constraints (eg the operating range
>> > from the datasheet)
>>
>> Indeed.
>
> It is very unclear to me, what to with this dtsi as it is.
>
> Wrt. axp209, I have a specification like in sun7i-a20-olinuxino-lime2.dts.
> If I include this dtsi, what does it help or how is it supposed to be of any
> use?
>
> In particular, the following section
>
> |                       axp209: pmic@34 {
> |                               compatible = "x-powers,axp209";
> |                               reg = <0x34>;
> |                               interrupt-parent = <&nmi_intc>;
> |                               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>
> |                               interrupt-controller;
> |                               #interrupt-cells = <1>;
>
> |                               acin-supply = <&reg_axp_ipsout>;
> |                               vin2-supply = <&reg_axp_ipsout>;
> |                               vin3-supply = <&reg_axp_ipsout>;
> |                               ldo24in-supply = <&reg_axp_ipsout>;
> |                               ldo3in-supply = <&reg_axp_ipsout>;

We should not be using reg_axp_ipsout, as it is an unregulated supply,
and can be left out.

>
> would be needed anyway as it is not in sun7i-a20.dtsi, followed by the
> regulators, to switch them on. Now a dtsi would make sense, if it shortens
> the device specific information.
>
> Should not the section above together with the full regulators be in axp209.dtsi
> and only the regulators be mentioned in the boards dts, to switch them on? Isn't
> this stuff that should be included in sun7i-a20.dtsi anyway, somehow?

It is entirely possible to make a board without using the PMIC, as Olimex
has demonstrated. sun7i-a20 only describes the common SoC bits.

ChenYu
