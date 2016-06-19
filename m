From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: nand: sunxi: add reset line support
Date: Sun, 19 Jun 2016 15:16:19 +0200
Message-ID: <20160619151619.4edc64f6@bbrezillon>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
	<20160619113739.30362-2-icenowy@aosc.xyz>
	<20160619140652.07ab03c9@bbrezillon>
	<2686901466340069@web27g.yandex.ru>
	<20160619145303.0bdf59ea@bbrezillon>
	<2748041466341860@web7m.yandex.ru>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCK63FO5TUHRBJ5WTK5QKGQEIXMBW4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2748041466341860-74mQwxeXopFuio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-ymACFijhrKM@public.gmane.org
Cc: "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 19 Jun 2016 21:11:00 +0800
icenowy-ymACFijhrKM@public.gmane.org wrote:

> Then I will soon make the v2 patch set, with the error detection part fix=
ed.
>=20
> But why does sunxi-mmc check only EPROBE_DEFER?

I guess someone had a probe-dependency problem and fixed this case but
ignored all the possible errors. But there may be other reasons for
devm_reset_control_get_optional() to fail. The only one that is really
reflecting that the reset line is not defined in the DT is -ENOENT.

>=20
> 19.06.2016, 20:53, "Boris Brezillon" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=
:
> > On Sun, 19 Jun 2016 20:41:09 +0800
> > icenowy-ymACFijhrKM@public.gmane.org wrote:
> > =20
> >> =C2=A0To be honest, I copied them from sunxi-mmc.c.
> >>
> >> =C2=A0What function should be chosen better? =20
> >
> > You did the right thing (except for the error detection part). My
> > question was addressed to Philipp (the reset subsystem maintainer).
> > =20
> >> =C2=A019.06.2016, 20:06, "Boris Brezillon" <boris.brezillon@free-elect=
rons.com>: =20
> >> =C2=A0> +Philipp
> >> =C2=A0>
> >> =C2=A0> On Sun, 19 Jun 2016 19:37:39 +0800
> >> =C2=A0> Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> >> =C2=A0> =20
> >> =C2=A0>> =C2=A0The NAND controller on some sun8i chips needs its reset=
 line to be deasserted
> >> =C2=A0>> =C2=A0before they can enter working state. This commit added =
the reset line process
> >> =C2=A0>> =C2=A0to the driver.
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> =C2=A0>> =C2=A0---
> >> =C2=A0>> =C2=A0=C2=A0drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
> >> =C2=A0>> =C2=A0=C2=A01 file changed, 14 insertions(+)
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mt=
d/nand/sunxi_nand.c
> >> =C2=A0>> =C2=A0index a83a690..1502748 100644
> >> =C2=A0>> =C2=A0--- a/drivers/mtd/nand/sunxi_nand.c
> >> =C2=A0>> =C2=A0+++ b/drivers/mtd/nand/sunxi_nand.c
> >> =C2=A0>> =C2=A0@@ -39,6 +39,7 @@
> >> =C2=A0>> =C2=A0=C2=A0#include <linux/gpio.h>
> >> =C2=A0>> =C2=A0=C2=A0#include <linux/interrupt.h>
> >> =C2=A0>> =C2=A0=C2=A0#include <linux/iopoll.h>
> >> =C2=A0>> =C2=A0+#include <linux/reset.h>
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0=C2=A0#define NFC_REG_CTL 0x0000
> >> =C2=A0>> =C2=A0=C2=A0#define NFC_REG_ST 0x0004
> >> =C2=A0>> =C2=A0@@ -269,6 +270,7 @@ struct sunxi_nfc {
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v=
oid __iomem *regs;
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s=
truct clk *ahb_clk;
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s=
truct clk *mod_clk;
> >> =C2=A0>> =C2=A0+ struct reset_control *reset;
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
nsigned long assigned_cs;
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
nsigned long clk_rate;
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s=
truct list_head chips;
> >> =C2=A0>> =C2=A0@@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struc=
t platform_device *pdev)
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (ret)
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out_ahb_clk_unprepare;
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0+ nfc->reset =3D devm_reset_control_get_optional(dev, "=
ahb");
> >> =C2=A0>> =C2=A0+ if (PTR_ERR(nfc->reset) =3D=3D -EPROBE_DEFER)
> >> =C2=A0>> =C2=A0+ return PTR_ERR(nfc->reset); =20
> >> =C2=A0>
> >> =C2=A0> Actually you should test for !=3D -ENOENT, because all error c=
odes except
> >> =C2=A0> this one should stop the ->probe().
> >> =C2=A0>
> >> =C2=A0> BTW, this devm_reset_control_get_optional() is really weird. W=
hile most
> >> =C2=A0> _optional() methods return NULL when the element is not define=
d in the
> >> =C2=A0> DT, this one returns -ENOTENT, which makes it impossible to
> >> =C2=A0> differentiate a real error from a undefined reset line (which =
is a
> >> =C2=A0> valid case for _optional()).
> >> =C2=A0>
> >> =C2=A0> Philipp, is there a good reason for doing that?
> >> =C2=A0> =20
> >> =C2=A0>> =C2=A0+
> >> =C2=A0>> =C2=A0+ if (!IS_ERR(nfc->reset)) {
> >> =C2=A0>> =C2=A0+ ret =3D reset_control_deassert(nfc->reset);
> >> =C2=A0>> =C2=A0+ if (ret) {
> >> =C2=A0>> =C2=A0+ dev_err(dev, "reset err %d\n", ret);
> >> =C2=A0>> =C2=A0+ goto out_mod_clk_unprepare;
> >> =C2=A0>> =C2=A0+ }
> >> =C2=A0>> =C2=A0+ }
> >> =C2=A0>> =C2=A0+ =20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
