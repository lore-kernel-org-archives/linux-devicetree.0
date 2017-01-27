From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 1/2] nvmem: sunxi-sid: add support for H3
 and A64's SID controller
Date: Fri, 27 Jan 2017 17:26:59 +0800
Message-ID: <20170127122705.R0b4EAKp@smtp3o.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB4VEVTCAKGQE2M3NLCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=8827=E6=97=A5 16:17=E4=BA=8E Maxime Ripard <maxime.rip=
ard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,=20
>
> On Thu, Jan 26, 2017 at 07:33:44PM +0800, Icenowy Zheng wrote:=20
> > H3 and A64 SoCs have a bigger SID controller, which has its direct read=
=20
> > address at 0x200 position in the SID block, not 0x0.=20
> >=20
> > Also, H3 SID controller has some silicon bug that makes the direct read=
=20
> > value wrong at first, add code to workaround the bug. (This bug has=20
> > already been fixed on A64 and later SoCs)=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> >=C2=A0 .../bindings/nvmem/allwinner,sunxi-sid.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +++-=20
> >=C2=A0 drivers/nvmem/sunxi_sid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 112 +++++++++++++++++++--=20
> >=C2=A0 2 files changed, 123 insertions(+), 11 deletions(-)=20
> >=20
> > diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-si=
d.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt=20
> > index d543ed3f5363..d7400c415338 100644=20
> > --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt=
=20
> > +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt=
=20
> > @@ -1,8 +1,16 @@=20
> >=C2=A0 Allwinner sunxi-sid=20
> >=C2=A0=20
> >=C2=A0 Required properties:=20
> > -- compatible: "allwinner,sun4i-a10-sid" or "allwinner,sun7i-a20-sid"=
=20
> > -- reg: Should contain registers location and length=20
> > +- compatible: Should be one of the following (depending on your SoC):=
=20
> > +=C2=A0 "allwinner,sun4i-a10-sid"=20
> > +=C2=A0 "allwinner,sun7i-a20-sid"=20
> > +=C2=A0 "allwinner,sun8i-h3-sid"=20
> > +=C2=A0 "allwinner,sun50i-a64-sid"=20
> > +=20
> > +- reg: Should contain registers location and registers length, for A10=
 and A20=20
