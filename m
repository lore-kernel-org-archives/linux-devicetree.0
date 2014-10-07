Return-Path: <darshanapadmadas@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20141007123514.GP24725@leverpostej>
References: <1412682308-8784-1-git-send-email-darshanapadmadas@gmail.com>
	<11076749.g7xZQflTCQ@wuerfel>
	<20141007120812.GJ24725@leverpostej>
	<8401228.DSnFf2fgRn@wuerfel>
	<20141007123514.GP24725@leverpostej>
Date: Tue, 7 Oct 2014 19:17:34 +0530
Message-ID: <CAEZObdLz-77b41tE=TLb0iFyhOsAyW+UV7YfAyFbMYRBJvRwTg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arch: arm: boot: dts: Added correct vendor-prefix
 with device name to compatible property
From: Darshana Padmadas <darshanapadmadas@gmail.com>
Content-Type: multipart/alternative; boundary=089e013c6b8e1035b60504d571c2
To: Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--089e013c6b8e1035b60504d571c2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

So we stick to using just the new string, right? Any more changes to this
patch ?

On Tue, Oct 7, 2014 at 6:05 PM, Mark Rutland <mark.rutland@arm.com> wrote:

> On Tue, Oct 07, 2014 at 01:31:23PM +0100, Arnd Bergmann wrote:
> > On Tuesday 07 October 2014 13:08:12 Mark Rutland wrote:
> > > On Tue, Oct 07, 2014 at 12:49:02PM +0100, Arnd Bergmann wrote:
> > > > On Tuesday 07 October 2014 17:15:08 Darshana Padmadas wrote:
> > > > >                 /* ALS and Proximity sensor */
> > > > >                 isl29028@44 {
> > > > > -                       compatible =3D "isil,isl29028";
> > > > > +                       compatible =3D "isl,isl29028";
> > > > >                         reg =3D <0x44>;
> > > > >                         interrupt-parent =3D <&gpio>;
> > > > >                         interrupts =3D <TEGRA_GPIO(L, 0)
> IRQ_TYPE_LEVEL_HIGH>;
> > > > >
> > > >
> > > > Does this intentionally list only the new string?
> > > >
> > > > If we want compatibility between new dts files and old kernels, thi=
s
> would
> > > > need to be
> > > >
> > > >       compatible =3D "isl,isl29028", compatible =3D "isil,isl29028"=
;
> > >
> > > Are we aiming for new dts wto work with old kernels? It's nice if the=
y
> > > do, but I don't think it should be necessary. Old DTBs should
> definitely
> > > work with a new kernel, though.
> > >
> > > Personally I'd rather see one string (preferably the canonical one, b=
ut
> > > the deprecated one is ok) than two strings when those strings are for
> > > the exact same device.
> > >
> >
> > Ok, fair enough. I think we should have the new name in dts files
> > normally then, in order to avoid spreading the mistake further when
> > someone copies it.
>
> Sounds good to me.
>
> Mark.
>



--=20

Regards
Darshana Padmadas <http://darshanapadmadas.wordpress.com>
=E0=A4=9C=E0=A5=8D=E0=A4=9E=E0=A4=BE=E0=A4=A8=E0=A4=82 =E0=A4=AA=E0=A4=B0=
=E0=A4=AE=E0=A4=82 =E0=A4=A7=E0=A5=8D=E0=A4=AF=E0=A5=87=E0=A4=AF=E0=A4=AE=
=E0=A5=8D

--089e013c6b8e1035b60504d571c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So we stick to using just the new string, right? Any more =
changes to this patch ?<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, Oct 7, 2014 at 6:05 PM, Mark Rutland <span dir=3D"=
ltr">&lt;<a href=3D"mailto:mark.rutland@arm.com" target=3D"_blank">mark.rut=
land@arm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"HOEnZb"><div class=3D"h5">On Tue, Oct 07, 2014 at 01:31:23PM +0100,=
 Arnd Bergmann wrote:<br>
&gt; On Tuesday 07 October 2014 13:08:12 Mark Rutland wrote:<br>
&gt; &gt; On Tue, Oct 07, 2014 at 12:49:02PM +0100, Arnd Bergmann wrote:<br=
>
&gt; &gt; &gt; On Tuesday 07 October 2014 17:15:08 Darshana Padmadas wrote:=
<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* ALS and Proximity sensor */<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0isl29028@44 {<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;isil,isl29028&quot;;<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;isl,isl29028&quot;;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x44&gt;;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D &lt;&amp;gpio&gt;;<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;TEGRA_GPIO(L, 0) IRQ_T=
YPE_LEVEL_HIGH&gt;;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Does this intentionally list only the new string?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If we want compatibility between new dts files and old kerne=
ls, this would<br>
&gt; &gt; &gt; need to be<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;isl,isl29028&=
quot;, compatible =3D &quot;isil,isl29028&quot;;<br>
&gt; &gt;<br>
&gt; &gt; Are we aiming for new dts wto work with old kernels? It&#39;s nic=
e if they<br>
&gt; &gt; do, but I don&#39;t think it should be necessary. Old DTBs should=
 definitely<br>
&gt; &gt; work with a new kernel, though.<br>
&gt; &gt;<br>
&gt; &gt; Personally I&#39;d rather see one string (preferably the canonica=
l one, but<br>
&gt; &gt; the deprecated one is ok) than two strings when those strings are=
 for<br>
&gt; &gt; the exact same device.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Ok, fair enough. I think we should have the new name in dts files<br>
&gt; normally then, in order to avoid spreading the mistake further when<br=
>
&gt; someone copies it.<br>
<br>
</div></div>Sounds good to me.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark.<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr"><span style=3D"line-height:1.6em"><br>Regards <br><a href=3D"http:=
//darshanapadmadas.wordpress.com" target=3D"_blank">Darshana Padmadas</a></=
span><div><span style=3D"color:rgb(51,51,51);font-family:Georgia,Times,&#39=
;Times New Roman&#39;,serif;font-size:15px;line-height:21px">=E0=A4=9C=E0=
=A5=8D=E0=A4=9E=E0=A4=BE=E0=A4=A8=E0=A4=82 =E0=A4=AA=E0=A4=B0=E0=A4=AE=E0=
=A4=82 =E0=A4=A7=E0=A5=8D=E0=A4=AF=E0=A5=87=E0=A4=AF=E0=A4=AE=E0=A5=8D=C2=
=A0</span><br></div></div>
</div>

--089e013c6b8e1035b60504d571c2--
