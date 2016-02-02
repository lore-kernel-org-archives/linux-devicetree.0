From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v9 02/14] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Wed, 3 Feb 2016 01:09:15 +0800
Message-ID: <CAGS+omBcXwO7ZKm_JP7uP3Bzsm-HaCbmeoxkGx2LGLsa2B5G_g@mail.gmail.com>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
 <1452611750-16283-3-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1759535894=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1452611750-16283-3-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Sasha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

--===============1759535894==
Content-Type: multipart/alternative; boundary=001a11457f30d22808052acc9040

--001a11457f30d22808052acc9040
Content-Type: text/plain; charset=UTF-8

Hi Philipp,

Some more potential bugs I discovered today while trying to configure
Mediatek DRM to use just the MIPI/DSI path (no HDMI).

On Tue, Jan 12, 2016 at 11:15 PM, Philipp Zabel <p.zabel@pengutronix.de>
wrote:
> From: CK Hu <ck.hu@mediatek.com>
>
> This patch adds an initial DRM driver for the Mediatek MT8173 DISP
> subsystem. It currently supports two fixed output streams from the
> OVL0/OVL1 sources to the DSI0/DPI0 sinks, respectively.
>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: YT Shen <yt.shen@mediatek.com>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

[snip]

> +int mtk_drm_crtc_create(struct drm_device *drm_dev,
> +                       const enum mtk_ddp_comp_id *path, unsigned int
path_len)
> +{
> +       struct mtk_drm_private *priv = drm_dev->dev_private;
> +       struct device *dev = drm_dev->dev;
> +       struct mtk_drm_crtc *mtk_crtc;
> +       enum drm_plane_type type;
> +       unsigned int zpos;
> +       int pipe = priv->num_pipes;
> +       int ret;
> +       int i;
> +
> +       mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
> +       if (!mtk_crtc)
> +               return -ENOMEM;
> +
> +       mtk_crtc->config_regs = priv->config_regs;
> +       mtk_crtc->ddp_comp_nr = path_len;
> +       mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
mtk_crtc->ddp_comp_nr,
> +
sizeof(*mtk_crtc->ddp_comp),
> +                                               GFP_KERNEL);
> +
> +       mtk_crtc->mutex = mtk_disp_mutex_get(priv->mutex_dev, pipe);
> +       if (IS_ERR(mtk_crtc->mutex)) {
> +               ret = PTR_ERR(mtk_crtc->mutex);
> +               dev_err(dev, "Failed to get mutex: %d\n", ret);
> +               return ret;
> +       }
> +
> +       for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               enum mtk_ddp_comp_id comp_id = path[i];
> +               struct mtk_ddp_comp *comp;
> +
> +               comp = priv->ddp_comp[comp_id];
> +               if (!comp) {
> +                       dev_err(dev, "Component %s not initialized\n",
> +                               priv->comp_node[comp_id]->full_name);

If one of the components is disabled in .dtsi, then its
priv->comp_node[comp_id] will be NULL here, and trying to full_name will
OOPS.


> +                       ret = -ENODEV;
> +                       goto unprepare;
> +               }
> +
> +               ret = clk_prepare(comp->clk);
> +               if (ret) {
> +                       dev_err(dev,
> +                               "Failed to prepare clock for component
%s: %d\n",
> +                               priv->comp_node[comp_id]->full_name, ret);
> +                       goto unprepare;
> +               }
> +
> +               mtk_crtc->ddp_comp[i] = comp;
> +       }
> +
> +       for (zpos = 0; zpos < OVL_LAYER_NR; zpos++) {
> +               type = (zpos == 0) ? DRM_PLANE_TYPE_PRIMARY :
> +                               (zpos == 1) ? DRM_PLANE_TYPE_CURSOR :
> +                                               DRM_PLANE_TYPE_OVERLAY;
> +               ret = mtk_plane_init(drm_dev, &mtk_crtc->planes[zpos],
> +                                    BIT(pipe), type, zpos);
> +               if (ret)
> +                       goto unprepare;
> +       }
> +
> +       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc,
&mtk_crtc->planes[0].base,
> +                               &mtk_crtc->planes[1].base, pipe);
> +       if (ret < 0)
> +               goto unprepare;
> +
> +       priv->crtc[pipe] = &mtk_crtc->base;
> +       priv->num_pipes++;
> +
> +       return 0;
> +
> +unprepare:
> +       while (--i >= 0)
> +               clk_unprepare(mtk_crtc->ddp_comp[i]->clk);
> +
> +       return ret;
> +}

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> new file mode 100644
> index 0000000..9db22b4
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c

