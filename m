From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Tue, 07 Feb 2017 21:36:35 +0800
Message-ID: <4664661486474595@web28j.yandex.ru>
References: <20170202131338.20234-1-icenowy@aosc.xyz>
	 <20170202131338.20234-2-icenowy@aosc.xyz>
	 <20170206085416.4qtd3wfhtinp42xv@lukather>
	 <5119511486371415@web15m.yandex.ru> <20170207092503.3nh2g6orkgjgdi7q@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBZU247CAKGQEHVYDEFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170207092503.3nh2g6orkgjgdi7q@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



07.02.2017, 17:25, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Mon, Feb 06, 2017 at 04:56:55PM +0800, Icenowy Zheng wrote:
>> =C2=A006.02.2017, 16:54, "Maxime Ripard" <maxime.ripard@free-electrons.c=
om>:
>> =C2=A0> On Thu, Feb 02, 2017 at 09:13:37PM +0800, Icenowy Zheng wrote:
>> =C2=A0>> =C2=A0The H3 SoC have a bigger SID controller, which has its di=
rect read
>> =C2=A0>> =C2=A0address at 0x200 position in the SID block, not 0x0.
>> =C2=A0>>
>> =C2=A0>> =C2=A0Also, H3 SID controller has some silicon bug that makes t=
he direct read
>> =C2=A0>> =C2=A0value wrong at cold boot, add code to workaround the bug.=
 (This bug has
>> =C2=A0>> =C2=A0already been fixed on A64 and later SoCs)
>> =C2=A0>>
>> =C2=A0>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0>> =C2=A0---
>> =C2=A0>> =C2=A0This patch is the part of [PATCH v2 1/1] that adds suppor=
t for H3 SID
>> =C2=A0>> =C2=A0controller.
>> =C2=A0>>
>> =C2=A0>> =C2=A0=C2=A0.../bindings/nvmem/allwinner,sunxi-sid.txt | 12 +++=
-
>> =C2=A0>> =C2=A0=C2=A0drivers/nvmem/sunxi_sid.c | 72 ++++++++++++++++++++=
+-
>> =C2=A0>> =C2=A0=C2=A02 files changed, 82 insertions(+), 2 deletions(-)
>> =C2=A0>>
>> =C2=A0>> =C2=A0diff --git a/Documentation/devicetree/bindings/nvmem/allw=
inner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sun=
xi-sid.txt
>> =C2=A0>> =C2=A0index d543ed3f5363..9ab9e75a6351 100644
>> =C2=A0>> =C2=A0--- a/Documentation/devicetree/bindings/nvmem/allwinner,s=
unxi-sid.txt
>> =C2=A0>> =C2=A0+++ b/Documentation/devicetree/bindings/nvmem/allwinner,s=
unxi-sid.txt
>> =C2=A0>> =C2=A0@@ -1,7 +1,11 @@
>> =C2=A0>> =C2=A0=C2=A0Allwinner sunxi-sid
>> =C2=A0>>
>> =C2=A0>> =C2=A0=C2=A0Required properties:
>> =C2=A0>> =C2=A0-- compatible: "allwinner,sun4i-a10-sid" or "allwinner,su=
n7i-a20-sid"
>> =C2=A0>> =C2=A0+- compatible: Should be one of the following (depending =
on your SoC):
>> =C2=A0>> =C2=A0+ "allwinner,sun4i-a10-sid"
>> =C2=A0>> =C2=A0+ "allwinner,sun7i-a20-sid"
>> =C2=A0>> =C2=A0+ "allwinner,sun8i-h3-sid"
>> =C2=A0>> =C2=A0+
>> =C2=A0>> =C2=A0=C2=A0- reg: Should contain registers location and length
>> =C2=A0>>
>> =C2=A0>> =C2=A0=C2=A0=3D Data cells =3D
>> =C2=A0>> =C2=A0@@ -19,3 +23,9 @@ Example for sun7i:
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "allwinner,sun7=
i-a20-sid";
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x01c23800 0x200>
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>> =C2=A0>> =C2=A0+
>> =C2=A0>> =C2=A0+Example for sun8i-h3:
>> =C2=A0>> =C2=A0+ sid@01c14000 {
>> =C2=A0>> =C2=A0+ compatible =3D "allwinner,sun8i-h3-sid";
>> =C2=A0>> =C2=A0+ reg =3D <0x01c14000 0x400>;
>> =C2=A0>> =C2=A0+ };
>> =C2=A0>> =C2=A0diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/su=
nxi_sid.c
>> =C2=A0>> =C2=A0index 69524b67007f..476a161ff23a 100644
>> =C2=A0>> =C2=A0--- a/drivers/nvmem/sunxi_sid.c
>> =C2=A0>> =C2=A0+++ b/drivers/nvmem/sunxi_sid.c
>> =C2=A0>> =C2=A0@@ -25,6 +25,16 @@
>> =C2=A0>> =C2=A0=C2=A0#include <linux/slab.h>
>> =C2=A0>> =C2=A0=C2=A0#include <linux/random.h>
>> =C2=A0>>
>> =C2=A0>> =C2=A0+/* Registers and special values for doing register-based=
 SID readout on H3 */
