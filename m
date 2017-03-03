From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v5 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Fri, 03 Mar 2017 18:22:53 +0800
Message-ID: <20170303132301.MsNukgFP@smtp2h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBD4I4XCQKGQEYHNGLBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=883=E6=97=A5 18:18=E4=BA=8E Srinivas Kandagatla <srini=
vas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 27/02/17 19:27, Icenowy Zheng wrote:=20
> > The H3 SoC have a bigger SID controller, which has its direct read=20
> > address at 0x200 position in the SID block, not 0x0.=20
> >=20
> > Also, H3 SID controller has some silicon bug that makes the direct read=
=20
> > value wrong at cold boot, add code to workaround the bug. (This bug has=
=20
> > already been fixed on A64 and later SoCs)=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> > Changes in v5:=20
> > - Removed some bits in binding documentation.=20
> > - Removed some default values in cfg struct.=20
> >=20
> > Changes in v4:=20
> > - Use readl_poll_timeout.=20
> > - Do register offset in sunxi_sid_read.=20
> > - Merge SUN8I_SID_OP_LOCK and SUN8I_SID_LOCK_SHIFT into one macro.=20
> > - Drop the result of register-based read operation.=20
> >=20
> >=C2=A0 .../bindings/nvmem/allwinner,sunxi-sid.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++-=20
> >=C2=A0 drivers/nvmem/sunxi_sid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 62 ++++++++++++++++++++++=20
> >=C2=A0 2 files changed, 67 insertions(+), 1 deletion(-)=20
>
>
>
> I will queue this and 1/3 patch for next cycle, but the dts patch has to=
=20
> go via arm-soc tree.=20

Thanks! ;-)

And I think Maxime can merge 3/3.