> > +=C2=A0 SoCs the length is directly the length of SID; for H3, A64 and =
newer SoCs=20
> > +=C2=A0 the length should be the sum of the length of SID and the offse=
t of the value=20
> > +=C2=A0 (0x200).=20
> >=C2=A0=20
> >=C2=A0 =3D Data cells =3D=20
> >=C2=A0 Are child nodes of qfprom, bindings of which as described in=20
> > @@ -19,3 +27,13 @@ Example for sun7i:=20
> >=C2=A0 compatible =3D "allwinner,sun7i-a20-sid";=20
> >=C2=A0 reg =3D <0x01c23800 0x200>=20
> >=C2=A0 };=20
> > +=20
> > +Example for sun8i-h3:=20
> > + sid@01c14000 {=20
> > + compatible =3D "allwinner,sun8i-h3-sid";=20
> > + /*=20
> > + * The length of SID on H3 is 0x100 bytes, add the value offset=20
> > + * 0x200, so the total length should be 0x300.=20
> > + */=20
> > + reg =3D <0x01c14000 0x300>;=20
>
> No, it should be the size of the memory region used and documented for=20
> that device, ie 1kB (0x400) in the H3 case, just like any other reg=20
> property.=20

So bind the SID size with compatible?

>
> > + };=20
> > diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c=20
> > index 1567ccca8de3..2e327a66a938 100644=20
> > --- a/drivers/nvmem/sunxi_sid.c=20
> > +++ b/drivers/nvmem/sunxi_sid.c=20
> > @@ -20,10 +20,28 @@=20
> >=C2=A0 #include <linux/module.h>=20
> >=C2=A0 #include <linux/nvmem-provider.h>=20
> >=C2=A0 #include <linux/of.h>=20
> > +#include <linux/of_device.h>=20
> >=C2=A0 #include <linux/platform_device.h>=20
> >=C2=A0 #include <linux/slab.h>=20
> >=C2=A0 #include <linux/random.h>=20
> >=C2=A0=20
> > +/* Registers and special values for doing register-based SID readout o=
n H3 */=20
> > +#define SUN8I_SID_PRCTL 0x40=20
> > +#define SUN8I_SID_RDKEY 0x60=20
> > +=20
> > +#define SUN8I_SID_OP_LOCK 0xAC=20
> > +#define SUN8I_SID_OFFSET_MASK 0x1FF=20
> > +#define SUN8I_SID_OFFSET_SHIFT 16=20
> > +#define SUN8I_SID_LOCK_SHIFT 8=20
> > +#define SUN8I_SID_READ BIT(1)=20
> > +=20
> > +/*=20
> > + * For newer SoCs with a larger eFUSE, the bytes beyond the first 16 b=
ytes are=20
> > + * sparse, which makes it not suitable for adding randomness; legacy S=
oCs' SID=20
> > + * have only 16 bytes, so we choose to use at most 16 bytes to add ran=
domness.=20
> > + */=20
> > +#define SUNXI_SID_MAX_RANDOMNESS_SIZE 16=20
> > +=20
> >=C2=A0 static struct nvmem_config econfig =3D {=20
> >=C2=A0 .name =3D "sunxi-sid",=20
> >=C2=A0 .read_only =3D true,=20
> > @@ -32,8 +50,14 @@ static struct nvmem_config econfig =3D {=20
> >=C2=A0 .owner =3D THIS_MODULE,=20
> >=C2=A0 };=20
> >=C2=A0=20
> > +struct sunxi_sid_cfg {=20
> > + u32 value_offset;=20
> > + bool need_register_readout;=20
> > +};=20
> > +=20
> >=C2=A0 struct sunxi_sid {=20
> >=C2=A0 void __iomem *base;=20
> > + u32 value_offset;=20
> >=C2=A0 };=20
> >=C2=A0=20
> >=C2=A0 /* We read the entire key, due to a 32 bit read alignment require=
ment. Since we=20
> > @@ -46,7 +70,8 @@ static u8 sunxi_sid_read_byte(const struct sunxi_sid =
*sid,=20
> >=C2=A0 {=20
> >=C2=A0 u32 sid_key;=20
> >=C2=A0=20
> > - sid_key =3D ioread32be(sid->base + round_down(offset, 4));=20
> > + sid_key =3D ioread32be(sid->base + sid->value_offset +=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0 round_down(offset, 4));=20
> >=C2=A0 sid_key >>=3D (offset % 4) * 8;=20
> >=C2=A0=20
> >=C2=A0 return sid_key; /* Only return the last byte */=20
> > @@ -64,26 +89,77 @@ static int sunxi_sid_read(void *context, unsigned i=
nt offset,=20
> >=C2=A0 return 0;=20
> >=C2=A0 }=20
> >=C2=A0=20
> > +static int sun8i_sid_register_readout(const struct sunxi_sid *sid,=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const unsigned int word,=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 *out)=20
> > +{=20
> > + u32 reg_val;=20
> > + unsigned long expire =3D jiffies + msecs_to_jiffies(250);=20
> > +=20
> > + /* Set word, lock access, and set read command */=20
> > + reg_val =3D (word & SUN8I_SID_OFFSET_MASK)=20
> > + =C2=A0 << SUN8I_SID_OFFSET_SHIFT;=20
> > + reg_val |=3D SUN8I_SID_OP_LOCK << SUN8I_SID_LOCK_SHIFT;=20
> > + reg_val |=3D SUN8I_SID_READ;=20
> > + writel(reg_val, sid->base + SUN8I_SID_PRCTL);=20
> > +=20
> > + do {=20
> > + reg_val =3D readl(sid->base + SUN8I_SID_PRCTL);=20
> > + } while (time_before(jiffies, expire) && (reg_val & SUN8I_SID_READ));=
=20
> > +=20
> > + if (reg_val & SUN8I_SID_READ)=20
> > + return -EIO;=20
> > +=20
> > + if (out)=20
> > + *out =3D readl(sid->base + SUN8I_SID_RDKEY);=20
> > + writel(0, sid->base + SUN8I_SID_PRCTL);=20
> > + return 0;=20
> > +}=20
> > +=20
> >=C2=A0 static int sunxi_sid_probe(struct platform_device *pdev)=20
> >=C2=A0 {=20
> >=C2=A0 struct device *dev =3D &pdev->dev;=20
> >=C2=A0 struct resource *res;=20
> >=C2=A0 struct nvmem_device *nvmem;=20
> >=C2=A0 struct sunxi_sid *sid;=20
> > - int ret, i, size;=20
> > + int ret, i, size, randomness_size;=20
> >=C2=A0 char *randomness;=20
> > + const struct sunxi_sid_cfg *cfg;=20
> >=C2=A0=20
> >=C2=A0 sid =3D devm_kzalloc(dev, sizeof(*sid), GFP_KERNEL);=20
> >=C2=A0 if (!sid)=20
> >=C2=A0 return -ENOMEM;=20
> >=C2=A0=20
> > + cfg =3D of_device_get_match_data(dev);=20
> > + if (!cfg)=20
> > + return -EINVAL;=20
> > + sid->value_offset =3D cfg->value_offset;=20
> > +=20
> >=C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=20
> >=C2=A0 sid->base =3D devm_ioremap_resource(dev, res);=20
> >=C2=A0 if (IS_ERR(sid->base))=20
> >=C2=A0 return PTR_ERR(sid->base);=20
> >=C2=A0=20
> > - size =3D resource_size(res) - 1;=20
> > - econfig.size =3D resource_size(res);=20
> > + size =3D resource_size(res) - cfg->value_offset;=20
> > +=20
> > + if (cfg->need_register_readout) {=20
> > + /*=20
> > + * H3's SID controller have a bug that the value at 0x200=20
> > + * offset is not the correct value when the hardware is reset.=20
> > + * However, after doing a register-based read operation, the=20
> > + * value become right.=20
> > + * Do a full read operation here, but ignore its value=20
> > + * (as it's more fast to read by direct MMIO value than=20
> > + * with registers)=20
> > + */=20
> > + for (i =3D 0; i < (size >> 2); i++) {=20
> > + ret =3D sun8i_sid_register_readout(sid, i, NULL);=20
> > + if (ret)=20
> > + return ret;=20
> > + }=20
> > + }=20
> > +=20
> > + econfig.size =3D size;=20
> >=C2=A0 econfig.dev =3D dev;=20
> >=C2=A0 econfig.reg_read =3D sunxi_sid_read;=20
> >=C2=A0 econfig.priv =3D sid;=20
> > @@ -91,16 +167,17 @@ static int sunxi_sid_probe(struct platform_device =
*pdev)=20
> >=C2=A0 if (IS_ERR(nvmem))=20
> >=C2=A0 return PTR_ERR(nvmem);=20
> >=C2=A0=20
> > - randomness =3D kzalloc(sizeof(u8) * (size), GFP_KERNEL);=20
> > + randomness_size =3D max(size, SUNXI_SID_MAX_RANDOMNESS_SIZE);=20
> > + randomness =3D kzalloc(sizeof(u8) * (randomness_size), GFP_KERNEL);=
=20
>
> Why is that change needed?=20

On my H3/H2+ only 2 words after the first 4 words is not zero.

I don't feel like add so many 0s to randomness.

>
> Thanks,=20
> Maxime=20
>
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
