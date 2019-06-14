Return-Path: <SRS0=8nFa=UN=gmail.com=xieqinick@kernel.org>
MIME-Version: 1.0
References: <1559035267-1884-1-git-send-email-xieqinick@gmail.com>
 <1560153473-17190-1-git-send-email-xieqinick@gmail.com> <4566563.QzcLDyM7tj@phil>
In-Reply-To: <4566563.QzcLDyM7tj@phil>
From: Nick Xie <xieqinick@gmail.com>
Date: Fri, 14 Jun 2019 21:32:11 +0800
Message-ID: <CAP4nuTUQZRG9yV1Bz2hpe10K3CrWhVWf_YYBnMs3O1KyahhrMw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add support for Khadas
 Edge/Edge-V/Captain boards
Content-Type: multipart/alternative; boundary="00000000000023b5b0058b48ad50"
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, nick@khadas.com
List-ID: <devicetree@vger.kernel.org>

--00000000000023b5b0058b48ad50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I'll check them out.

But there is a small typo:
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/tr=
ee/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi?h=3Dv5.3-armsoc/dts=
64&id=3D910249897d13beaa0b46069e27139024cd77e916#n299

*22 (GPIO1_C6)* should be *RK_PC6* NOT *RK_PD6*.

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2019=E5=B9=B46=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:32=E5=86=99=E9=81=93=EF=BC=9A

> Am Montag, 10. Juni 2019, 09:57:53 CEST schrieb xieqinick@gmail.com:
> > From: Nick Xie <nick@khadas.com>
> >
> > Add devicetree support for Khadas Edge/Edge-V/Captain boards.
> > Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.
> > Khadas Captain is the carrier board for Khadas Edge.
> > Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.
> >
> > Signed-off-by: Nick Xie <nick@khadas.com>
>
> applied for 5.3 after doing some style-fixes to the edge.dtsi
> (2 missing gpio constants, some newlines and sdio-regulator
> references were missing "<..>")
>
> Please double-check the result
>
>
> Thanks
> Heiko
>
>
>

--00000000000023b5b0058b48ad50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I&#39;ll check them out.=C2=A0<br><div><br></div><=
div>But there is a small typo:=C2=A0<a href=3D"https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip.git/tree/arch/arm64/boot/dts/rockc=
hip/rk3399-khadas-edge.dtsi?h=3Dv5.3-armsoc/dts64&amp;id=3D910249897d13beaa=
0b46069e27139024cd77e916#n299">https://git.kernel.org/pub/scm/linux/kernel/=
git/mmind/linux-rockchip.git/tree/arch/arm64/boot/dts/rockchip/rk3399-khada=
s-edge.dtsi?h=3Dv5.3-armsoc/dts64&amp;id=3D910249897d13beaa0b46069e27139024=
cd77e916#n299</a></div><div><br></div><div><b>22 (GPIO1_C6)</b> should be=
=C2=A0<span style=3D"color:rgb(0,0,0);font-size:13.3333px"><b>RK_PC6</b></s=
pan>=C2=A0NOT=C2=A0<span style=3D"color:rgb(0,0,0);font-size:13.3333px"><b>=
RK_PD6</b></span>.=C2=A0<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Heiko Stuebner &lt;<a href=3D"mailto:heik=
o@sntech.de">heiko@sntech.de</a>&gt; =E4=BA=8E2019=E5=B9=B46=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:32=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am Montag, 10. J=
uni 2019, 09:57:53 CEST schrieb <a href=3D"mailto:xieqinick@gmail.com" targ=
et=3D"_blank">xieqinick@gmail.com</a>:<br>
&gt; From: Nick Xie &lt;<a href=3D"mailto:nick@khadas.com" target=3D"_blank=
">nick@khadas.com</a>&gt;<br>
&gt; <br>
&gt; Add devicetree support for Khadas Edge/Edge-V/Captain boards.<br>
&gt; Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.<br=
>
&gt; Khadas Captain is the carrier board for Khadas Edge.<br>
&gt; Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.<br>
&gt; <br>
&gt; Signed-off-by: Nick Xie &lt;<a href=3D"mailto:nick@khadas.com" target=
=3D"_blank">nick@khadas.com</a>&gt;<br>
<br>
applied for 5.3 after doing some style-fixes to the edge.dtsi<br>
(2 missing gpio constants, some newlines and sdio-regulator<br>
references were missing &quot;&lt;..&gt;&quot;)<br>
<br>
Please double-check the result<br>
<br>
<br>
Thanks<br>
Heiko<br>
<br>
<br>
</blockquote></div>

--00000000000023b5b0058b48ad50--
