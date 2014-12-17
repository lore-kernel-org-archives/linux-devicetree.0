From: Liu Ying <liu.y.victor@gmail.com>
Subject: Re: [PATCH RFC 12/15] ARM: dts: imx6qdl-sabresd: Add support for
 TRULY TFT480800-16-E MIPI DSI panel
Date: Wed, 17 Dec 2014 18:35:47 +0800
Message-ID: <CA+8Hj82=ovsB58dqOPgfgzPBWiPz53+d_4BZRnYkH1fpCEkdhA@mail.gmail.com>
References: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
 <1418200648-32656-13-git-send-email-Ying.Liu@freescale.com>
 <20141210140751.GF23558@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0086111149=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141210140751.GF23558@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, mturquette@linaro.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0086111149==
Content-Type: multipart/alternative; boundary=001a11349a92e5f76b050a670954

--001a11349a92e5f76b050a670954
Content-Type: text/plain; charset=UTF-8

2014-12-10 22:07 GMT+08:00 Thierry Reding <thierry.reding@gmail.com>:
>
> On Wed, Dec 10, 2014 at 04:37:25PM +0800, Liu Ying wrote:
> [...]
> > diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> [...]
> > +&mipi_dsi {
> > +     status = "okay";
> > +
> > +     panel@0 {
> > +             compatible = "himax,hx8369a-dsi";
> > +             reg = <0>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_mipi_panel>;
> > +             reset-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> > +             reset-delay = <120>;
> > +             bs2-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
> > +             data-lanes = <2>;
> > +             panel-width-mm = <45>;
> > +             panel-height-mm = <76>;
> > +             bs = <10>;
> > +             status = "okay";
> > +
> > +             display-timings {
> > +                     native-mode = <&timing1>;
> > +                     timing1: truly-tft480800-16-e {
>
> This is the only place where Truly is mentioned. The panel vendor is
> either Truly or it is Himax, it can't be a mix. From this example and
> your patch description it seems like Truly is the manufacturer of the
> panel, hence the panel compatible should really be:
>
>         compatible = "truly,tft480800-16-e";
>

May I change the compatible string to be '"truly,tft480800-16-e-dsi"?
This way, the dsi driver may match the dsi device.


>
> That it uses an HX8369A chip internally is really secondary, at least
> regarding the binding. If we ever get need to support multiple panels
> with the same driver IC the proper solution would be to abstract that
> code out into a helper library that is used from the various panel
> drivers.
>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--001a11349a92e5f76b050a670954
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2014-12-10 22:07 GMT+08:00 Thierry Reding <span dir=3D"ltr">&lt;<a href=
=3D"mailto:thierry.reding@gmail.com" target=3D"_blank">thierry.reding@gmail=
.com</a>&gt;</span>:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Dec 10, 2014 at =
04:37:25PM +0800, Liu Ying wrote:<br>
[...]<br>
&gt; diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dt=
s/imx6qdl-sabresd.dtsi<br>
[...]<br>
<span class=3D"">&gt; +&amp;mipi_dsi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
himax,hx8369a-dsi&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &qu=
ot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&am=
p;pinctrl_mipi_panel&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset-gpios =3D &lt;&=
amp;gpio6 11 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset-delay =3D &lt;1=
20&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bs2-gpios =3D &lt;&am=
p;gpio6 14 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-lanes =3D &lt;2&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel-width-mm =3D &l=
t;45&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel-height-mm =3D &=
lt;76&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bs =3D &lt;10&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0display-timings {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0native-mode =3D &lt;&amp;timing1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0timing1: truly-tft480800-16-e {<br>
<br>
</span>This is the only place where Truly is mentioned. The panel vendor is=
<br>
either Truly or it is Himax, it can&#39;t be a mix. From this example and<b=
r>
your patch description it seems like Truly is the manufacturer of the<br>
panel, hence the panel compatible should really be:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;truly,tft480800-16-e&quot;=
;<br></blockquote><div><br></div><div>May I change the compatible string to=
 be &#39;&quot;truly,tft480800-16-e-dsi&quot;?</div><div>This way, the dsi =
driver may match the dsi device.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
That it uses an HX8369A chip internally is really secondary, at least<br>
regarding the binding. If we ever get need to support multiple panels<br>
with the same driver IC the proper solution would be to abstract that<br>
code out into a helper library that is used from the various panel<br>
drivers.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Thierry<br>
</font></span><br>_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>=
</blockquote></div>
</div></div>

--001a11349a92e5f76b050a670954--

--===============0086111149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0086111149==--
