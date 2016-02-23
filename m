From: sanjeev sharma <sanjeevsharmaengg@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Support for LG lp120up1 panel with eDP
 input
Date: Tue, 23 Feb 2016 10:45:01 +0530
Message-ID: <CAGUYZuSVghfC75eWihA82WxC8pF67mWKQMJ-95F2ezqMssyxfQ@mail.gmail.com>
References: <1456138904-15258-1-git-send-email-jitao.shi@mediatek.com>
 <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
 <CAGUYZuSsrneg8zQ0Ro8z5C469A2D-TOKpONECxWdoM6T+xNAeg@mail.gmail.com>
 <20160222114308.GA22505@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0299819680=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160222114308.GA22505@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>Sascha Hauer <kernel>
List-Id: devicetree@vger.kernel.org

--===============0299819680==
Content-Type: multipart/alternative; boundary=089e0116169c0d9caf052c69084b

--089e0116169c0d9caf052c69084b
Content-Type: text/plain; charset=UTF-8

Hello Thierry,

I am not agree here and how it would be redundant ?

please see lvds interface, where panel timing parameter is defined in the
Device Tree. If there are multiple display panel then we can create a
separate dtsi file and include in main Board dts file. I believe that, It
is simpler way to support multiple panel.

http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/arch/arm/boot/dts/imx6q-sabrelite.dts?h=imx_3.14.38_6qp_beta#n225

Regards
Sanjeev Sharma

On Mon, Feb 22, 2016 at 5:13 PM, Thierry Reding <thierry.reding@gmail.com>
wrote:

