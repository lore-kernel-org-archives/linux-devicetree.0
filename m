From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sx: Add UDOO Neo support
Date: Tue, 5 Jul 2016 16:46:02 +0200
Message-ID: <577BC82A.3000406@suse.de>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
 <1467691450-22975-3-git-send-email-afaerber@suse.de>
 <20160705062736.GL16643@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705062736.GL16643-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

Am 05.07.2016 um 08:27 schrieb Uwe Kleine-K=F6nig:
> On Tue, Jul 05, 2016 at 06:04:09AM +0200, Andreas F=E4rber wrote:
>> +&iomuxc {
>> +	imx6sx-udoo-neo {
>=20
> There is no need for this machine group. Please just put the pinctrl
> groups directly into &iomuxc { }.

OK, will do. Adopted from imx6sx-sdb.dtsi and imx6sx-sabreauto.dts -
please update the existing files to be like you expect new ones to be.

>> +		pinctrl_enet1: enet1grp {
>> +			fsl,pins =3D
>> +				<MX6SX_PAD_ENET1_CRS__GPIO2_IO_1	0xa0b1>,
>> +				<MX6SX_PAD_ENET1_MDC__ENET1_MDC		0xa0b1>,
>=20
> It's unusual to write pinmuxes this way. The usual form is to write i=
t
> in a single array. (Not sure I'm using the right term here.) Having s=
aid
> that I like it your way, but still it should (IMHO) get a more offici=
al
> blessing.

In previous reviews I've been told that this is the new expected way to
write tuples, so I assumed that would apply here too, in that you can
have a varying count of tuples (mux lines), which in this case happen t=
o
always have the same cell count (6).

=46or example I've rewritten pinctrl-0 lines in exynos5250 device trees
because maintainers considered it lazy to spare the inner ">, <",
despite still used in many places including bindings documentation.

The binary .dtb representation should be the same either way.

booting-without-of.txt doesn't comment and has no such example apart
from compatible string lists, so not sure whether that's just different
maintainer tastes or formalized somewhere?

That said, I seem to have a talent for finding such inconsistencies. ;)

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
