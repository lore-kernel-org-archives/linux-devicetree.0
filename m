From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Mon, 25 Sep 2017 12:27:44 +0200
Message-ID: <20170925102744.qixfwlheeimemhcf@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170925101027.lghnnll4h6inreqm@flea.home>
 <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nxscyzcqnjj4fs3l"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLFUUPHAKGQE3XRY7BY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <27EF78BD-6285-4D8D-AA65-8294D797E2FB-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nxscyzcqnjj4fs3l
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
> =E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
6:10:27, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >Hi,
> >
> >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
> >> This patchset imports simple DVFS support for Allwinner A64 SoC.
> >>=20
> >> As the thermal sensor driver is not yet implemented and some boards
> >> have still no AXP PMIC support, now only two OPPs are present --
> >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
> >>=20
> >> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
> >> set up the device tree bits of the DVFS on Pine64.
> >
> >How has this been tested?
> >
> >What tasks did you run, with what governor, etc...
>=20
> I only tested manual frequency switching between 648MHz and
> 816MHz, and tested the PLL stuck issue by change the OPPs to
> some random value.

Ideally, we should test that it's actually reliable. Poorly chosen
OPPs might lead to corrupt data that you might not get before a while.

Please test using:
https://linux-sunxi.org/Hardware_Reliability_Tests#Reliability_of_cpufreq_v=
oltage.2Ffrequency_settings

And post the report.

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

--nxscyzcqnjj4fs3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyNofAAoJEBx+YmzsjxAgqJYP/1c9nmqaw6mmDXypmQuZuJh1
qkBbTji6a44h0XX5YBMISpevLFM9pgIT5+i9DkaZfK1AnJG6PSowsSUra7KEBnrZ
Paf9e/QDNAabVYz1ZF6SScIykYpHoJ9Ab2FVeKB50TJzvD2nOUL+kLP99iddPqSq
pcPey+q/INY1/MhgRfi7V0zJdqkKeU+VfDfoOmrSoL8HihVz2TxNfktfpaYPNgSG
409nqaKx0eOqI61YJzvsfavlJVHH+th6iO+qkJAT+JyP9aSsnjJvbjek0SNbzOgx
y1tT/QW90/I2mONbsyPdpubdZDjh0DJZKuerM1FK9CObIDjzvoXkD78ERQq5gOaV
IIV20x9a1BA9k6HO2WikSRkB71YSjLglvIItqkSdpfc6Ey0CX+VRp5WmOv5mqBwS
frXjpeZOiG5RerfUpB294GNzdwuNKJ8BcmYtT9nEmNt/ycm9z/IXzK38WXkvILzW
fY/hXbfB1TVjqjZ4rexp04z9DPF0ura61IHywplje8V0ZHavELTI1axRQsrQYYis
x0r3aos8Pgt5EL23X7yPuJdqMpXJN4y2BKt5HNvKjMBudRfBP8dS6omT8caCchbb
nJpdRbAIXd4iUco5ekT2V64sy43Ec3QNC2dOt2AzEuglWFqLFO0XFi9InzhnhGuB
vRqvNSo6aZGKesWR2ezz
=80g5
-----END PGP SIGNATURE-----

--nxscyzcqnjj4fs3l--
