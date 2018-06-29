From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 05/24] drm/sun4i: Add TCON TOP driver
Date: Fri, 29 Jun 2018 21:09:55 +0200
Message-ID: <2345297.lfuU2Dmuvs@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-6-jernej.skrabec@siol.net> <CAGb2v6465Upen-aFiLXDrSPLDGLh+2REjaZ_91W39=E1DffHeA@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBXEI3LMQKGQEHW4MRWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v6465Upen-aFiLXDrSPLDGLh+2REjaZ_91W39=E1DffHeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 28. junij 2018 ob 03:47:20 CEST je Chen-Yu Tsai napisal(a=
):
> Hi,
>=20
> So I'm late to the party, but...
>=20
> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>=
=20
wrote:
> > As already described in DT binding, TCON TOP is responsible for
> > configuring display pipeline. In this initial driver focus is on HDMI
> > pipeline, so TVE and LCD configuration is not implemented.
> >=20
> > Implemented features:
> > - HDMI source selection
> > - clock driver (TCON and DSI gating)
> > - connecting mixers and TCONS
> >=20
> > Something similar also existed in previous SoCs, except that it was par=
t
> > of first TCON.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> >=20
> >  drivers/gpu/drm/sun4i/Makefile         |   3 +-
> >  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 300 +++++++++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  40 ++++
> >  3 files changed, 342 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> >  create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.h
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/Makefile
> > b/drivers/gpu/drm/sun4i/Makefile index 2589f4acd5ae..09fbfd6304ba 10064=
4
> > --- a/drivers/gpu/drm/sun4i/Makefile
> > +++ b/drivers/gpu/drm/sun4i/Makefile
> > @@ -16,7 +16,8 @@ sun8i-drm-hdmi-y              +=3D sun8i_hdmi_phy_clk=
.o
> >=20
> >  sun8i-mixer-y                  +=3D sun8i_mixer.o sun8i_ui_layer.o \
> > =20
> >                                    sun8i_vi_layer.o sun8i_ui_scaler.o \
> >=20
> > -                                  sun8i_vi_scaler.o sun8i_csc.o
> > +                                  sun8i_vi_scaler.o sun8i_csc.o \
> > +                                  sun8i_tcon_top.o
> >=20
> >  sun4i-tcon-y                   +=3D sun4i_crtc.o
> >  sun4i-tcon-y                   +=3D sun4i_dotclock.o
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c new file mode 100644
> > index 000000000000..8da0460e0028
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > @@ -0,0 +1,300 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/* Copyright (c) 2018 Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> */
> > +
> > +#include <drm/drmP.h>
> > +
> > +#include <dt-bindings/clock/sun8i-tcon-top.h>
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/component.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "sun8i_tcon_top.h"
> > +
> > +static int sun8i_tcon_top_get_connected_ep_id(struct device_node *node=
,
> > +                                             int port_id)
> > +{
> > +       struct device_node *ep, *remote, *port;
> > +       struct of_endpoint endpoint;
> > +
> > +       port =3D of_graph_get_port_by_id(node, port_id);
> > +       if (!port)
> > +               return -ENOENT;
> > +
> > +       for_each_available_child_of_node(port, ep) {
> > +               remote =3D of_graph_get_remote_port_parent(ep);
> > +               if (!remote)
> > +                       continue;
> > +
> > +               if (of_device_is_available(remote)) {
> > +                       of_graph_parse_endpoint(ep, &endpoint);
> > +
> > +                       of_node_put(remote);
> > +
> > +                       return endpoint.id;
> > +               }
> > +
> > +               of_node_put(remote);
> > +       }
> > +
> > +       return -ENOENT;
> > +}
> > +
> > +static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
> > +                                                  struct clk *parent,
> > +                                                  void __iomem *regs,
> > +                                                  spinlock_t *lock,
> > +                                                  u8 bit, int name_ind=
ex)
> > +{
> > +       const char *clk_name, *parent_name;
> > +       int ret;
> > +
> > +       parent_name =3D __clk_get_name(parent);
>=20
> You can simply pass in the binding clock name, and have
>=20
>     index =3D of_property_match_string(np, "clock-names", name);
>     parent_name =3D of_clk_get_parent_name(dev->of_node, index);

That is elegant solution. Should I include that in follow up series?

Best regards,
Jernej

>=20
> > +       ret =3D of_property_read_string_index(dev->of_node,
> > +                                           "clock-output-names",
> > name_index, +                                           &clk_name);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return clk_hw_register_gate(dev, clk_name, parent_name,
> > +                                   CLK_SET_RATE_PARENT,
> > +                                   regs + TCON_TOP_GATE_SRC_REG,
> > +                                   bit, 0, lock);
> > +};
> > +
> > +static int sun8i_tcon_top_bind(struct device *dev, struct device *mast=
er,
> > +                              void *data)
> > +{
> > +       struct platform_device *pdev =3D to_platform_device(dev);
> > +       struct clk *dsi, *tcon_tv0, *tcon_tv1, *tve0, *tve1;
> > +       struct clk_hw_onecell_data *clk_data;
> > +       struct sun8i_tcon_top *tcon_top;
> > +       bool mixer0_unused =3D false;
> > +       struct resource *res;
> > +       void __iomem *regs;
> > +       int ret, i, id;
> > +       u32 val;
> > +
> > +       tcon_top =3D devm_kzalloc(dev, sizeof(*tcon_top), GFP_KERNEL);
> > +       if (!tcon_top)
> > +               return -ENOMEM;
> > +
> > +       clk_data =3D devm_kzalloc(dev, sizeof(*clk_data) +
> > +                               sizeof(*clk_data->hws) * CLK_NUM,
> > +                               GFP_KERNEL);
> > +       if (!clk_data)
> > +               return -ENOMEM;
> > +       tcon_top->clk_data =3D clk_data;
> > +
> > +       spin_lock_init(&tcon_top->reg_lock);
> > +
> > +       tcon_top->rst =3D devm_reset_control_get(dev, NULL);
> > +       if (IS_ERR(tcon_top->rst)) {
> > +               dev_err(dev, "Couldn't get our reset line\n");
> > +               return PTR_ERR(tcon_top->rst);
> > +       }
> > +
> > +       tcon_top->bus =3D devm_clk_get(dev, "bus");
> > +       if (IS_ERR(tcon_top->bus)) {
> > +               dev_err(dev, "Couldn't get the bus clock\n");
> > +               return PTR_ERR(tcon_top->bus);
> > +       }
> > +
> > +       dsi =3D devm_clk_get(dev, "dsi");
> > +       if (IS_ERR(dsi)) {
> > +               dev_err(dev, "Couldn't get the dsi clock\n");
> > +               return PTR_ERR(dsi);
> > +       }
> > +
> > +       tcon_tv0 =3D devm_clk_get(dev, "tcon-tv0");
> > +       if (IS_ERR(tcon_tv0)) {
> > +               dev_err(dev, "Couldn't get the tcon-tv0 clock\n");
> > +               return PTR_ERR(tcon_tv0);
> > +       }
> > +
> > +       tcon_tv1 =3D devm_clk_get(dev, "tcon-tv1");
> > +       if (IS_ERR(tcon_tv1)) {
> > +               dev_err(dev, "Couldn't get the tcon-tv1 clock\n");
> > +               return PTR_ERR(tcon_tv1);
> > +       }
> > +
> > +       tve0 =3D devm_clk_get(dev, "tve0");
> > +       if (IS_ERR(tve0)) {
> > +               dev_err(dev, "Couldn't get the tve0 clock\n");
> > +               return PTR_ERR(tve0);
> > +       }
> > +
> > +       tve1 =3D devm_clk_get(dev, "tve1");
> > +       if (IS_ERR(tve1)) {
> > +               dev_err(dev, "Couldn't get the tve1 clock\n");
> > +               return PTR_ERR(tve1);
> > +       }
>=20
> So you don't actually have to hold references to the parent clocks.
>=20
> ChenYu
>=20
> > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       regs =3D devm_ioremap_resource(dev, res);
> > +       if (IS_ERR(regs))
> > +               return PTR_ERR(regs);
> > +
> > +       ret =3D reset_control_deassert(tcon_top->rst);
> > +       if (ret) {
> > +               dev_err(dev, "Could not deassert ctrl reset control\n")=
;
> > +               return ret;
> > +       }
> > +
> > +       ret =3D clk_prepare_enable(tcon_top->bus);
> > +       if (ret) {
> > +               dev_err(dev, "Could not enable bus clock\n");
> > +               goto err_assert_reset;
> > +       }
> > +
> > +       val =3D 0;
> > +
> > +       /* check if HDMI mux output is connected */
> > +       if (sun8i_tcon_top_get_connected_ep_id(dev->of_node, 5) >=3D 0)=
 {
> > +               /* find HDMI input endpoint id, if it is connected at
> > all*/
> > +               id =3D sun8i_tcon_top_get_connected_ep_id(dev->of_node,=
 4);
> > +               if (id >=3D 0)
> > +                       val =3D FIELD_PREP(TCON_TOP_HDMI_SRC_MSK, id + =
1);
> > +               else
> > +                       DRM_DEBUG_DRIVER("TCON TOP HDMI input is not
> > connected\n"); +       } else {
> > +               DRM_DEBUG_DRIVER("TCON TOP HDMI output is not
> > connected\n"); +       }
> > +
> > +       writel(val, regs + TCON_TOP_GATE_SRC_REG);
> > +
> > +       val =3D 0;
> > +
> > +       /* process mixer0 mux output */
> > +       id =3D sun8i_tcon_top_get_connected_ep_id(dev->of_node, 1);
> > +       if (id >=3D 0) {
> > +               val =3D FIELD_PREP(TCON_TOP_PORT_DE0_MSK, id);
> > +       } else {
> > +               DRM_DEBUG_DRIVER("TCON TOP mixer0 output is not
> > connected\n"); +               mixer0_unused =3D true;
> > +       }
> > +
> > +       /* process mixer1 mux output */
> > +       id =3D sun8i_tcon_top_get_connected_ep_id(dev->of_node, 3);
> > +       if (id >=3D 0) {
> > +               val |=3D FIELD_PREP(TCON_TOP_PORT_DE1_MSK, id);
> > +
> > +               /*
> > +                * mixer0 mux has priority over mixer1 mux. We have to
> > +                * make sure mixer0 doesn't overtake TCON from mixer1.
> > +                */
> > +               if (mixer0_unused && id =3D=3D 0)
> > +                       val |=3D FIELD_PREP(TCON_TOP_PORT_DE0_MSK, 1);
> > +       } else {
> > +               DRM_DEBUG_DRIVER("TCON TOP mixer1 output is not
> > connected\n"); +       }
> > +
> > +       writel(val, regs + TCON_TOP_PORT_SEL_REG);
> > +
> > +       /*
> > +        * TCON TOP has two muxes, which select parent clock for each T=
CON
> > TV +        * channel clock. Parent could be either TCON TV or TVE cloc=
k.
> > For now +        * we leave this fixed to TCON TV, since TVE driver for
> > R40 is not yet +        * implemented. Once it is, graph needs to be
> > traversed to determine +        * if TVE is active on each TCON TV. If =
it
> > is, mux should be switched +        * to TVE clock parent.
> > +        */
> > +       clk_data->hws[CLK_TCON_TOP_TV0] =3D
> > +               sun8i_tcon_top_register_gate(dev, tcon_tv0, regs,
> > +                                            &tcon_top->reg_lock,
> > +                                            TCON_TOP_TCON_TV0_GATE, 0)=
;
> > +
> > +       clk_data->hws[CLK_TCON_TOP_TV1] =3D
> > +               sun8i_tcon_top_register_gate(dev, tcon_tv1, regs,
> > +                                            &tcon_top->reg_lock,
> > +                                            TCON_TOP_TCON_TV1_GATE, 1)=
;
> > +
> > +       clk_data->hws[CLK_TCON_TOP_DSI] =3D
> > +               sun8i_tcon_top_register_gate(dev, dsi, regs,
> > +                                            &tcon_top->reg_lock,
> > +                                            TCON_TOP_TCON_DSI_GATE, 2)=
;
> > +
> > +       for (i =3D 0; i < CLK_NUM; i++)
> > +               if (IS_ERR(clk_data->hws[i])) {
> > +                       ret =3D PTR_ERR(clk_data->hws[i]);
> > +                       goto err_unregister_gates;
> > +               }
> > +
> > +       clk_data->num =3D CLK_NUM;
> > +
> > +       ret =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_=
get,
> > +                                    clk_data);
> > +       if (ret)
> > +               goto err_unregister_gates;
> > +
> > +       dev_set_drvdata(dev, tcon_top);
> > +
> > +       return 0;
> > +
> > +err_unregister_gates:
> > +       for (i =3D 0; i < CLK_NUM; i++)
> > +               if (clk_data->hws[i])
> > +                       clk_hw_unregister_gate(clk_data->hws[i]);
> > +       clk_disable_unprepare(tcon_top->bus);
> > +err_assert_reset:
> > +       reset_control_assert(tcon_top->rst);
> > +
> > +       return ret;
> > +}
> > +
> > +static void sun8i_tcon_top_unbind(struct device *dev, struct device
> > *master, +                                 void *data)
> > +{
> > +       struct sun8i_tcon_top *tcon_top =3D dev_get_drvdata(dev);
> > +       struct clk_hw_onecell_data *clk_data =3D tcon_top->clk_data;
> > +       int i;
> > +
> > +       of_clk_del_provider(dev->of_node);
> > +       for (i =3D 0; i < CLK_NUM; i++)
> > +               clk_hw_unregister_gate(clk_data->hws[i]);
> > +
> > +       clk_disable_unprepare(tcon_top->bus);
> > +       reset_control_assert(tcon_top->rst);
> > +}
> > +
> > +static const struct component_ops sun8i_tcon_top_ops =3D {
> > +       .bind   =3D sun8i_tcon_top_bind,
> > +       .unbind =3D sun8i_tcon_top_unbind,
> > +};
> > +
> > +static int sun8i_tcon_top_probe(struct platform_device *pdev)
> > +{
> > +       return component_add(&pdev->dev, &sun8i_tcon_top_ops);
> > +}
> > +
> > +static int sun8i_tcon_top_remove(struct platform_device *pdev)
> > +{
> > +       component_del(&pdev->dev, &sun8i_tcon_top_ops);
> > +
> > +       return 0;
> > +}
> > +
> > +/* sun4i_drv uses this list to check if a device node is a TCON TOP */
> > +const struct of_device_id sun8i_tcon_top_of_table[] =3D {
> > +       { .compatible =3D "allwinner,sun8i-r40-tcon-top" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sun8i_tcon_top_of_table);
> > +EXPORT_SYMBOL(sun8i_tcon_top_of_table);
> > +
> > +static struct platform_driver sun8i_tcon_top_platform_driver =3D {
> > +       .probe          =3D sun8i_tcon_top_probe,
> > +       .remove         =3D sun8i_tcon_top_remove,
> > +       .driver         =3D {
> > +               .name           =3D "sun8i-tcon-top",
> > +               .of_match_table =3D sun8i_tcon_top_of_table,
> > +       },
> > +};
> > +module_platform_driver(sun8i_tcon_top_platform_driver);
> > +
> > +MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>");
> > +MODULE_DESCRIPTION("Allwinner R40 TCON TOP driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
> > b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h new file mode 100644
> > index 000000000000..39838bbfeaee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/* Copyright (c) 2018 Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> */
> > +
> > +#ifndef _SUN8I_TCON_TOP_H_
> > +#define _SUN8I_TCON_TOP_H_
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/reset.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define TCON_TOP_TCON_TV_SETUP_REG     0x00
> > +
> > +#define TCON_TOP_PORT_SEL_REG          0x1C
> > +#define TCON_TOP_PORT_DE0_MSK                  GENMASK(1, 0)
> > +#define TCON_TOP_PORT_DE1_MSK                  GENMASK(5, 4)
> > +
> > +#define TCON_TOP_GATE_SRC_REG          0x20
> > +#define TCON_TOP_HDMI_SRC_MSK                  GENMASK(29, 28)
> > +#define TCON_TOP_TCON_TV1_GATE                 24
> > +#define TCON_TOP_TCON_TV0_GATE                 20
> > +#define TCON_TOP_TCON_DSI_GATE                 16
> > +
> > +#define CLK_NUM                                        3
> > +
> > +struct sun8i_tcon_top {
> > +       struct clk                      *bus;
> > +       struct clk_hw_onecell_data      *clk_data;
> > +       struct reset_control            *rst;
> > +
> > +       /*
> > +        * spinlock is used to synchronize access to same
> > +        * register where multiple clock gates can be set.
> > +        */
> > +       spinlock_t                      reg_lock;
> > +};
> > +
> > +extern const struct of_device_id sun8i_tcon_top_of_table[];
> > +
> > +#endif /* _SUN8I_TCON_TOP_H_ */
> > --
> > 2.18.0




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