> On Mon, Feb 22, 2016 at 04:42:54PM +0530, sanjeev sharma wrote:
> > Hello Jitao,
> >
> > Can't we add this panel information in device tree file instead inside
> the
> > device driver ?
>
> We could, but that would be redundant. Panels need to be represented by
> a specific compatible string anyway, and that compatible string implies
> the video timings, bits-per-color, width and height.
>
> Also there's more to panels than just the timings or dimensions. Power
> up and power down sequences are also implied by the compatible stirng.
> Describing all of that in the device tree was at some point attempted,
> but in the end it turned out too complicated and we ended up with what
> we have now.
>
> Thierry
>
> > On Mon, Feb 22, 2016 at 4:31 PM, Jitao Shi <jitao.shi@mediatek.com>
> wrote:
> >
> > > The LG lp120up1 TFT LCD panel with eDP interface is a 12.0" 1920x1280
> > > panel, which can be supported by the simple panel driver
> > >
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > ---
> > > Changes since v1:
> > >  - Add eDP panel type in comment msg
> > >  - Fixed comment msg with 72 characters width
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c |   26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > b/drivers/gpu/drm/panel/panel-simple.c
> > > index f88a631..2030c37 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -982,6 +982,29 @@ static const struct panel_desc lg_lb070wv8 = {
> > >         .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > >  };
> > >
> > > +static const struct drm_display_mode lg_lp120up1_mode = {
> > > +       .clock = 162300,
> > > +       .hdisplay = 1920,
> > > +       .hsync_start = 1920 + 40,
> > > +       .hsync_end = 1920 + 40 + 40,
> > > +       .htotal = 1920 + 40 + 40+ 80,
> > > +       .vdisplay = 1280,
> > > +       .vsync_start = 1280 + 4,
> > > +       .vsync_end = 1280 + 4 + 4,
> > > +       .vtotal = 1280 + 4 + 4 + 12,
> > > +       .vrefresh = 60,
> > > +};
> > > +
> > > +static const struct panel_desc lg_lp120up1 = {
> > > +       .modes = &lg_lp120up1_mode,
> > > +       .num_modes = 1,
> > > +       .bpc = 8,
> > > +       .size = {
> > > +               .width = 267,
> > > +               .height = 183,
> > > +       },
> > > +};
> > > +
> > >  static const struct drm_display_mode lg_lp129qe_mode = {
> > >         .clock = 285250,
> > >         .hdisplay = 2560,
> > > @@ -1256,6 +1279,9 @@ static const struct of_device_id
> platform_of_match[]
> > > = {
> > >                 .compatible = "lg,lb070wv8",
> > >                 .data = &lg_lb070wv8,
> > >         }, {
> > > +               .compatible = "lg,lp120up1",
> > > +               .data = &lg_lp120up1,
> > > +       }, {
> > >                 .compatible = "lg,lp129qe",
> > >                 .data = &lg_lp129qe,
> > >         }, {
> > > --
> > > 1.7.9.5
> > >
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > >
>

--089e0116169c0d9caf052c69084b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><span style=3D"font-family:verdana,san=
s-serif">Hello Thierry,<br><br></span></div><span style=3D"font-family:verd=
ana,sans-serif">I am not agree here and how it would be redundant ? <br><br=
></span></div><span style=3D"font-family:verdana,sans-serif">please see lvd=
s interface, where panel timing parameter is defined in the Device Tree. If=
 there are multiple display panel then we can create a separate dtsi file a=
nd include in main Board dts file. I believe that, It is simpler way to sup=
port multiple panel. =C2=A0 <br><br><a href=3D"http://git.freescale.com/git=
/cgit.cgi/imx/linux-2.6-imx.git/tree/arch/arm/boot/dts/imx6q-sabrelite.dts?=
h=3Dimx_3.14.38_6qp_beta#n225">http://git.freescale.com/git/cgit.cgi/imx/li=
nux-2.6-imx.git/tree/arch/arm/boot/dts/imx6q-sabrelite.dts?h=3Dimx_3.14.38_=
6qp_beta#n225</a> <br><br></span></div><span style=3D"font-family:verdana,s=
ans-serif">Regards<br></span></div><span style=3D"font-family:verdana,sans-=
serif">Sanjeev Sharma </span><br><div><div><div><div><div><div><div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Feb 22, 2016 at =
5:13 PM, Thierry Reding <span dir=3D"ltr">&lt;<a href=3D"mailto:thierry.red=
ing@gmail.com" target=3D"_blank">thierry.reding@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"">=
On Mon, Feb 22, 2016 at 04:42:54PM +0530, sanjeev sharma wrote:<br>
&gt; Hello Jitao,<br>
&gt;<br>
&gt; Can&#39;t we add this panel information in device tree file instead in=
side the<br>
&gt; device driver ?<br>
<br>
</span>We could, but that would be redundant. Panels need to be represented=
 by<br>
a specific compatible string anyway, and that compatible string implies<br>
the video timings, bits-per-color, width and height.<br>
<br>
Also there&#39;s more to panels than just the timings or dimensions. Power<=
br>
up and power down sequences are also implied by the compatible stirng.<br>
Describing all of that in the device tree was at some point attempted,<br>
but in the end it turned out too complicated and we ended up with what<br>
we have now.<br>
<span class=3D""><font color=3D"#888888"><br>
Thierry<br>
</font></span><div class=3D""><div class=3D"h5"><br>
&gt; On Mon, Feb 22, 2016 at 4:31 PM, Jitao Shi &lt;<a href=3D"mailto:jitao=
.shi@mediatek.com">jitao.shi@mediatek.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; The LG lp120up1 TFT LCD panel with eDP interface is a 12.0&quot; =
1920x1280<br>
&gt; &gt; panel, which can be supported by the simple panel driver<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jitao Shi &lt;<a href=3D"mailto:jitao.shi@mediatek=
.com">jitao.shi@mediatek.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changes since v1:<br>
&gt; &gt;=C2=A0 - Add eDP panel type in comment msg<br>
&gt; &gt;=C2=A0 - Fixed comment msg with 72 characters width<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/panel/panel-simple.c |=C2=A0 =C2=A026 +++++=
+++++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 26 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/panel/panel-simple.c<br>
&gt; &gt; b/drivers/gpu/drm/panel/panel-simple.c<br>
&gt; &gt; index f88a631..2030c37 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/panel/panel-simple.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/panel/panel-simple.c<br>
&gt; &gt; @@ -982,6 +982,29 @@ static const struct panel_desc lg_lb070wv8 =
=3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bus_format =3D MEDIA_BUS_FMT_RG=
B888_1X7X4_SPWG,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static const struct drm_display_mode lg_lp120up1_mode =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 162300,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1920,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1920 + 40,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1920 + 40 + 40,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.htotal =3D 1920 + 40 + 40+ 80,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vdisplay =3D 1280,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_start =3D 1280 + 4,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 1280 + 4 + 4,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 1280 + 4 + 4 + 12,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vrefresh =3D 60,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct panel_desc lg_lp120up1 =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.modes =3D &amp;lg_lp120up1_mode,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_modes =3D 1,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.bpc =3D 8,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =
=3D 267,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height =
=3D 183,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static const struct drm_display_mode lg_lp129qe_mode =3D {<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 285250,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 2560,<br>
&gt; &gt; @@ -1256,6 +1279,9 @@ static const struct of_device_id platform_o=
f_match[]<br>
&gt; &gt; =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.com=
patible =3D &quot;lg,lb070wv8&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dat=
a =3D &amp;lg_lb070wv8,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatib=
le =3D &quot;lg,lp120up1&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D=
 &amp;lg_lp120up1,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.com=
patible =3D &quot;lg,lp129qe&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dat=
a =3D &amp;lg_lp129qe,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; &gt; --<br>
&gt; &gt; 1.7.9.5<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; linux-arm-kernel mailing list<br>
&gt; &gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm=
-kernel@lists.infradead.org</a><br>
&gt; &gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel" rel=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mai=
lman/listinfo/linux-arm-kernel</a><br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div></div></div></div></div></div></di=
v></div></div>

--089e0116169c0d9caf052c69084b--

--===============0299819680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0299819680==--
