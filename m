From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Mon, 06 Feb 2017 16:56:55 +0800
Message-ID: <5119511486371415@web15m.yandex.ru>
References: <20170202131338.20234-1-icenowy@aosc.xyz>
	 <20170202131338.20234-2-icenowy@aosc.xyz> <20170206085416.4qtd3wfhtinp42xv@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBWXU4DCAKGQE5ZBTUCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170206085416.4qtd3wfhtinp42xv@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



06.02.2017, 16:54, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Thu, Feb 02, 2017 at 09:13:37PM +0800, Icenowy Zheng wrote:
>> =C2=A0The H3 SoC have a bigger SID controller, which has its direct read
>> =C2=A0address at 0x200 position in the SID block, not 0x0.
>>
>> =C2=A0Also, H3 SID controller has some silicon bug that makes the direct=
 read
>> =C2=A0value wrong at cold boot, add code to workaround the bug. (This bu=
g has
>> =C2=A0already been fixed on A64 and later SoCs)
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0This patch is the part of [PATCH v2 1/1] that adds support for H3 =
SID
>> =C2=A0controller.
>>
>> =C2=A0=C2=A0.../bindings/nvmem/allwinner,sunxi-sid.txt | 12 +++-
>> =C2=A0=C2=A0drivers/nvmem/sunxi_sid.c | 72 +++++++++++++++++++++-
>> =C2=A0=C2=A02 files changed, 82 insertions(+), 2 deletions(-)
>>
>> =C2=A0diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun=
xi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.tx=
t
>> =C2=A0index d543ed3f5363..9ab9e75a6351 100644
>> =C2=A0--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.=
txt
>> =C2=A0+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.=
txt
>> =C2=A0@@ -1,7 +1,11 @@
>> =C2=A0=C2=A0Allwinner sunxi-sid
>>
>> =C2=A0=C2=A0Required properties:
>> =C2=A0-- compatible: "allwinner,sun4i-a10-sid" or "allwinner,sun7i-a20-s=
id"
>> =C2=A0+- compatible: Should be one of the following (depending on your S=
oC):
>> =C2=A0+ "allwinner,sun4i-a10-sid"
>> =C2=A0+ "allwinner,sun7i-a20-sid"
>> =C2=A0+ "allwinner,sun8i-h3-sid"
>> =C2=A0+
>> =C2=A0=C2=A0- reg: Should contain registers location and length
>>
>> =C2=A0=C2=A0=3D Data cells =3D
>> =C2=A0@@ -19,3 +23,9 @@ Example for sun7i:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "allwinner,sun7i-a20-sid=
";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x01c23800 0x200>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>> =C2=A0+
>> =C2=A0+Example for sun8i-h3:
>> =C2=A0+ sid@01c14000 {
>> =C2=A0+ compatible =3D "allwinner,sun8i-h3-sid";
>> =C2=A0+ reg =3D <0x01c14000 0x400>;
>> =C2=A0+ };
>> =C2=A0diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
>> =C2=A0index 69524b67007f..476a161ff23a 100644
>> =C2=A0--- a/drivers/nvmem/sunxi_sid.c
>> =C2=A0+++ b/drivers/nvmem/sunxi_sid.c
>> =C2=A0@@ -25,6 +25,16 @@
>> =C2=A0=C2=A0#include <linux/slab.h>
>> =C2=A0=C2=A0#include <linux/random.h>
>>
>> =C2=A0+/* Registers and special values for doing register-based SID read=
out on H3 */
>> =C2=A0+#define SUN8I_SID_PRCTL 0x40
>> =C2=A0+#define SUN8I_SID_RDKEY 0x60
>> =C2=A0+
>> =C2=A0+#define SUN8I_SID_OP_LOCK 0xAC
>> =C2=A0+#define SUN8I_SID_OFFSET_MASK 0x1FF
>> =C2=A0+#define SUN8I_SID_OFFSET_SHIFT 16
>> =C2=A0+#define SUN8I_SID_LOCK_SHIFT 8
>> =C2=A0+#define SUN8I_SID_READ BIT(1)
>> =C2=A0+
>> =C2=A0=C2=A0static struct nvmem_config econfig =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "s=
unxi-sid",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read_only =
=3D true,
>> =C2=A0@@ -34,11 +44,14 @@ static struct nvmem_config econfig =3D {
>> =C2=A0=C2=A0};
>>
>> =C2=A0=C2=A0struct sunxi_sid_cfg {
>> =C2=A0+ u32 value_offset;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 size;
>> =C2=A0+ bool need_register_readout;
>> =C2=A0=C2=A0};
>>
>> =C2=A0=C2=A0struct sunxi_sid {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem=
 *base;
>> =C2=A0+ u32 value_offset;
>> =C2=A0=C2=A0};
>>
>> =C2=A0=C2=A0/* We read the entire key, due to a 32 bit read alignment re=
quirement. Since we
>> =C2=A0@@ -51,7 +64,8 @@ static u8 sunxi_sid_read_byte(const struct sunxi=
_sid *sid,
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 sid_key;
>>
>> =C2=A0- sid_key =3D ioread32be(sid->base + round_down(offset, 4));
>> =C2=A0+ sid_key =3D ioread32be(sid->base + sid->value_offset +
>> =C2=A0+ round_down(offset, 4));
>
> This would probably be more logical to have this in sunxi_sid_read.

But it's here which really access the memory...

>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sid_key >>=
=3D (offset % 4) * 8;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return sid_k=
ey; /* Only return the last byte */
>> =C2=A0@@ -69,6 +83,33 @@ static int sunxi_sid_read(void *context, unsign=
ed int offset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> =C2=A0=C2=A0}
>>
>> =C2=A0+static int sun8i_sid_register_readout(const struct sunxi_sid *sid=
,
>> =C2=A0+ const unsigned int word,
>> =C2=A0+ u32 *out)
>> =C2=A0+{
>> =C2=A0+ u32 reg_val;
>> =C2=A0+ unsigned long expire =3D jiffies + msecs_to_jiffies(250);
>> =C2=A0+
>> =C2=A0+ /* Set word, lock access, and set read command */
>> =C2=A0+ reg_val =3D (word & SUN8I_SID_OFFSET_MASK)
>> =C2=A0+ << SUN8I_SID_OFFSET_SHIFT;
>> =C2=A0+ reg_val |=3D SUN8I_SID_OP_LOCK << SUN8I_SID_LOCK_SHIFT;
>
> You're not using those mask and shifts anywhere else, why not just
> define the value / macro you need directly?
>
>> =C2=A0+ reg_val |=3D SUN8I_SID_READ;
>> =C2=A0+ writel(reg_val, sid->base + SUN8I_SID_PRCTL);
>> =C2=A0+
>> =C2=A0+ do {
>> =C2=A0+ reg_val =3D readl(sid->base + SUN8I_SID_PRCTL);
>> =C2=A0+ } while (time_before(jiffies, expire) && (reg_val & SUN8I_SID_RE=
AD));
>
> readl_poll_timeout?

Thanks. I'll check it.

>
>> =C2=A0+ if (reg_val & SUN8I_SID_READ)
>> =C2=A0+ return -EIO;
>> =C2=A0+
>> =C2=A0+ if (out)
>> =C2=A0+ *out =3D readl(sid->base + SUN8I_SID_RDKEY);
>
> Why do you need that out parameter?

The read operation by registers can really return a value --
in fact, the fix to the pre-read value is a side effect.

>
> Thanks,
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
