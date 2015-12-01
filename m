From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH v2 04/10] drm/hisilicon: Add crtc funcs for ADE
Date: Tue, 1 Dec 2015 10:52:58 +0800
Message-ID: <CAGd==05rgVeTB52Cmj2yV93WpQhjvEeybjdPFYc_X3Ux7hZCxQ@mail.gmail.com>
References: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org>
 <1448707145-69348-5-git-send-email-xinliang.liu@linaro.org>
 <CACvgo50SD5dJ95rKSrbW1Zo3DRG9bWs2ZuDhfDC7UrZVMLSnJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1124720285=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACvgo50SD5dJ95rKSrbW1Zo3DRG9bWs2ZuDhfDC7UrZVMLSnJw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linuxarm@huawei.com, ML dri-devel <dri-devel@lists.freedesktop.org>, Xu Wei <xuwei5@hisilicon.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, zourongrong@huawei.com, Yiping Xu <xuyiping@hisilicon.com>, Jon Corbet <corbet@lwn.net>, Wang Fei <w.f@huawei.com>, lijianhua@huawei.com, devicetree@vger.kernel.org, Bintian Wang <bintian.wang@huawei.com>, Feng Chen <puck.chen@hisilicon.com>, LAKML <linux-arm-kernel@lists.infradead.org>, Andy Green <andy.green@linaro.org>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

--===============1124720285==
Content-Type: multipart/alternative; boundary=001a113b04e85f72030525cd41f1

--001a113b04e85f72030525cd41f1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 November 2015 at 23:56, Emil Velikov <emil.l.velikov@gmail.com> wrote=
:
=E2=80=8BHi Emil, thank you for review.=E2=80=8B

use_maskOn 28 November 2015 at 10:38, Xinliang Liu
> <xinliang.liu@linaro.org> wrote:
> > Add crtc funcs and helper funcs for ADE.
> >
> > Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> > Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > Signed-off-by: Andy Green <andy.green@linaro.org>
> > ---
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/hisilicon/hisi_ade_reg.h
>
> > +#define ADE_CTRL                       (0x4)
> > +#define ADE_CTRL1                      (0x8C)
> > +#define ADE_ROT_SRC_CFG                        (0x10)
> > +#define ADE_DISP_SRC_CFG               (0x18)
> > +#define ADE_WDMA2_SRC_CFG              (0x1C)
> > +#define ADE_SEC_OVLY_SRC_CFG           (0x20)
> > +#define ADE_WDMA3_SRC_CFG              (0x24)
> > +#define ADE_OVLY1_TRANS_CFG            (0x2C)
> > +#define ADE_EN                         (0x100)
> > +#define INTR_MASK_CPU_0                        (0xC10)
> > +#define INTR_MASK_CPU_1                        (0xC14)
> > +#define ADE_FRM_DISGARD_CTRL           (0xA4)
> > +/* reset and reload regs */
> > +#define ADE_SOFT_RST_SEL0              (0x78)
> > +#define ADE_SOFT_RST_SEL1              (0x7C)
> > +#define ADE_RELOAD_DIS0                        (0xAC)
> > +#define ADE_RELOAD_DIS1                        (0xB0)
> > +#define ADE_CH_RDMA_BIT_OFST           (0)
> > +#define ADE_CLIP_BIT_OFST              (15)
> > +#define ADE_SCL_BIT_OFST               (21)
> > +#define ADE_CTRAN_BIT_OFST             (24)
> > +#define ADE_OVLY_BIT_OFST              (37) /* 32+5 */
> Don't think we have any cases in drm where constants are wrapped in
> brackets. Is there any benefit of doing that here ?
>
Seems no any benefit=E2=80=8B, will remove these brackets in v3.


>
> > +/* channel regs */
> > +#define RD_CH_PE(x)                    (0x1000 + (x) * 0x80)
> ... and I'm not talking about cases where the macros such as this one.