>> =C2=A0>> =C2=A0+#define SUN8I_SID_PRCTL 0x40
>> =C2=A0>> =C2=A0+#define SUN8I_SID_RDKEY 0x60
>> =C2=A0>> =C2=A0+
>> =C2=A0>> =C2=A0+#define SUN8I_SID_OP_LOCK 0xAC
>> =C2=A0>> =C2=A0+#define SUN8I_SID_OFFSET_MASK 0x1FF
>> =C2=A0>> =C2=A0+#define SUN8I_SID_OFFSET_SHIFT 16
>> =C2=A0>> =C2=A0+#define SUN8I_SID_LOCK_SHIFT 8
>> =C2=A0>> =C2=A0+#define SUN8I_SID_READ BIT(1)
>> =C2=A0>> =C2=A0+
>> =C2=A0>> =C2=A0=C2=A0static struct nvmem_config econfig =3D {
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.na=
me =3D "sunxi-sid",
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.re=
ad_only =3D true,
>> =C2=A0>> =C2=A0@@ -34,11 +44,14 @@ static struct nvmem_config econfig =
=3D {
>> =C2=A0>> =C2=A0=C2=A0};
>> =C2=A0>>
>> =C2=A0>> =C2=A0=C2=A0struct sunxi_sid_cfg {
>> =C2=A0>> =C2=A0+ u32 value_offset;
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32=
 size;
>> =C2=A0>> =C2=A0+ bool need_register_readout;
>> =C2=A0>> =C2=A0=C2=A0};
>> =C2=A0>>
>> =C2=A0>> =C2=A0=C2=A0struct sunxi_sid {
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0voi=
d __iomem *base;
>> =C2=A0>> =C2=A0+ u32 value_offset;
>> =C2=A0>> =C2=A0=C2=A0};
>> =C2=A0>>
>> =C2=A0>> =C2=A0=C2=A0/* We read the entire key, due to a 32 bit read ali=
gnment requirement. Since we
>> =C2=A0>> =C2=A0@@ -51,7 +64,8 @@ static u8 sunxi_sid_read_byte(const str=
uct sunxi_sid *sid,
>> =C2=A0>> =C2=A0=C2=A0{
>> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32=
 sid_key;
>> =C2=A0>>
>> =C2=A0>> =C2=A0- sid_key =3D ioread32be(sid->base + round_down(offset, 4=
));
>> =C2=A0>> =C2=A0+ sid_key =3D ioread32be(sid->base + sid->value_offset +
>> =C2=A0>> =C2=A0+ round_down(offset, 4));
>> =C2=A0>
>> =C2=A0> This would probably be more logical to have this in sunxi_sid_re=
ad.
>>
>> =C2=A0But it's here which really access the memory...
>
> This function is made to read a single register. What you want is to
> offset all reads, and all the reads are made in sunxi_sid_read.

I think the semantic of this function is to read out one byte from SID,
not read out a single register from SID; the parameter passed into it is
also a const struct *sunxi_sid, so I think make the offset here is right.

>
>> =C2=A0>> =C2=A0+ if (reg_val & SUN8I_SID_READ)
>> =C2=A0>> =C2=A0+ return -EIO;
>> =C2=A0>> =C2=A0+
>> =C2=A0>> =C2=A0+ if (out)
>> =C2=A0>> =C2=A0+ *out =3D readl(sid->base + SUN8I_SID_RDKEY);
>> =C2=A0>
>> =C2=A0> Why do you need that out parameter?
>>
>> =C2=A0The read operation by registers can really return a value --
>> =C2=A0in fact, the fix to the pre-read value is a side effect.
>
> Yet, you're not using it at all, so this is dead code.

Removed it.

>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
