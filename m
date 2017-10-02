From: Marco Frank <marcofrk@gmail.com>
Subject: Re: [PATCH] dt-bindings: fsl-imx-drm: Remove incorrect "@di0" usage
Date: Mon, 2 Oct 2017 10:24:24 -0300
Message-ID: <CAM4PwSUTLgWsCKZ7U+71Qb5URw5yFvhiyjT5zi2j0ERDy2FKJQ@mail.gmail.com>
References: <1506103553-31366-1-git-send-email-marco.franchi@nxp.com>
 <1506947253.9752.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0725220834=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1506947253.9752.3.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Marco Franchi <marco.franchi@nxp.com>
List-Id: devicetree@vger.kernel.org

--===============0725220834==
Content-Type: multipart/alternative; boundary="f403043e26e41b82d1055a904bd3"

--f403043e26e41b82d1055a904bd3
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

2017-10-02 9:27 GMT-03:00 Philipp Zabel <p.zabel@pengutronix.de>:

> Hi Marco,
>
> On Fri, 2017-09-22 at 15:05 -0300, Marco Franchi wrote:
> > Improve the binding example by removing the '@di0' notation, which
> > fixes the following build warning:
> >
> > Warning (unit_address_vs_reg): Node /display@di0 has a unit name, but
> > no reg property
> >
> > Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-
> > drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-
> > drm.txt
> > index f798547..44814f0 100644
> > --- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> > @@ -129,7 +129,7 @@ Optional properties:
> >
> >  example:
> >
> > -display@di0 {
> > +display-di0 {
> >       compatible = "fsl,imx-parallel-display";
> >       edid = [edid-data];
> >       interface-pix-fmt = "rgb24";
>
> Thank you for the patch. We certainly should get rid of the @di0
> notation. Since these nodes mostly describe the DISP0 and DISP1 pin
> groups controlled by the IOMUXC, I'd prefer to rename this to
>
> -display@di0 {
> +disp0 {
>
> instead, if that is fine with you.
>
Its sounds good to me. Can you change this or do you prefer I send a v2?

>
> I'd also like to move the disp0/disp1 nodes into the SoC dtsi files to
> avoid having to duplicate port@0 all over the place.
>
I agree and I can help with this too.

>
> regards
> Philipp
>
Best

Marco

--f403043e26e41b82d1055a904bd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philipp,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2017-10-02 9:27 GMT-03:00 Philipp Zabel <span dir=3D"ltr">=
&lt;<a href=3D"mailto:p.zabel@pengutronix.de" target=3D"_blank">p.zabel@pen=
gutronix.de</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Marco,<br>
<span class=3D""><br>
On Fri, 2017-09-22 at 15:05 -0300, Marco Franchi wrote:<br>
&gt; Improve the binding example by removing the &#39;@di0&#39; notation, w=
hich<br>
&gt; fixes the following build warning:<br>
&gt;<br>
&gt; Warning (unit_address_vs_reg): Node /display@di0 has a unit name, but=
=C2=A0<br>
&gt; no reg property<br>
&gt;<br>
&gt; Signed-off-by: Marco Franchi &lt;<a href=3D"mailto:marco.franchi@nxp.c=
om">marco.franchi@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0Documentation/devicetree/<wbr>bindings/display/imx/fsl-imx-<wbr>=
drm.txt | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/display/imx/fsl-im=
x-<br>
&gt; drm.txt b/Documentation/devicetree/<wbr>bindings/display/imx/fsl-imx-<=
br>
&gt; drm.txt<br>
&gt; index f798547..44814f0 100644<br>
&gt; --- a/Documentation/devicetree/<wbr>bindings/display/imx/fsl-imx-<wbr>=
drm.txt<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/display/imx/fsl-imx-<wbr>=
drm.txt<br>
&gt; @@ -129,7 +129,7 @@ Optional properties:<br>
&gt; =C2=A0<br>
&gt; =C2=A0example:<br>
&gt; =C2=A0<br>
&gt; -display@di0 {<br>
&gt; +display-di0 {<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;fsl,imx-parallel-displa=
y&quot;;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0edid =3D [edid-data];<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0interface-pix-fmt =3D &quot;rgb24&quot;;<br>
<br>
</span>Thank you for the patch.=C2=A0We certainly should get rid of the @di=
0<br>
notation. Since these nodes mostly describe the DISP0 and DISP1 pin<br>
groups controlled by the IOMUXC, I&#39;d prefer to rename this to<br>
<br>
-display@di0 {<br>
+disp0 {<br>
<br>
instead, if that is fine with you.<br></blockquote><div>Its sounds good to =
me. Can you change this or do you prefer I send a v2?<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
I&#39;d also like to move the disp0/disp1 nodes into the SoC dtsi files to<=
br>
avoid having to duplicate port@0 all over the place.<br></blockquote><div>I=
 agree and I can help with this too.</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
regards<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Philipp<br>
</font></span></blockquote></div>Best</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Marco</div></div>

--f403043e26e41b82d1055a904bd3--

--===============0725220834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0725220834==--