>
> Thanks,=20
> srini=20
> >=20
> > diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-si=
d.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt=20
> > index d543ed3f5363..ef06d061913c 100644=20
> > --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt=
=20
> > +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt=
=20
> > @@ -1,7 +1,11 @@=20
> >=C2=A0 Allwinner sunxi-sid=20
> >=20
> >=C2=A0 Required properties:=20
> > -- compatible: "allwinner,sun4i-a10-sid" or "allwinner,sun7i-a20-sid"=
=20
> > +- compatible: Should be one of the following:=20
> > +=C2=A0 "allwinner,sun4i-a10-sid"=20
> > +=C2=A0 "allwinner,sun7i-a20-sid"=20
> > +=C2=A0 "allwinner,sun8i-h3-sid"=20
> > +=20
> >=C2=A0 - reg: Should contain registers location and length=20
> >=20
> >=C2=A0 =3D Data cells =3D=20
> > diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c=20
> > index 69524b67007f..0d6648be93b8 100644=20
> > --- a/drivers/nvmem/sunxi_sid.c=20
> > +++ b/drivers/nvmem/sunxi_sid.c=20
> > @@ -17,6 +17,7 @@=20
> >=20
> >=C2=A0 #include <linux/device.h>=20
> >=C2=A0 #include <linux/io.h>=20
> > +#include <linux/iopoll.h>=20
> >=C2=A0 #include <linux/module.h>=20
> >=C2=A0 #include <linux/nvmem-provider.h>=20
> >=C2=A0 #include <linux/of.h>=20
> > @@ -25,6 +26,15 @@=20
> >=C2=A0 #include <linux/slab.h>=20
> >=C2=A0 #include <linux/random.h>=20
> >=20
> > +/* Registers and special values for doing register-based SID readout o=
n H3 */=20
> > +#define SUN8I_SID_PRCTL 0x40=20
> > +#define SUN8I_SID_RDKEY 0x60=20
> > +=20
> > +#define SUN8I_SID_OFFSET_MASK 0x1FF=20
> > +#define SUN8I_SID_OFFSET_SHIFT 16=20
> > +#define SUN8I_SID_OP_LOCK (0xAC << 8)=20
> > +#define SUN8I_SID_READ BIT(1)=20
> > +=20
> >=C2=A0 static struct nvmem_config econfig =3D {=20
> >=C2=A0 .name =3D "sunxi-sid",=20
> >=C2=A0 .read_only =3D true,=20
> > @@ -34,11 +44,14 @@ static struct nvmem_config econfig =3D {=20
> >=C2=A0 };=20
> >=20
> >=C2=A0 struct sunxi_sid_cfg {=20
> > + u32 value_offset;=20
> >=C2=A0 u32 size;=20
> > + bool need_register_readout;=20
> >=C2=A0 };=20
> >=20
> >=C2=A0 struct sunxi_sid {=20
> >=C2=A0 void __iomem *base;=20
> > + u32 value_offset;=20
> >=C2=A0 };=20
> >=20
> >=C2=A0 /* We read the entire key, due to a 32 bit read alignment require=
ment. Since we=20
> > @@ -63,12 +76,36 @@ static int sunxi_sid_read(void *context, unsigned i=
nt offset,=20
> >=C2=A0 struct sunxi_sid *sid =3D context;=20
> >=C2=A0 u8 *buf =3D val;=20
> >=20
> > + /* Offset the read operation to the real position of SID */=20
> > + offset +=3D sid->value_offset;=20
> > +=20
> >=C2=A0 while (bytes--)=20
> >=C2=A0 *buf++ =3D sunxi_sid_read_byte(sid, offset++);=20
> >=20
> >=C2=A0 return 0;=20
> >=C2=A0 }=20
> >=20
> > +static int sun8i_sid_register_readout(const struct sunxi_sid *sid,=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const unsigned int word)=20
> > +{=20
> > + u32 reg_val;=20
> > + int ret;=20
> > +=20
> > + /* Set word, lock access, and set read command */=20
> > + reg_val =3D (word & SUN8I_SID_OFFSET_MASK)=20
> > + =C2=A0 << SUN8I_SID_OFFSET_SHIFT;=20
> > + reg_val |=3D SUN8I_SID_OP_LOCK | SUN8I_SID_READ;=20
> > + writel(reg_val, sid->base + SUN8I_SID_PRCTL);=20
> > +=20
> > + ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,=20
> > + !(reg_val & SUN8I_SID_READ), 100, 250000);=20
> > + if (ret)=20
> > + return ret;=20
> > +=20
> > + writel(0, sid->base + SUN8I_SID_PRCTL);=20
> > + return 0;=20
> > +}=20
> > +=20
> >=C2=A0 static int sunxi_sid_probe(struct platform_device *pdev)=20
> >=C2=A0 {=20
> >=C2=A0 struct device *dev =3D &pdev->dev;=20
> > @@ -86,6 +123,7 @@ static int sunxi_sid_probe(struct platform_device *p=
dev)=20
> >=C2=A0 cfg =3D of_device_get_match_data(dev);=20
> >=C2=A0 if (!cfg)=20
> >=C2=A0 return -EINVAL;=20
> > + sid->value_offset =3D cfg->value_offset;=20
> >=20
> >=C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=20
> >=C2=A0 sid->base =3D devm_ioremap_resource(dev, res);=20
> > @@ -94,6 +132,23 @@ static int sunxi_sid_probe(struct platform_device *=
pdev)=20
> >=20
> >=C2=A0 size =3D cfg->size;=20
> >=20
> > + if (cfg->need_register_readout) {=20
> > + /*=20
> > + * H3's SID controller have a bug that the value at 0x200=20
> > + * offset is not the correct value when the hardware is reseted.=20
> > + * However, after doing a register-based read operation, the=20
> > + * value become right.=20
> > + * Do a full read operation here, but ignore its value=20
> > + * (as it's more fast to read by direct MMIO value than=20
> > + * with registers)=20
> > + */=20
> > + for (i =3D 0; i < (size >> 2); i++) {=20
> > + ret =3D sun8i_sid_register_readout(sid, i);=20
> > + if (ret)=20
> > + return ret;=20
> > + }=20
> > + }=20
> > +=20
> >=C2=A0 econfig.size =3D size;=20
> >=C2=A0 econfig.dev =3D dev;=20
> >=C2=A0 econfig.reg_read =3D sunxi_sid_read;=20
> > @@ -138,9 +193,16 @@ static const struct sunxi_sid_cfg sun7i_a20_cfg =
=3D {=20
> >=C2=A0 .size =3D 0x200,=20
> >=C2=A0 };=20
> >=20
> > +static const struct sunxi_sid_cfg sun8i_h3_cfg =3D {=20
> > + .value_offset =3D 0x200,=20
> > + .size =3D 0x100,=20
> > + .need_register_readout =3D true,=20
> > +};=20
> > +=20
> >=C2=A0 static const struct of_device_id sunxi_sid_of_match[] =3D {=20
> >=C2=A0 { .compatible =3D "allwinner,sun4i-a10-sid", .data =3D &sun4i_a10=
_cfg },=20
> >=C2=A0 { .compatible =3D "allwinner,sun7i-a20-sid", .data =3D &sun7i_a20=
_cfg },=20
> > + { .compatible =3D "allwinner,sun8i-h3-sid", .data =3D &sun8i_h3_cfg }=
,=20
> >=C2=A0 {/* sentinel */},=20
> >=C2=A0 };=20
> >=C2=A0 MODULE_DEVICE_TABLE(of, sunxi_sid_of_match);=20
> >=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