[snip]

> +static struct drm_driver mtk_drm_driver = {
> +       .driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
> +                          DRIVER_ATOMIC,
> +       .unload = mtk_drm_unload,
> +       .set_busid = drm_platform_set_busid,

I think using drm_platform_set_busid() as our .set_busid may cause an OOPs
if
userspace does DRM_IOCTL_SET_VERSION.

drm_setversion() will calls drm_set_busid(), which calls
dev->driver->set_busid()
drm_platform_set_busid() accesses dev->platformdev->id.

However, dev->platformdev is only set by:
  drm_platform_init()->drm_get_platform_dev()

And, since mtk_drm_bind() does the drm_dev_alloc() / drm_dev_register()
itself instead
of calling drm_get_platform_dev(), so dev->platformdev will still be NULL.

So, why don't we call drm_platform_init() instead and implement a .load
callback
to do mtk_drm_kms_init()?

> +
> +       .get_vblank_counter = drm_vblank_count,
> +       .enable_vblank = mtk_drm_crtc_enable_vblank,
> +       .disable_vblank = mtk_drm_crtc_disable_vblank,
> +
> +       .gem_free_object = mtk_drm_gem_free_object,
> +       .gem_vm_ops = &mtk_drm_gem_vm_ops,
> +       .dumb_create = mtk_drm_gem_dumb_create,
> +       .dumb_map_offset = mtk_drm_gem_dumb_map_offset,
> +       .dumb_destroy = drm_gem_dumb_destroy,
> +
> +       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> +       .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +       .gem_prime_export = drm_gem_prime_export,
> +       .gem_prime_import = drm_gem_prime_import,
> +       .gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
> +       .gem_prime_mmap = mtk_drm_gem_mmap_buf,
> +       .fops = &mtk_drm_fops,
> +
> +       .name = DRIVER_NAME,
> +       .desc = DRIVER_DESC,
> +       .date = DRIVER_DATE,
> +       .major = DRIVER_MAJOR,
> +       .minor = DRIVER_MINOR,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +       return dev->of_node == data;
> +}
> +
> +static int mtk_drm_bind(struct device *dev)
> +{
> +       struct mtk_drm_private *private = dev_get_drvdata(dev);
> +       struct drm_device *drm;
> +       int ret;
> +
> +       drm = drm_dev_alloc(&mtk_drm_driver, dev);
> +       if (!drm)
> +               return -ENOMEM;
> +
> +       drm_dev_set_unique(drm, dev_name(dev));
> +
> +       ret = drm_dev_register(drm, 0);
> +       if (ret < 0)
> +               goto err_free;
> +
> +       drm->dev_private = private;
> +       private->drm = drm;
> +
> +       ret = mtk_drm_kms_init(drm);
> +       if (ret < 0)
> +               goto err_unregister;
> +
> +       return 0;
> +
> +err_unregister:
> +       drm_dev_unregister(drm);
> +err_free:
> +       drm_dev_unref(drm);
> +       return ret;
> +}

--001a11457f30d22808052acc9040
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_extra">Hi P=
hilipp,</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Some more potential bugs I discovered today while trying to configure Med=
iatek DRM to use just the MIPI/DSI path (no HDMI).</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">On Tue, Jan 12, 2016 at 11:15 =
PM, Philipp Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pen=
gutronix.de</a>&gt; wrote:</div><div class=3D"gmail_extra">&gt; From: CK Hu=
 &lt;<a href=3D"mailto:ck.hu@mediatek.com">ck.hu@mediatek.com</a>&gt;</div>=
