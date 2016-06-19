From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v5 2/2] mtd: nand: sunxi: add reset line support
Date: Mon, 20 Jun 2016 06:54:12 +0800
Message-ID: <3496441466376852@web3g.yandex.ru>
References: <20160619161435.50404-1-icenowy@aosc.xyz>
	 <20160619161435.50404-2-icenowy@aosc.xyz> <20160619193717.GE26668@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBGOFTS5QKGQE5AVMW7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160619193717.GE26668@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

You're right. This is a copy-n-paste error from the original sunxi-mmc.c fi=
le,
which get all the clocks and resets before using them.

20.06.2016, 03:37, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Mon, Jun 20, 2016 at 12:14:35AM +0800, Icenowy Zheng wrote:
>> =C2=A0The NAND controller on some sun8i chips needs its reset line to be
>> =C2=A0deasserted before they can enter working state.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0Changes in v2:
>> =C2=A0=C2=A0=C2=A0- Corrected the error checking code of reset line.
>>
>> =C2=A0Changes in v3:
>> =C2=A0=C2=A0=C2=A0- Corrected a more serious error brought in the "fix" =
of v2.
>>
>> =C2=A0Changes in v4:
>> =C2=A0=C2=A0=C2=A0- Removed unneeded code block after "else".
>>
>> =C2=A0Changes in v5:
>> =C2=A0=C2=A0=C2=A0- Added reassertion code in case of initialization err=
or and device
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remove.
>>
>> =C2=A0=C2=A0drivers/mtd/nand/sunxi_nand.c | 27 ++++++++++++++++++++++++-=
--
>> =C2=A0=C2=A01 file changed, 24 insertions(+), 3 deletions(-)
>>
>> =C2=A0diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunx=
i_nand.c
>> =C2=A0index a83a690..3b40186 100644
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
>> =C2=A0@@ -1871,26 +1873,41 @@ static int sunxi_nfc_probe(struct platform=
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
>> =C2=A0+ return PTR_ERR(nfc->reset);
>
> You're leaking all the resources here. Please use a goto.
>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
