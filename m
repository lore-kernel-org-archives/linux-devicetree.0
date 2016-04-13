Return-Path: <sergio.prado@e-labworks.com>
MIME-Version: 1.0
In-Reply-To: <570D0103.3080807@mentor.com>
References: <1460420743-30883-1-git-send-email-sergio.prado@e-labworks.com> <570D0103.3080807@mentor.com>
From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 13 Apr 2016 16:08:06 -0300
Message-ID: <CANu7NGvSk-Z2Orpsxynygi+V9-FsXWoQchiYwv0QF-TuDkFq3w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx6: Add dts for Embest MarS Board
Content-Type: multipart/alternative; boundary=94eb2c0b927c920695053062805b
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk, shawnguo@kernel.org, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c0b927c920695053062805b
Content-Type: text/plain; charset=UTF-8

Hi Vladimir,

Thanks for reviewing the patch.

> > +     leds {
> > +             compatible = "gpio-leds";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_led>;
> > +
> > +             led@1 {
>
> the outcome of one recent discussion is that a unit-address component of
> the name is used only if there is a reg property, which is not the case
> here.

Right, I'll remove the unit-address.

> > +                     label = "imx6:green:user1";
> > +                     gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
> > +                     default-state = "off";
> > +                     linux,default-trigger = "heartbeat";
> > +             };
> > +
> > +             led@2 {
>
> Same as above.

OK.

> > +};
> > +
> > +&iomuxc {
> > +     imx6-riotboard {
>
> Copy pasted board name?

Yes, my mistake. I'll fix it and send V3.

> With best wishes,
> Vladimir

Best regards,

Sergio Prado

--94eb2c0b927c920695053062805b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vladimir,<div><br></div><div>Thanks for reviewing the p=
atch.</div><div><br>&gt; &gt; + =C2=A0 =C2=A0 leds {<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;gpio-leds&quot;;<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &q=
uot;default&quot;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 pinctrl-0 =3D &lt;&amp;pinctrl_led&gt;;<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led@1 {<br>&gt;<br>&gt; the outcome =
of one recent discussion is that a unit-address component of<br>&gt; the na=
me is used only if there is a reg property, which is not the case<br>&gt; h=
ere.</div><div><br></div><div>Right, I&#39;ll remove the=C2=A0unit-address.=
</div><div><br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;imx6:green:user1&quot;;<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpi=
os =3D &lt;&amp;gpio5 2 GPIO_ACTIVE_LOW&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default-state =3D &=
quot;off&quot;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux,default-trigger =3D &quot;heartbeat&quot;=
;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>&gt; &gt; =
+<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led@2 {<br>&gt;<=
br>&gt; Same as above.</div><div><br></div><div>OK.</div><div><br>&gt; &gt;=
 +};<br>&gt; &gt; +<br>&gt; &gt; +&amp;iomuxc {<br>&gt; &gt; + =C2=A0 =C2=
=A0 imx6-riotboard {<br>&gt;<br>&gt; Copy pasted board name?</div><div><br>=
</div><div>Yes, my mistake. I&#39;ll fix it and send V3.</div><div><br>&gt;=
 With best wishes,<br>&gt; Vladimir</div><div><br></div><div>Best regards,<=
/div><div><br></div><div>Sergio Prado</div></div>

--94eb2c0b927c920695053062805b--
