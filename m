From: sanjeev sharma <sanjeevsharmaengg@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Support for LG lp120up1 panel with eDP
 input
Date: Mon, 22 Feb 2016 16:42:54 +0530
Message-ID: <CAGUYZuSsrneg8zQ0Ro8z5C469A2D-TOKpONECxWdoM6T+xNAeg@mail.gmail.com>
References: <1456138904-15258-1-git-send-email-jitao.shi@mediatek.com>
 <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0734283569=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

--===============0734283569==
Content-Type: multipart/alternative; boundary=089e0116169c111879052c59ea89

--089e0116169c111879052c59ea89
Content-Type: text/plain; charset=UTF-8

Hello Jitao,

Can't we add this panel information in device tree file instead inside the
device driver ?

Regards
Sanjeev Sharma

On Mon, Feb 22, 2016 at 4:31 PM, Jitao Shi <jitao.shi@mediatek.com> wrote:

> The LG lp120up1 TFT LCD panel with eDP interface is a 12.0" 1920x1280
> panel, which can be supported by the simple panel driver
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes since v1:
>  - Add eDP panel type in comment msg
>  - Fixed comment msg with 72 characters width
> ---
>  drivers/gpu/drm/panel/panel-simple.c |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> index f88a631..2030c37 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -982,6 +982,29 @@ static const struct panel_desc lg_lb070wv8 = {
>         .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  };
>
> +static const struct drm_display_mode lg_lp120up1_mode = {
> +       .clock = 162300,
> +       .hdisplay = 1920,
> +       .hsync_start = 1920 + 40,
> +       .hsync_end = 1920 + 40 + 40,
> +       .htotal = 1920 + 40 + 40+ 80,
> +       .vdisplay = 1280,
> +       .vsync_start = 1280 + 4,
> +       .vsync_end = 1280 + 4 + 4,
> +       .vtotal = 1280 + 4 + 4 + 12,
> +       .vrefresh = 60,
> +};
> +
> +static const struct panel_desc lg_lp120up1 = {
> +       .modes = &lg_lp120up1_mode,
> +       .num_modes = 1,
> +       .bpc = 8,
> +       .size = {
> +               .width = 267,
> +               .height = 183,
> +       },
> +};
> +
>  static const struct drm_display_mode lg_lp129qe_mode = {
>         .clock = 285250,
>         .hdisplay = 2560,
> @@ -1256,6 +1279,9 @@ static const struct of_device_id platform_of_match[]
> = {
>                 .compatible = "lg,lb070wv8",
>                 .data = &lg_lb070wv8,
>         }, {
> +               .compatible = "lg,lp120up1",
> +               .data = &lg_lp120up1,
> +       }, {
>                 .compatible = "lg,lp129qe",
>                 .data = &lg_lp129qe,
>         }, {
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--089e0116169c111879052c59ea89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><span style=3D"font-family:verdana,sans-ser=
if">Hello Jitao,<br><br></span></div><span style=3D"font-family:verdana,san=
s-serif">Can&#39;t we add this panel information in device tree file instea=
d inside the device driver ?<br><br></span></div><span style=3D"font-family=
:verdana,sans-serif">Regards<br></span></div><span style=3D"font-family:ver=
dana,sans-serif">Sanjeev Sharma </span><br></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Mon, Feb 22, 2016 at 4:31 PM, Jitao Shi =
<span dir=3D"ltr">&lt;<a href=3D"mailto:jitao.shi@mediatek.com" target=3D"_=
blank">jitao.shi@mediatek.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">The LG lp120up1 TFT LCD panel with eDP interface is a 12.0&quot;=
 1920x1280<br>
panel, which can be supported by the simple panel driver<br>
<br>
Signed-off-by: Jitao Shi &lt;<a href=3D"mailto:jitao.shi@mediatek.com">jita=
o.shi@mediatek.com</a>&gt;<br>
---<br>
Changes since v1:<br>
=C2=A0- Add eDP panel type in comment msg<br>
=C2=A0- Fixed comment msg with 72 characters width<br>
---<br>
=C2=A0drivers/gpu/drm/panel/panel-simple.c |=C2=A0 =C2=A026 +++++++++++++++=
+++++++++++<br>
=C2=A01 file changed, 26 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c<br>
index f88a631..2030c37 100644<br>
--- a/drivers/gpu/drm/panel/panel-simple.c<br>
+++ b/drivers/gpu/drm/panel/panel-simple.c<br>
@@ -982,6 +982,29 @@ static const struct panel_desc lg_lb070wv8 =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG=
,<br>
=C2=A0};<br>
<br>
+static const struct drm_display_mode lg_lp120up1_mode =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 162300,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1920,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1920 + 40,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1920 + 40 + 40,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.htotal =3D 1920 + 40 + 40+ 80,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vdisplay =3D 1280,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_start =3D 1280 + 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 1280 + 4 + 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 1280 + 4 + 4 + 12,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vrefresh =3D 60,<br>
+};<br>
+<br>
+static const struct panel_desc lg_lp120up1 =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.modes =3D &amp;lg_lp120up1_mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_modes =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bpc =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D 267,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height =3D 183,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
=C2=A0static const struct drm_display_mode lg_lp129qe_mode =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .clock =3D 285250,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .hdisplay =3D 2560,<br>
@@ -1256,6 +1279,9 @@ static const struct of_device_id platform_of_match[] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;lg,lb070wv8&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;lg_l=
b070wv8,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &qu=
ot;lg,lp120up1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;lg_l=
p120up1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;lg,lp129qe&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;lg_l=
p129qe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listi=
nfo/linux-arm-kernel</a><br>
</font></span></blockquote></div><br></div>

--089e0116169c111879052c59ea89--

--===============0734283569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0734283569==--
