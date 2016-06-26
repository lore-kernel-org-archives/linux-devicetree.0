From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add BCM53125 Device Tree nodes
Date: Sun, 26 Jun 2016 10:26:43 -0700
Message-ID: <57701053.9090903@gmail.com>
References: <1465690459-30751-1-git-send-email-f.fainelli@gmail.com>
 <1465690459-30751-2-git-send-email-f.fainelli@gmail.com>
 <CAGb2v64u74cXG0R-MSMtDBxBpg2tFoifQwqbvWL-+3pG=GLVTQ@mail.gmail.com>
 <576F450B.3080207@gmail.com> <20160626080550.GG4000@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160626080550.GG4000@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 26/06/2016 01:05, Maxime Ripard a =C3=A9crit :
> Hi Florian,
>=20
> On Sat, Jun 25, 2016 at 07:59:23PM -0700, Florian Fainelli wrote:
>> Le 23/06/2016 22:48, Chen-Yu Tsai a =C3=A9crit :
>>>> diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/=
boot/dts/sun7i-a20-lamobo-r1.dts
>>>> index 5ee43d8bf174..697582397dcf 100644
>>>> --- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
>>>> +++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
>>>> @@ -110,13 +110,67 @@
>>>>  &gmac {
>>>>         pinctrl-names =3D "default";
>>>>         pinctrl-0 =3D <&gmac_pins_rgmii_a>;
>>>> -       phy =3D <&phy1>;
>>>>         phy-mode =3D "rgmii";
>>>>         phy-supply =3D <&reg_gmac_3v3>;
>>>>         status =3D "okay";
>>>>
>>>> -       phy1: ethernet-phy@1 {
>>>> -               reg =3D <1>;
>>>> +       fixed-link {
>>>> +               speed =3D <1000>;
>>>> +               full-duplex;
>>>> +       };
>>>> +
>>>> +       mdio1 {
>>>
>>> mdio will suffice.
>>
>> There is another label in sun7i-a20.dtsi named mdio which is for the
>> MDIO controller node matching allwinner,sun4i-a10-mdio, which is not=
 the
>> one we want here, we want the MDIO controller associated with the
>> Synopsys GMAC.
>=20
> Yes, but it's in a different node, and you're not using any labels, s=
o
> I don't really see how that would conflict.

=46air enough, I sent a v2 which uses "mdio-gmac" as a label, should I
respin a v3 which just uses "mdio"?

v2 is here;
http://www.spinics.net/lists/arm-kernel/msg514007.html
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