> > +union U_LDI_CTRL {
> > +struct {
> > +       unsigned int    ldi_en                :1;
> > +       unsigned int    disp_mode_buf         :1;
> > +       unsigned int    date_gate_en          :1;
> > +       unsigned int    bpp                   :2;
> > +       unsigned int    wait_vsync_en         :1;
> > +       unsigned int    corlorbar_width       :7;
> > +       unsigned int    bgr                   :1;
> > +       unsigned int    color_mode            :1;
> > +       unsigned int    shutdown              :1;
> > +       unsigned int    vactive_line          :12;
> > +       unsigned int    ldi_en_self_clr       :1;
> > +       unsigned int    reserved_573          :3;
> > +       } bits;
> > +       unsigned int    u32;
> > +};
> > +
> > +union U_LDI_WORK_MODE {
> > +struct {
> > +       unsigned int    work_mode             :1;
> > +       unsigned int    wback_en              :1;
> > +       unsigned int    colorbar_en           :1;
> > +       unsigned int    reserved_577          :29;
> > +       } bits;
> > +       unsigned int    u32;
> > +};
> > +
> The struct in the above two unions is missing a level of indentation.
>
=E2=80=8Byes, will be fixed in v3.=E2=80=8B


>
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/hisilicon/hisi_drm_ade.c
>
> > +static void ade_ldi_set_mode(struct ade_crtc *acrtc,
> > +                            struct drm_display_mode *mode,
> > +                            struct drm_display_mode *adj_mode)
> > +{
> > +       struct ade_hw_ctx *ctx =3D acrtc->ctx;
> > +       void __iomem *base =3D ctx->base;
> > +       u32 out_w =3D mode->hdisplay;
> > +       u32 out_h =3D mode->vdisplay;
> > +       u32 hfp, hbp, hsw, vfp, vbp, vsw;
> > +       u32 plr_flags;
> > +       int ret;
> > +
> > +       plr_flags =3D (mode->flags & DRM_MODE_FLAG_NVSYNC)
> > +                       ? HISI_LDI_FLAG_NVSYNC : 0;
> > +       plr_flags |=3D (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > +                       ? HISI_LDI_FLAG_NHSYNC : 0;
> > +       hfp =3D mode->hsync_start - mode->hdisplay;
> > +       hbp =3D mode->htotal - mode->hsync_end;
> > +       hsw =3D mode->hsync_end - mode->hsync_start;
> > +       vfp =3D mode->vsync_start - mode->vdisplay;
> > +       vbp =3D mode->vtotal - mode->vsync_end;
> > +       vsw =3D mode->vsync_end - mode->vsync_start;
> > +       if (vsw > 15) {
> > +               DRM_INFO("vsw exceeded 15\n");
>
> DRM_ERROR or DRM_DEBUG_xx perhaps ?
>
This is not an error hardware still can handle if vsw exceed 15.
You are right maybe =E2=80=8B
=E2=80=8B
DRM_DEBUG_DRIVER is better.
=E2=80=8B

>
> > +               vsw =3D 15;
> > +       }
> > +
> > +       writel((hbp << 20) | (hfp << 0), base + LDI_HRZ_CTRL0);
> > +       /* p3-73 6220V100 pdf:
> > +        *  "The configured value is the actual width - 1"
> > +        */
> > +       writel(hsw - 1, base + LDI_HRZ_CTRL1);
> > +       writel((vbp << 20) | (vfp << 0), base + LDI_VRT_CTRL0);
> > +       /* p3-74 6220V100 pdf:
> > +        *  "The configured value is the actual width - 1"
> > +        */
> > +       writel(vsw - 1, base + LDI_VRT_CTRL1);
> > +
> > +       /* p3-75 6220V100 pdf:
> > +        *  "The configured value is the actual width - 1"
> > +        */
> > +       writel(((out_h - 1) << 20) | ((out_w - 1) << 0),
> > +              base + LDI_DSP_SIZE);
> > +       writel(plr_flags, base + LDI_PLR_CTRL);
> > +
> > +       ret =3D clk_set_rate(ctx->ade_pix_clk, mode->clock * 1000);
> > +       /* Success should be guaranteed in aotomic_check
> > +        * failer shouldn't happen here
> > +        */
> > +       if (ret)
> > +               DRM_ERROR("set ade_pixel_clk_rate fail\n");
> DItto
>
=E2=80=8Bwill use
=E2=80=8B
DRM_DEBUG_DRIVER
=E2=80=8B in v3.=E2=80=8B
=E2=80=8B


>
> > +       adj_mode->clock =3D clk_get_rate(ctx->ade_pix_clk) / 1000;
> > +
> > +       /* ctran6 setting */
> > +       writel(1, base + ADE_CTRAN_DIS(ADE_CTRAN6));
> > +       writel(out_w * out_h - 1, base +
> ADE_CTRAN_IMAGE_SIZE(ADE_CTRAN6));
> > +       acrtc->use_mask |=3D BIT(ADE_CTRAN_BIT_OFST + ADE_CTRAN6);
> > +       DRM_INFO("set mode: %dx%d\n", out_w, out_h);
> > +
> =E2=80=8B=E2=80=8B
> =E2=80=8B=E2=80=8B
> DRM_DEBUG_DRIVER ?
>
=E2=80=8B
will use
=E2=80=8B
DRM_DEBUG_DRIVER
=E2=80=8B in v3.
=E2=80=8B


>
> > +       /*
> > +        * other parameters setting
> > +        */
> > +       writel(BIT(0), base + LDI_WORK_MODE);
> > +       writel((0x3c << 6) | (ADE_OUT_RGB_888 << 3) | BIT(2) | BIT(0),
> > +              base + LDI_CTRL);
> > +       set_reg(base + LDI_DE_SPACE_LOW, 0x1, 1, 1);
> > +}
> > +
> > +static int ade_power_up(struct ade_hw_ctx *ctx)
> > +{
> > +       void __iomem *media_base =3D ctx->media_base;
> > +       int ret;
> > +
> > +       ret =3D clk_set_rate(ctx->ade_core_clk, ctx->ade_core_rate);
> > +       if (ret) {
> > +               DRM_ERROR("clk_set_rate ade_core_rate error\n");
> How about the following (or alike) less cryptic and more informative
> message. Other places could use a similar treatment.
>
> "Failed to set rate X clk (%d)\n", ret ?
>
=E2=80=8Byes, good advice. will be fixed in v3.
=E2=80=8B


>
>
> > +static void ade_crtc_enable(struct drm_crtc *crtc)
> > +{
> > +       struct ade_crtc *acrtc =3D to_ade_crtc(crtc);
> > +       struct ade_hw_ctx *ctx =3D acrtc->ctx;
> > +       int ret;
> > +
> > +       DRM_DEBUG_DRIVER("enter.\n");
> Does this and the remaining
> =E2=80=8B=E2=80=8B
> DEBUG_DRIVER(enter|exit) messages provide
> any meaningful input, past the driver
> =E2=80=8B=E2=80=8B
> development stage ?
>
> > +       if (acrtc->enable)
> > +               return;
> Esp. since we have cases like this where no message is available.
>
yeap, these
=E2=80=8B
 DEBUG_DRIVER(enter|exit) messages=E2=80=8B are for
=E2=80=8B
development stage.
Which forgot to be removed. will be removed in v3.

Thanks,
-xinliang


>
> Regards,
> Emil
>

--001a113b04e85f72030525cd41f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 28 November 2015 at 23:56, Emil Velikov <span dir=3D"ltr">&=
lt;<a href=3D"mailto:emil.l.velikov@gmail.com" target=3D"_blank">emil.l.vel=
ikov@gmail.com</a>&gt;</span> wrote:</div><div class=3D"gmail_quote"><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=E2=
=80=8BHi Emil, thank you for review.=E2=80=8B</div><br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">use=
_maskOn 28 November 2015 at 10:38, Xinliang Liu<br>
<span class=3D"">&lt;<a href=3D"mailto:xinliang.liu@linaro.org">xinliang.li=
u@linaro.org</a>&gt; wrote:<br>
&gt; Add crtc funcs and helper funcs for ADE.<br>
&gt;<br>
&gt; Signed-off-by: Xinliang Liu &lt;<a href=3D"mailto:xinliang.liu@linaro.=
org">xinliang.liu@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Xinwei Kong &lt;<a href=3D"mailto:kong.kongxinwei@hisil=
icon.com">kong.kongxinwei@hisilicon.com</a>&gt;<br>
&gt; Signed-off-by: Andy Green &lt;<a href=3D"mailto:andy.green@linaro.org"=
>andy.green@linaro.org</a>&gt;<br>
&gt; ---<br>
<br>
</span>&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/hisilicon/hisi_ade_reg.h<br>
<span class=3D""><br>
&gt; +#define ADE_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x4)<br>
&gt; +#define ADE_CTRL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (0x8C)<br>
&gt; +#define ADE_ROT_SRC_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x10)<br>
&gt; +#define ADE_DISP_SRC_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x18)<br>
&gt; +#define ADE_WDMA2_SRC_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1C)<br>
&gt; +#define ADE_SEC_OVLY_SRC_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x20)<br>
&gt; +#define ADE_WDMA3_SRC_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x24)<br>
&gt; +#define ADE_OVLY1_TRANS_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x2C)<br>
&gt; +#define ADE_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x100)<br>
&gt; +#define INTR_MASK_CPU_0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xC10)<br>
&gt; +#define INTR_MASK_CPU_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xC14)<br>
&gt; +#define ADE_FRM_DISGARD_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0xA4)<br>
&gt; +/* reset and reload regs */<br>
&gt; +#define ADE_SOFT_RST_SEL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x78)<br>
&gt; +#define ADE_SOFT_RST_SEL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x7C)<br>
&gt; +#define ADE_RELOAD_DIS0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xAC)<br>
&gt; +#define ADE_RELOAD_DIS1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xB0)<br>
&gt; +#define ADE_CH_RDMA_BIT_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0)<br>
&gt; +#define ADE_CLIP_BIT_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (15)<br>
&gt; +#define ADE_SCL_BIT_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(21)<br>
&gt; +#define ADE_CTRAN_BIT_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(24)<br>
&gt; +#define ADE_OVLY_BIT_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (37) /* 32+5 */<br>
</span>Don&#39;t think we have any cases in drm where constants are wrapped=
 in<br>
brackets. Is there any benefit of doing that here ?<br></blockquote><div><d=
iv class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"=
>Seems no any benefit=E2=80=8B, will remove these brackets in v3.</div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex">
<span class=3D""><br>
&gt; +/* channel regs */<br>
&gt; +#define RD_CH_PE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x1000 + (x) * 0x80)<br>
</span>... and I&#39;m not talking about cases where the macros such as thi=
s one.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +union U_LDI_CTRL {<br>
&gt; +struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 ldi_en=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 disp_mode_buf=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 date_gate_en=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 bpp=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 wait_vsync_en=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 corlorbar_width=
=C2=A0 =C2=A0 =C2=A0 =C2=A0:7;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 bgr=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 color_mode=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 shutdown=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 vactive_line=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :12;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 ldi_en_self_clr=
=C2=A0 =C2=A0 =C2=A0 =C2=A0:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 reserved_573=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 u32;<br>
&gt; +};<br>
&gt; +<br>
&gt; +union U_LDI_WORK_MODE {<br>
&gt; +struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 work_mode=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 wback_en=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 colorbar_en=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 reserved_577=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :29;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 u32;<br>
&gt; +};<br>
&gt; +<br>
</div></div>The struct in the above two unions is missing a level of indent=
ation.<br></blockquote><div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif">=E2=80=8Byes, will be fixed in v3.=E2=80=8B<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex">
<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/hisilicon/hisi_drm_ade.c<br>
<span class=3D""><br>
&gt; +static void ade_ldi_set_mode(struct ade_crtc *acrtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *adj_mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ade_hw_ctx *ctx =3D acrtc-&gt;ctx;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base =3D ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 out_w =3D mode-&gt;hdisplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 out_h =3D mode-&gt;vdisplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hfp, hbp, hsw, vfp, vbp, vsw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 plr_flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0plr_flags =3D (mode-&gt;flags &amp; DRM_MO=
DE_FLAG_NVSYNC)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0? HISI_LDI_FLAG_NVSYNC : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0plr_flags |=3D (mode-&gt;flags &amp; DRM_M=
ODE_FLAG_NHSYNC)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0? HISI_LDI_FLAG_NHSYNC : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hfp =3D mode-&gt;hsync_start - mode-&gt;hd=
isplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hbp =3D mode-&gt;htotal - mode-&gt;hsync_e=
nd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hsw =3D mode-&gt;hsync_end - mode-&gt;hsyn=
c_start;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vfp =3D mode-&gt;vsync_start - mode-&gt;vd=
isplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vbp =3D mode-&gt;vtotal - mode-&gt;vsync_e=
nd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vsw =3D mode-&gt;vsync_end - mode-&gt;vsyn=
c_start;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vsw &gt; 15) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot=
;vsw exceeded 15\n&quot;);<br>
<br>
</span>DRM_ERROR or DRM_DEBUG_xx perhaps ?<br></blockquote><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif">This is not a=
n error hardware still can handle if vsw exceed 15.</div><div class=3D"gmai=
l_default" style=3D"font-family:arial,helvetica,sans-serif">You are right m=
aybe =E2=80=8B<div class=3D"gmail_default" style=3D"display:inline">=E2=80=
=8B</div><span style=3D"font-family:arial,sans-serif">DRM_DEBUG_DRIVER is b=
etter.</span></div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">=E2=80=8B</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vsw =3D 15;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel((hbp &lt;&lt; 20) | (hfp &lt;&lt; 0=
), base + LDI_HRZ_CTRL0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* p3-73 6220V100 pdf:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 &quot;The configured value is the=
 actual width - 1&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(hsw - 1, base + LDI_HRZ_CTRL1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel((vbp &lt;&lt; 20) | (vfp &lt;&lt; 0=
), base + LDI_VRT_CTRL0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* p3-74 6220V100 pdf:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 &quot;The configured value is the=
 actual width - 1&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(vsw - 1, base + LDI_VRT_CTRL1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* p3-75 6220V100 pdf:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 &quot;The configured value is the=
 actual width - 1&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(((out_h - 1) &lt;&lt; 20) | ((out_w=
 - 1) &lt;&lt; 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base + LDI_DSP_SIZE)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(plr_flags, base + LDI_PLR_CTRL);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_set_rate(ctx-&gt;ade_pix_clk, =
mode-&gt;clock * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Success should be guaranteed in aotomic=
_check<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * failer shouldn&#39;t happen here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;set ade_pixel_clk_rate fail\n&quot;);<br>
</div></div>DItto<br></blockquote><div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif;display:inline">=E2=80=8Bwill us=
e=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif;display:inline">=E2=80=8B</div>DRM_DEBUG_DRIVER<div class=3D=
"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;display:inl=
ine">=E2=80=8B in v3.=E2=80=8B</div></div><div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif;display:inline">=E2=80=8B<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0adj_mode-&gt;clock =3D clk_get_rate(ctx-&g=
t;ade_pix_clk) / 1000;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ctran6 setting */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(1, base + ADE_CTRAN_DIS(ADE_CTRAN6)=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(out_w * out_h - 1, base + ADE_CTRAN=
_IMAGE_SIZE(ADE_CTRAN6));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0acrtc-&gt;use_mask |=3D BIT(ADE_CTRAN_BIT_=
OFST + ADE_CTRAN6);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;set mode: %dx%d\n&quot;, ou=
t_w, out_h);<br>
&gt; +<br>
</span><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif;display:inline">=E2=80=8B=E2=80=8B</div><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif;display:inline">=E2=80=
=8B=E2=80=8B</div>DRM_DEBUG_DRIVER ?<br></blockquote><div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif;display:inline"=
>=E2=80=8B</div><div class=3D"gmail_default" style=3D"font-family:arial,hel=
vetica,sans-serif;display:inline">will use=C2=A0</div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif;display:inline">=E2=
=80=8B</div>DRM_DEBUG_DRIVER<div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif;display:inline">=E2=80=8B in v3.</div></div><=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif;display:inline">=E2=80=8B</div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * other parameters setting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(BIT(0), base + LDI_WORK_MODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel((0x3c &lt;&lt; 6) | (ADE_OUT_RGB_88=
8 &lt;&lt; 3) | BIT(2) | BIT(0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base + LDI_CTRL);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0set_reg(base + LDI_DE_SPACE_LOW, 0x1, 1, 1=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ade_power_up(struct ade_hw_ctx *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *media_base =3D ctx-&gt;media=
_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_set_rate(ctx-&gt;ade_core_clk,=
 ctx-&gt;ade_core_rate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;clk_set_rate ade_core_rate error\n&quot;);<br>
</span>How about the following (or alike) less cryptic and more informative=
<br>
message. Other places could use a similar treatment.<br>
<br>
&quot;Failed to set rate X clk (%d)\n&quot;, ret ?<br></blockquote><div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;d=
isplay:inline">=E2=80=8Byes, good advice. will be fixed in v3.</div></div><=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif;display:inline">=E2=80=8B</div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<span class=3D""><br>
<br>
&gt; +static void ade_crtc_enable(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ade_crtc *acrtc =3D to_ade_crtc(crt=
c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ade_hw_ctx *ctx =3D acrtc-&gt;ctx;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;enter.\n&quot;);<br=
>
</span>Does this and the remaining<div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif;display:inline">=E2=80=8B=E2=80=8B</div=
> DEBUG_DRIVER(enter|exit) messages provide<br>
any meaningful input, past the driver <div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif;display:inline">=E2=80=8B=E2=80=8B<=
/div>development stage ?<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (acrtc-&gt;enable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
</span>Esp. since we have cases like this where no message is available.<br=
></blockquote><div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">yeap, these<div class=3D"gmail_default" style=3D"disp=
lay:inline">=E2=80=8B</div><span style=3D"font-family:arial,sans-serif">=C2=
=A0</span><span style=3D"font-family:arial,sans-serif">DEBUG_DRIVER(enter|e=
xit) messages</span>=E2=80=8B are for=C2=A0<div class=3D"gmail_default" sty=
le=3D"display:inline">=E2=80=8B</div><span style=3D"font-family:arial,sans-=
serif">development stage.</span></div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif"><span style=3D"font-family:arial,s=
ans-serif">Which forgot to be removed. will be removed in v3.=C2=A0</span><=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif"><span style=3D"font-family:arial,sans-serif"><br></span></div><div =
class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><s=
pan style=3D"font-family:arial,sans-serif">Thanks,</span></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><span s=
tyle=3D"font-family:arial,sans-serif">-xinliang</span></div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
<br>
Regards,<br>
Emil<br>
</blockquote></div><br></div></div>

--001a113b04e85f72030525cd41f1--

--===============1124720285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1124720285==--
