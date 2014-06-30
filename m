From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: topology: Use a clock if possible to get the
 CPU frequency
Date: Mon, 30 Jun 2014 14:49:19 +0200
Message-ID: <20140630124919.GC28647@lukather>
References: <1404123143-13041-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404123143-13041-2-git-send-email-maxime.ripard@free-electrons.com>
 <20140630102934.GV32514@n2100.arm.linux.org.uk>
 <CAKfTPtC+XcH122AytyZ=x1JVx9THmxCasJLA3Z1e17X_OmH1xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtC+XcH122AytyZ=x1JVx9THmxCasJLA3Z1e17X_OmH1xA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 12:39:26PM +0200, Vincent Guittot wrote:
> On 30 June 2014 12:29, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> =
wrote:
> > On Mon, Jun 30, 2014 at 12:12:22PM +0200, Maxime Ripard wrote:
> >> The Cortex-A7 and Cortex-A15 based SoCs need a clock-frequency propert=
y in the
> >> topology code.
> >>
> >> Allow to use a clock to provide the same information.
> >>
> >> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >
> > This looks fine to me, but I don't know this code.  Maybe Vincent Guitt=
ot
> > should be on the To: list (added)?
>=20
> Thanks

Ah, sorry for that.

>=20
> >
> >> ---
> >>  arch/arm/kernel/topology.c | 25 ++++++++++++++++++-------
> >>  1 file changed, 18 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> >> index 9d853189028b..268443d88094 100644
> >> --- a/arch/arm/kernel/topology.c
> >> +++ b/arch/arm/kernel/topology.c
> >> @@ -11,6 +11,7 @@
> >>   * for more details.
> >>   */
> >>
> >> +#include <linux/clk.h>
> >>  #include <linux/cpu.h>
> >>  #include <linux/cpumask.h>
> >>  #include <linux/export.h>
> >> @@ -100,8 +101,8 @@ static void __init parse_dt_topology(void)
> >>                                GFP_NOWAIT);
> >>
> >>       for_each_possible_cpu(cpu) {
> >> -             const u32 *rate;
> >> -             int len;
> >> +             struct clk *clk;
> >> +             u32 rate =3D 0;
> >>
> >>               /* too early to use cpu->of_node */
> >>               cn =3D of_get_cpu_node(cpu, NULL);
> >> @@ -117,14 +118,24 @@ static void __init parse_dt_topology(void)
> >>               if (cpu_eff->compatible =3D=3D NULL)
> >>                       continue;
> >>
> >> -             rate =3D of_get_property(cn, "clock-frequency", &len);
> >> -             if (!rate || len !=3D 4) {
> >> -                     pr_err("%s missing clock-frequency property\n",
> >> -                             cn->full_name);
> >> +             clk =3D of_clk_get(cn, 0);
> >> +             if (!IS_ERR(clk))
> >> +                     rate =3D clk_get_rate(clk);
>=20
> We need the max frequency as it will be used to weight the different
> CPUs capacity. How do you ensure that the current clock rate is the
> max one ?

Hmm, the clock-frequency attribute in the ePAPR is defined at the
current CPU frequency, not the max one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTsVzPAAoJEBx+YmzsjxAgj9cP/2R76y803wh228mRw2f2xS8c
38MeRlA7+P3++ItXd+heF6JKX3+v7u1nHFd/rVzeEJvJI2cs731x0wdhQA0/bkVF
hyQFVckQZqI8qK7tJtkym/KVhtw6nxd+Ss3iNAm3EN3SP3d4oEVVnNZrPnCZ7xmg
ZWBOv76LUNkPD1oaG/bm8tvh142p8Mzk/Jlza1rvSZo/3dPPSRMUyxvDmW7HQLGu
tndxnTEYzKyI1UHrDWICGzLj03U0dyTMQ/al3v/N15TaJSPdk2fY9u0p6QOubtj2
X34zRE3toowiRFlzm8M0XJKeOVXiZWjL1kIM6r8y2RQH1G5lRfuybh42Bz3NGYc2
lQtoRs8WNl7ucDv4IGXcxn3egAKq+pfoMn3Fsg2AoaVMs74+SuibMcCQbyY3ArRC
wNSvVydL57JOIC9mR8X/uY4tCuj4P9k1+fIb6K4bmcSECmEZMx7Lsrg+Y4BaWDXR
mROpOH7JRgk9HL357oVhLIL/enJ85SSsYWEuVb83vFhdW9eZ4GDkjQtnSo03dYOC
bst8btqKYWOKPvzbFB6A7oGWzebxuHfPWNix0a1ch5aurRSRrP1pWkAQgP/KRiaT
JxRJAWoltotS7RJ5r6BDohzVnEgJMkGnT+hBwJ4oVOF6l8IxFsVW8j782vQyqkBi
m5MijFxttIb8dEydvtZD
=/ooA
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
