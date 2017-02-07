From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Tue, 7 Feb 2017 10:25:03 +0100
Message-ID: <20170207092503.3nh2g6orkgjgdi7q@lukather>
References: <20170202131338.20234-1-icenowy@aosc.xyz>
 <20170202131338.20234-2-icenowy@aosc.xyz>
 <20170206085416.4qtd3wfhtinp42xv@lukather>
 <5119511486371415@web15m.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iwyjrfcyo6bvx4a6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4FE43CAKGQEJAELZKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5119511486371415-pc6iqGSXq09xpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--iwyjrfcyo6bvx4a6
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 04:56:55PM +0800, Icenowy Zheng wrote:
> 06.02.2017, 16:54, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Thu, Feb 02, 2017 at 09:13:37PM +0800, Icenowy Zheng wrote:
> >> =C2=A0The H3 SoC have a bigger SID controller, which has its direct re=
ad
> >> =C2=A0address at 0x200 position in the SID block, not 0x0.
> >>
> >> =C2=A0Also, H3 SID controller has some silicon bug that makes the dire=
ct read
> >> =C2=A0value wrong at cold boot, add code to workaround the bug. (This =
bug has
> >> =C2=A0already been fixed on A64 and later SoCs)
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> =C2=A0---
> >> =C2=A0This patch is the part of [PATCH v2 1/1] that adds support for H=
3 SID
> >> =C2=A0controller.
> >>
> >> =C2=A0=C2=A0.../bindings/nvmem/allwinner,sunxi-sid.txt | 12 +++-
> >> =C2=A0=C2=A0drivers/nvmem/sunxi_sid.c | 72 +++++++++++++++++++++-
> >> =C2=A0=C2=A02 files changed, 82 insertions(+), 2 deletions(-)
> >>
> >> =C2=A0diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,s=
unxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.=
txt
> >> =C2=A0index d543ed3f5363..9ab9e75a6351 100644
> >> =C2=A0--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-si=
d.txt
> >> =C2=A0+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-si=
d.txt
> >> =C2=A0@@ -1,7 +1,11 @@
> >> =C2=A0=C2=A0Allwinner sunxi-sid
> >>
> >> =C2=A0=C2=A0Required properties:
> >> =C2=A0-- compatible: "allwinner,sun4i-a10-sid" or "allwinner,sun7i-a20=
-sid"
> >> =C2=A0+- compatible: Should be one of the following (depending on your=
 SoC):
> >> =C2=A0+ "allwinner,sun4i-a10-sid"
> >> =C2=A0+ "allwinner,sun7i-a20-sid"
> >> =C2=A0+ "allwinner,sun8i-h3-sid"
> >> =C2=A0+
> >> =C2=A0=C2=A0- reg: Should contain registers location and length
> >>
> >> =C2=A0=C2=A0=3D Data cells =3D
> >> =C2=A0@@ -19,3 +23,9 @@ Example for sun7i:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "allwinner,sun7i-a20-=
sid";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x01c23800 0x200>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> >> =C2=A0+
> >> =C2=A0+Example for sun8i-h3:
> >> =C2=A0+ sid@01c14000 {
> >> =C2=A0+ compatible =3D "allwinner,sun8i-h3-sid";
> >> =C2=A0+ reg =3D <0x01c14000 0x400>;
> >> =C2=A0+ };
> >> =C2=A0diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid=
.c
> >> =C2=A0index 69524b67007f..476a161ff23a 100644
> >> =C2=A0--- a/drivers/nvmem/sunxi_sid.c
> >> =C2=A0+++ b/drivers/nvmem/sunxi_sid.c
> >> =C2=A0@@ -25,6 +25,16 @@
> >> =C2=A0=C2=A0#include <linux/slab.h>
> >> =C2=A0=C2=A0#include <linux/random.h>
> >>
> >> =C2=A0+/* Registers and special values for doing register-based SID re=
adout on H3 */
> >> =C2=A0+#define SUN8I_SID_PRCTL 0x40
> >> =C2=A0+#define SUN8I_SID_RDKEY 0x60
> >> =C2=A0+
> >> =C2=A0+#define SUN8I_SID_OP_LOCK 0xAC
> >> =C2=A0+#define SUN8I_SID_OFFSET_MASK 0x1FF
> >> =C2=A0+#define SUN8I_SID_OFFSET_SHIFT 16
> >> =C2=A0+#define SUN8I_SID_LOCK_SHIFT 8
> >> =C2=A0+#define SUN8I_SID_READ BIT(1)
> >> =C2=A0+
> >> =C2=A0=C2=A0static struct nvmem_config econfig =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D =
"sunxi-sid",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read_only=
 =3D true,