<div class=3D"gmail_extra">&gt;</div><div class=3D"gmail_extra">&gt; This p=
atch adds an initial DRM driver for the Mediatek MT8173 DISP</div><div clas=
s=3D"gmail_extra">&gt; subsystem. It currently supports two fixed output st=
reams from the</div><div class=3D"gmail_extra">&gt; OVL0/OVL1 sources to th=
e DSI0/DPI0 sinks, respectively.</div><div class=3D"gmail_extra">&gt;</div>=
<div class=3D"gmail_extra">&gt; Signed-off-by: CK Hu &lt;<a href=3D"mailto:=
ck.hu@mediatek.com">ck.hu@mediatek.com</a>&gt;</div><div class=3D"gmail_ext=
ra">&gt; Signed-off-by: YT Shen &lt;<a href=3D"mailto:yt.shen@mediatek.com"=
>yt.shen@mediatek.com</a>&gt;</div><div class=3D"gmail_extra">&gt; Signed-o=
ff-by: Daniel Kurtz &lt;<a href=3D"mailto:djkurtz@chromium.org">djkurtz@chr=
omium.org</a>&gt;</div><div class=3D"gmail_extra">&gt; Signed-off-by: Phili=
pp Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pengutronix.=
de</a>&gt;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">[snip]</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">&gt; +int mtk_drm_crtc_create(struct drm_device *drm_dev,</div><div c=
lass=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const enum mtk_ddp_comp_id *path, unsigned =
int path_len)</div><div class=3D"gmail_extra">&gt; +{</div><div class=3D"gm=
ail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 struct mtk_drm_private *priv =3D drm=
_dev-&gt;dev_private;</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =
=C2=A0 struct device *dev =3D drm_dev-&gt;dev;</div><div class=3D"gmail_ext=
ra">&gt; + =C2=A0 =C2=A0 =C2=A0 struct mtk_drm_crtc *mtk_crtc;</div><div cl=
ass=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 enum drm_plane_type type;</=
div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 unsigned int zpo=
s;</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 int pipe =3D=
 priv-&gt;num_pipes;</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =
=C2=A0 int ret;</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0=
 int i;</div><div class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_ext=
ra">&gt; + =C2=A0 =C2=A0 =C2=A0 mtk_crtc =3D devm_kzalloc(dev, sizeof(*mtk_=
crtc), GFP_KERNEL);</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =
=C2=A0 if (!mtk_crtc)</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;</div><div class=3D"gmail=
_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =
mtk_crtc-&gt;config_regs =3D priv-&gt;config_regs;</div><div class=3D"gmail=
_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 mtk_crtc-&gt;ddp_comp_nr =3D path_len;<=
/div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 mtk_crtc-&gt;dd=
p_comp =3D devm_kmalloc_array(dev, mtk_crtc-&gt;ddp_comp_nr,</div><div clas=
s=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*mtk_crtc-&gt;ddp_comp),</div=
><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);</div><div cla=
ss=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 mtk_crtc-&gt;mutex =3D mtk_disp_mutex_get(priv-&gt;mutex_dev, pi=
pe);</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR=
(mtk_crtc-&gt;mutex)) {</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(mtk_crtc-&gt;mutex);=
</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dev_err(dev, &quot;Failed to get mutex: %d\n&quot;, ret);</di=
v><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0=
 =C2=A0 }</div><div class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_e=
xtra">&gt; + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; mtk_crtc-&gt;ddp_com=
p_nr; i++) {</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum mtk_ddp_comp_id comp_id =3D path[i];</div>=
<div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct mtk_ddp_comp *comp;</div><div class=3D"gmail_extra">&gt; +</=
div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 comp =3D priv-&gt;ddp_comp[comp_id];</div><div class=3D"gmail=
_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!comp) =
{</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;Component %s =
not initialized\n&quot;,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 priv-&gt;comp_node[comp_id]-&gt;full_name);</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If one of the co=
mponents is disabled in .dtsi, then its</div><div class=3D"gmail_extra">pri=
v-&gt;comp_node[comp_id] will be NULL here, and trying to full_name will OO=
PS.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;</div><div cl=
ass=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unprepare;</div><div class=3D"gmail_extra=
">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div class=
=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D clk_prepare(comp-&gt;clk);</=
div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (ret) {</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(=
dev,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Failed to prepare clock for component %s: %d\n&quot;,</div><div class=
=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;comp_node[=
comp_id]-&gt;full_name, ret);</div><div class=3D"gmail_extra">&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto=
 unprepare;</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div class=3D"gmail_extra">&gt; +</div><div=
 class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 mtk_crtc-&gt;ddp_comp[i] =3D comp;</div><div class=3D"gmail_extra">&gt;=
 + =C2=A0 =C2=A0 =C2=A0 }</div><div class=3D"gmail_extra">&gt; +</div><div =
