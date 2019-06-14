Return-Path: <SRS0=8nFa=UN=gmail.com=xieqinick@kernel.org>
MIME-Version: 1.0
References: <1559035267-1884-1-git-send-email-xieqinick@gmail.com>
 <4566563.QzcLDyM7tj@phil> <CAP4nuTUQZRG9yV1Bz2hpe10K3CrWhVWf_YYBnMs3O1KyahhrMw@mail.gmail.com>
 <1719008.LxYQEzyXAE@diego>
In-Reply-To: <1719008.LxYQEzyXAE@diego>
From: Nick Xie <xieqinick@gmail.com>
Date: Fri, 14 Jun 2019 22:06:19 +0800
Message-ID: <CAP4nuTWLMTnbsT0WFLzX+HEY_W2_m+JyJ16cwkcWyTaKBJiAWA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add support for Khadas
 Edge/Edge-V/Captain boards
Content-Type: multipart/alternative; boundary="0000000000004134c8058b4927ba"
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, nick@khadas.com
List-ID: <devicetree@vger.kernel.org>

--0000000000004134c8058b4927ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome, thanks!

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2019=E5=B9=B46=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8810:01=E5=86=99=E9=81=93=EF=BC=9A

> Hi Nick,
>
> Am Freitag, 14. Juni 2019, 15:32:11 CEST schrieb Nick Xie:
> > Thanks, I'll check them out.
> >
> > But there is a small typo:
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/=
tree/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi?h=3Dv5.3-armsoc/d=
ts64&id=3D910249897d13beaa0b46069e27139024cd77e916#n299
> >
> > *22 (GPIO1_C6)* should be *RK_PC6* NOT *RK_PD6*.
>
> thanks for double-checking ... I've updated the commit to use the right
> gpio now.
>
> Heiko
>
> >
> > Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2019=E5=B9=B46=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:32=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > Am Montag, 10. Juni 2019, 09:57:53 CEST schrieb xieqinick@gmail.com:
> > > > From: Nick Xie <nick@khadas.com>
> > > >
> > > > Add devicetree support for Khadas Edge/Edge-V/Captain boards.
> > > > Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.
> > > > Khadas Captain is the carrier board for Khadas Edge.
> > > > Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.
> > > >
> > > > Signed-off-by: Nick Xie <nick@khadas.com>
> > >
> > > applied for 5.3 after doing some style-fixes to the edge.dtsi
> > > (2 missing gpio constants, some newlines and sdio-regulator
> > > references were missing "<..>")
> > >
> > > Please double-check the result
> > >
> > >
> > > Thanks
> > > Heiko
> > >
> > >
> > >
>
>
>
>
>

--0000000000004134c8058b4927ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome, thanks!=C2=A0<br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Heiko St=C3=BCbner &lt;<a href=
=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>&gt; =E4=BA=8E2019=E5=B9=B46=
=E6=9C=8814=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8810:01=E5=86=99=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Nick,<br>
<br>
Am Freitag, 14. Juni 2019, 15:32:11 CEST schrieb Nick Xie:<br>
&gt; Thanks, I&#39;ll check them out.<br>
&gt; <br>
&gt; But there is a small typo:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux=
-rockchip.git/tree/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi?h=
=3Dv5.3-armsoc/dts64&amp;id=3D910249897d13beaa0b46069e27139024cd77e916#n299=
" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux=
/kernel/git/mmind/linux-rockchip.git/tree/arch/arm64/boot/dts/rockchip/rk33=
99-khadas-edge.dtsi?h=3Dv5.3-armsoc/dts64&amp;id=3D910249897d13beaa0b46069e=
27139024cd77e916#n299</a><br>
&gt; <br>
&gt; *22 (GPIO1_C6)* should be *RK_PC6* NOT *RK_PD6*.<br>
<br>
thanks for double-checking ... I&#39;ve updated the commit to use the right=
 gpio now.<br>
<br>
Heiko<br>
<br>
&gt; <br>
&gt; Heiko Stuebner &lt;<a href=3D"mailto:heiko@sntech.de" target=3D"_blank=
">heiko@sntech.de</a>&gt; =E4=BA=8E2019=E5=B9=B46=E6=9C=8814=E6=97=A5=E5=91=
=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:32=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt; <br>
&gt; &gt; Am Montag, 10. Juni 2019, 09:57:53 CEST schrieb <a href=3D"mailto=
:xieqinick@gmail.com" target=3D"_blank">xieqinick@gmail.com</a>:<br>
&gt; &gt; &gt; From: Nick Xie &lt;<a href=3D"mailto:nick@khadas.com" target=
=3D"_blank">nick@khadas.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Add devicetree support for Khadas Edge/Edge-V/Captain boards=
.<br>
&gt; &gt; &gt; Khadas Edge is an expandable Rockchip RK3399 board with gold=
finger.<br>
&gt; &gt; &gt; Khadas Captain is the carrier board for Khadas Edge.<br>
&gt; &gt; &gt; Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 bo=
ard.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Nick Xie &lt;<a href=3D"mailto:nick@khadas.co=
m" target=3D"_blank">nick@khadas.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; applied for 5.3 after doing some style-fixes to the edge.dtsi<br>
&gt; &gt; (2 missing gpio constants, some newlines and sdio-regulator<br>
&gt; &gt; references were missing &quot;&lt;..&gt;&quot;)<br>
&gt; &gt;<br>
&gt; &gt; Please double-check the result<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt; Heiko<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004134c8058b4927ba--