> >> =C2=A0@@ -34,11 +44,14 @@ static struct nvmem_config econfig =3D {
> >> =C2=A0=C2=A0};
> >>
> >> =C2=A0=C2=A0struct sunxi_sid_cfg {
> >> =C2=A0+ u32 value_offset;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 size;
> >> =C2=A0+ bool need_register_readout;
> >> =C2=A0=C2=A0};
> >>
> >> =C2=A0=C2=A0struct sunxi_sid {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iom=
em *base;
> >> =C2=A0+ u32 value_offset;
> >> =C2=A0=C2=A0};
> >>
> >> =C2=A0=C2=A0/* We read the entire key, due to a 32 bit read alignment =
requirement. Since we
> >> =C2=A0@@ -51,7 +64,8 @@ static u8 sunxi_sid_read_byte(const struct sun=
xi_sid *sid,
> >> =C2=A0=C2=A0{
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 sid_ke=
y;
> >>
> >> =C2=A0- sid_key =3D ioread32be(sid->base + round_down(offset, 4));
> >> =C2=A0+ sid_key =3D ioread32be(sid->base + sid->value_offset +
> >> =C2=A0+ round_down(offset, 4));
> >
> > This would probably be more logical to have this in sunxi_sid_read.
>=20
> But it's here which really access the memory...

This function is made to read a single register. What you want is to
offset all reads, and all the reads are made in sunxi_sid_read.

> >> =C2=A0+ if (reg_val & SUN8I_SID_READ)
> >> =C2=A0+ return -EIO;
> >> =C2=A0+
> >> =C2=A0+ if (out)
> >> =C2=A0+ *out =3D readl(sid->base + SUN8I_SID_RDKEY);
> >
> > Why do you need that out parameter?
>=20
> The read operation by registers can really return a value --
> in fact, the fix to the pre-read value is a side effect.

Yet, you're not using it at all, so this is dead code.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--iwyjrfcyo6bvx4a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmZJrAAoJEBx+YmzsjxAgqYwP/1gnSJ3CrPzRYx0XLDVDEfF/
6n9CiW+gyvO8foRQ7cEmuSqd8paasimLy4jpV21cjlPxly7TAARPYMrHZGUUMBqE
+kaLzK78/YfXNgaHddu+ltfz3OSWzt7Vm0UR+BlPqA7gqu6bWp+F4zuKOKhPhVJo
N6jh6Z7evt1hKAWbDi8eOITO0p05Ct1vwWMRoJjx5fP0I2TN+0AFpwSsRkQX2kBD
vRrg1ThfnRILsf9w2pAI7tyB8OYAlH0r/poKsq666HC0VyfFSGO2Ze/PjickZ0mM
E3HQ8eBoENBSmfN6C0IP/9l6WuULaol7Fu2k1n+81CK5s2P8Xg156JGrsDLI9T1M
dkzZtlIx42/d2kbG3pRcN9C0jSb+kIb0G/CpvuEZ+GhAm9hvR0SVPfR7/kdmWtLk
2ZpXov14VKM/TleU8d7WkP2QNvq+3i2y53Iyw3ylXVusfCp7S3825C7AVmLwu/sx
IjJaiVKyvypPgOBdQ1JIms8mFHwxrU6Mf6zR1aN2d8bhBQ5T0sXUaQlQf4tAgpl9
rLQ9zLHIkIr7fgRf2zr/HgMiU4x+KNsDHj2Eoa/9/SjVXqumEd8QLCfEzdlRvRjA
rcwxPsMqmkNHL0Wybr8U2gc5H6rXz8eDcG5KfvMzj026R0QDRkCIN7S0eDAsv7du
/oJ1/O+r0PzWFFUO0ZKN
=Sw7h
-----END PGP SIGNATURE-----

--iwyjrfcyo6bvx4a6--