class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 for (zpos =3D 0; zpos &lt=
; OVL_LAYER_NR; zpos++) {</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D (zpos =3D=3D 0) ? DRM_PLANE=
_TYPE_PRIMARY :</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (zpos =3D=3D 1) ? DRM_PLANE_TYPE_CURSOR :</div><div class=3D"gma=
il_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PLANE_TYPE_OVERLAY;</div><div class=3D"=
gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D mtk_plane_init(drm_dev, &amp;mtk_crtc-&gt;planes[zpos],</div><div class=
=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(pipe), type, zpos);</div><div class=3D"gmail_extra">&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)</div><div class=3D"gmail=
_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto unprepare;</div><div class=3D"gmail_extra">&gt; + =
=C2=A0 =C2=A0 =C2=A0 }</div><div class=3D"gmail_extra">&gt; +</div><div cla=
ss=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D mtk_drm_crtc_init(dr=
m_dev, mtk_crtc, &amp;mtk_crtc-&gt;planes[0].base,</div><div class=3D"gmail=
_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mtk_crtc-&gt;planes[1].b=
ase, pipe);</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 if =
(ret &lt; 0)</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unprepare;</div><div class=3D"gmail_extra"=
>&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 priv-&g=
t;crtc[pipe] =3D &amp;mtk_crtc-&gt;base;</div><div class=3D"gmail_extra">&g=
t; + =C2=A0 =C2=A0 =C2=A0 priv-&gt;num_pipes++;</div><div class=3D"gmail_ex=
tra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 ret=
urn 0;</div><div class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extr=
a">&gt; +unprepare:</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =
=C2=A0 while (--i &gt;=3D 0)</div><div class=3D"gmail_extra">&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_unprepare(mtk_crtc-&gt;ddp_co=
mp[i]-&gt;clk);</div><div class=3D"gmail_extra">&gt; +</div><div class=3D"g=
mail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 return ret;</div><div class=3D"gmai=
l_extra">&gt; +}</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">&gt; diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drive=
rs/gpu/drm/mediatek/mtk_drm_drv.c</div><div class=3D"gmail_extra">&gt; new =
file mode 100644</div><div class=3D"gmail_extra">&gt; index 0000000..9db22b=
4</div><div class=3D"gmail_extra">&gt; --- /dev/null</div><div class=3D"gma=
il_extra">&gt; +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">[snip]</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">&gt; +static struct =
drm_driver mtk_drm_driver =3D {</div><div class=3D"gmail_extra">&gt; + =C2=
=A0 =C2=A0 =C2=A0 .driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER=
_PRIME |</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_ATOMI=
C,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .unload =3D =
mtk_drm_unload,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0=
 .set_busid =3D drm_platform_set_busid,</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">I think using drm_platform_set_busid() as=
 our .set_busid may cause an OOPs if</div><div class=3D"gmail_extra">usersp=
ace does DRM_IOCTL_SET_VERSION.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">drm_setversion() will calls drm_set_busid(), whic=
h calls dev-&gt;driver-&gt;set_busid()</div><div class=3D"gmail_extra">drm_=
platform_set_busid() accesses dev-&gt;platformdev-&gt;id.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">However, dev-&gt;plat=
formdev is only set by:</div><div class=3D"gmail_extra">=C2=A0 drm_platform=
_init()-&gt;drm_get_platform_dev()</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">And, since mtk_drm_bind() does the drm_dev_all=
oc() / drm_dev_register() itself instead</div><div class=3D"gmail_extra">of=
 calling drm_get_platform_dev(), so dev-&gt;platformdev will still be NULL.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So, w=
hy don&#39;t we call drm_platform_init() instead and implement a .load call=
back</div><div class=3D"gmail_extra">to do mtk_drm_kms_init()?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">&gt; +</div><div c=
lass=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .get_vblank_counter =3D dr=
m_vblank_count,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0=
 .enable_vblank =3D mtk_drm_crtc_enable_vblank,</div><div class=3D"gmail_ex=
tra">&gt; + =C2=A0 =C2=A0 =C2=A0 .disable_vblank =3D mtk_drm_crtc_disable_v=
blank,</div><div class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extr=
a">&gt; + =C2=A0 =C2=A0 =C2=A0 .gem_free_object =3D mtk_drm_gem_free_object=
,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .gem_vm_ops =
=3D &amp;mtk_drm_gem_vm_ops,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =
=C2=A0 =C2=A0 .dumb_create =3D mtk_drm_gem_dumb_create,</div><div class=3D"=
gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .dumb_map_offset =3D mtk_drm_gem_d=
umb_map_offset,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0=
 .dumb_destroy =3D drm_gem_dumb_destroy,</div><div class=3D"gmail_extra">&g=
t; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .prime_han=
dle_to_fd =3D drm_gem_prime_handle_to_fd,</div><div class=3D"gmail_extra">&=
gt; + =C2=A0 =C2=A0 =C2=A0 .prime_fd_to_handle =3D drm_gem_prime_fd_to_hand=
le,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .gem_prime_=
export =3D drm_gem_prime_export,</div><div class=3D"gmail_extra">&gt; + =C2=
=A0 =C2=A0 =C2=A0 .gem_prime_import =3D drm_gem_prime_import,</div><div cla=
ss=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .gem_prime_get_sg_table =3D =
mtk_gem_prime_get_sg_table,</div><div class=3D"gmail_extra">&gt; + =C2=A0 =
=C2=A0 =C2=A0 .gem_prime_mmap =3D mtk_drm_gem_mmap_buf,</div><div class=3D"=
gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .fops =3D &amp;mtk_drm_fops,</div>=
<div class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =
=C2=A0 =C2=A0 =C2=A0 .name =3D DRIVER_NAME,</div><div class=3D"gmail_extra"=
>&gt; + =C2=A0 =C2=A0 =C2=A0 .desc =3D DRIVER_DESC,</div><div class=3D"gmai=
l_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .date =3D DRIVER_DATE,</div><div class=
=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .major =3D DRIVER_MAJOR,</div>=
<div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 .minor =3D DRIVER_MI=
NOR,</div><div class=3D"gmail_extra">&gt; +};</div><div class=3D"gmail_extr=
a">&gt; +</div><div class=3D"gmail_extra">&gt; +static int compare_of(struc=
t device *dev, void *data)</div><div class=3D"gmail_extra">&gt; +{</div><di=
v class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 return dev-&gt;of_node =
=3D=3D data;</div><div class=3D"gmail_extra">&gt; +}</div><div class=3D"gma=
il_extra">&gt; +</div><div class=3D"gmail_extra">&gt; +static int mtk_drm_b=
ind(struct device *dev)</div><div class=3D"gmail_extra">&gt; +{</div><div c=
lass=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 struct mtk_drm_private *pr=
ivate =3D dev_get_drvdata(dev);</div><div class=3D"gmail_extra">&gt; + =C2=
=A0 =C2=A0 =C2=A0 struct drm_device *drm;</div><div class=3D"gmail_extra">&=
gt; + =C2=A0 =C2=A0 =C2=A0 int ret;</div><div class=3D"gmail_extra">&gt; +<=
/div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 drm =3D drm_dev=
_alloc(&amp;mtk_drm_driver, dev);</div><div class=3D"gmail_extra">&gt; + =
=C2=A0 =C2=A0 =C2=A0 if (!drm)</div><div class=3D"gmail_extra">&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;</div><div cla=
ss=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=
=A0 =C2=A0 drm_dev_set_unique(drm, dev_name(dev));</div><div class=3D"gmail=
_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =C2=A0 =
ret =3D drm_dev_register(drm, 0);</div><div class=3D"gmail_extra">&gt; + =
=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)</div><div class=3D"gmail_extra">&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free;</div><div =
class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =
=C2=A0 =C2=A0 drm-&gt;dev_private =3D private;</div><div class=3D"gmail_ext=
ra">&gt; + =C2=A0 =C2=A0 =C2=A0 private-&gt;drm =3D drm;</div><div class=3D=
"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; + =C2=A0 =C2=A0 =
=C2=A0 ret =3D mtk_drm_kms_init(drm);</div><div class=3D"gmail_extra">&gt; =
+ =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)</div><div class=3D"gmail_extra">&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_unregister;</d=
iv><div class=3D"gmail_extra">&gt; +</div><div class=3D"gmail_extra">&gt; +=
 =C2=A0 =C2=A0 =C2=A0 return 0;</div><div class=3D"gmail_extra">&gt; +</div=
><div class=3D"gmail_extra">&gt; +err_unregister:</div><div class=3D"gmail_=
extra">&gt; + =C2=A0 =C2=A0 =C2=A0 drm_dev_unregister(drm);</div><div class=
=3D"gmail_extra">&gt; +err_free:</div><div class=3D"gmail_extra">&gt; + =C2=
=A0 =C2=A0 =C2=A0 drm_dev_unref(drm);</div><div class=3D"gmail_extra">&gt; =
+ =C2=A0 =C2=A0 =C2=A0 return ret;</div><div class=3D"gmail_extra">&gt; +}<=
/div></div></div>

--001a11457f30d22808052acc9040--

--===============1759535894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1759535894==--
