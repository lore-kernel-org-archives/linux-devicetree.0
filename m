From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: sunxi: add reset line support
Date: Fri, 24 Jun 2016 07:20:38 +0800
Message-ID: <1284641466724038@web7h.yandex.ru>
References: <20160620044838.56904-1-icenowy@aosc.xyz>
	<20160620044838.56904-2-icenowy@aosc.xyz> <20160623180108.382bbaae@bbrezillon>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBS65WG5QKGQEAEYBIDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160623180108.382bbaae@bbrezillon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In my opinion, return directly PTR_ERR(nfc->reset) is OK here.
If devm_reset_control_get_optional() return -EPROBE_DEFER, the code here wi=
ll also return it. However, if we get other error, why should it return -EP=
ROBE_DEFER again?

24.06.2016, 00:01, "Boris Brezillon" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Mon, 20 Jun 2016 12:48:38 +0800
> Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>
>> =C2=A0The NAND controller on some sun8i chips needs its reset line to be
>> =C2=A0deasserted before they can enter working state.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0=C2=A0=C2=A0Changes in v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Corrected the error checking code of res=
et line.
>>
>> =C2=A0=C2=A0=C2=A0Changes in v3:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Corrected a more serious error brought i=
n the "fix" of v2.
>>
>> =C2=A0=C2=A0=C2=A0Changes in v4:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Removed unneeded code block after "else"=
.
>>
>> =C2=A0=C2=A0=C2=A0Changes in v5:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Added reassertion code in case of initia=
lization error and device
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remove.
>>
>> =C2=A0=C2=A0=C2=A0Changes in v6:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Fixed a resource leak by not using goto =
to exit in case of error.
>>
>> =C2=A0=C2=A0drivers/mtd/nand/sunxi_nand.c | 28 +++++++++++++++++++++++++=
---
>> =C2=A0=C2=A01 file changed, 25 insertions(+), 3 deletions(-)
>>
>> =C2=A0diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunx=
i_nand.c
>> =C2=A0index a83a690..08d5e88 100644
>> =C2=A0--- a/drivers/mtd/nand/sunxi_nand.c
>> =C2=A0+++ b/drivers/mtd/nand/sunxi_nand.c
>> =C2=A0@@ -39,6 +39,7 @@
>> =C2=A0=C2=A0#include <linux/gpio.h>
>> =C2=A0=C2=A0#include <linux/interrupt.h>
>> =C2=A0=C2=A0#include <linux/iopoll.h>
>> =C2=A0+#include <linux/reset.h>
>>
>> =C2=A0=C2=A0#define NFC_REG_CTL 0x0000
>> =C2=A0=C2=A0#define NFC_REG_ST 0x0004
>> =C2=A0@@ -269,6 +270,7 @@ struct sunxi_nfc {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem=
 *regs;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk *=
ahb_clk;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk *=
mod_clk;
>> =C2=A0+ struct reset_control *reset;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned lon=
g assigned_cs;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned lon=
g clk_rate;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_=
head chips;
>> =C2=A0@@ -1871,26 +1873,42 @@ static int sunxi_nfc_probe(struct platform=
_device *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out_ahb_clk_unprepare;
>>
>> =C2=A0+ nfc->reset =3D devm_reset_control_get_optional(dev, "ahb");
>> =C2=A0+
>> =C2=A0+ if (!IS_ERR(nfc->reset)) {
>> =C2=A0+ ret =3D reset_control_deassert(nfc->reset);
>> =C2=A0+ if (ret) {
>> =C2=A0+ dev_err(dev, "reset err %d\n", ret);
>> =C2=A0+ goto out_mod_clk_unprepare;
>> =C2=A0+ }
>> =C2=A0+ } else if (PTR_ERR(nfc->reset) !=3D -ENOENT) {
>> =C2=A0+ ret =3D PTR_ERR(nfc->reset);
>
> You should return -EDEFER_PROBE here.
>
> And can you please rebase this series on top of nand/next [1]?
>
> [1]https://github.com/linux-nand/linux/tree/nand/next

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
