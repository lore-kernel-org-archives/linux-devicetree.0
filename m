From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH RESEND 1/2] ARM: topology: Use a clock if possible to get
 the CPU frequency
Date: Wed, 18 Jun 2014 11:06:41 +0200
Message-ID: <20140618090641.GG19730@lukather>
References: <1403034980-19112-1-git-send-email-maxime.ripard@free-electrons.com>
 <1403034980-19112-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAL_Jsq+D2dprBfg8G_zYeZ9sk0pwWhVRd-1Uo513E0Jgg2igRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2048301581270417441=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+D2dprBfg8G_zYeZ9sk0pwWhVRd-1Uo513E0Jgg2igRg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============2048301581270417441==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Jun 17, 2014 at 04:13:26PM -0500, Rob Herring wrote:
> On Tue, Jun 17, 2014 at 2:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The Cortex-A7 and Cortex-A15 based SoCs need a clock-frequency property=
 in the
> > topology code.
> >
> > Allow to use a clock to provide the same information.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/kernel/topology.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> > index 9d853189028b..0bd044cbbcb2 100644
> > --- a/arch/arm/kernel/topology.c
> > +++ b/arch/arm/kernel/topology.c
> > @@ -11,6 +11,7 @@
> >   * for more details.
> >   */
> >
> > +#include <linux/clk.h>
> >  #include <linux/cpu.h>
> >  #include <linux/cpumask.h>
> >  #include <linux/export.h>
> > @@ -100,8 +101,8 @@ static void __init parse_dt_topology(void)
> >                                  GFP_NOWAIT);
> >
> >         for_each_possible_cpu(cpu) {
> > -               const u32 *rate;
> > -               int len;
> > +               struct clk *clk;
> > +               u32 rate =3D 0;
> >
> >                 /* too early to use cpu->of_node */
> >                 cn =3D of_get_cpu_node(cpu, NULL);
> > @@ -117,14 +118,23 @@ static void __init parse_dt_topology(void)
> >                 if (cpu_eff->compatible =3D=3D NULL)
> >                         continue;
> >
> > -               rate =3D of_get_property(cn, "clock-frequency", &len);
> > -               if (!rate || len !=3D 4) {
> > -                       pr_err("%s missing clock-frequency property\n",
> > -                               cn->full_name);
> > +               clk =3D of_clk_get(cn, 0);
> > +               if (!IS_ERR(clk)) {
> > +                       rate =3D clk_get_rate(clk);
> > +               } else {
> > +                       if (of_property_read_u32(cn, "clock-frequency",=
 &rate)) {
> > +                               pr_err("%s missing clocks or clock-freq=
uency properties\n",
> > +                                      cn->full_name);
>=20
> This error check and message is redundant with the next error message.
> You can remove this one and just call of_property_read_u32. rate will
> remain untouched on error.

I'm not sure what you mean here. There's no next error message in the
code as far as I'm aware.

If you mean that I'd rather have something like

clk =3D of_clk_get(cn, 0);
if (!IS_ERR(clk))
	rate =3D clk_get_rate(clk);
else
	of_property_read_u32(cn, "clock-frequency", &rate));

if (!rate)
	pr_err()

Then, yes, it makes sense. I'll resend a version

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToVahAAoJEBx+YmzsjxAgKCkP/i3AdhKvjUgNrr6p79baTJ/M
PVcFc+AyiLrd4J2bpbGireGK0RuB7b6JDuK9UPt44IKAg4d82T+DaYRx1zJuAGTM
XJEChvy/bmL9ZKqzuSkhb45Y21kzN9reqJP7yhYxIelnPA8MHuiXL7U9qQHumODl
XUKgjdGzyfUCNTokvrAyaMEBN9VNEF3mDclXyd58kHOPSDFYf3+pMFuRLozTMbeX
AQqFgcINdGXttycQYiJIW+lxllVD/AH9Y+1J/dE1NIXEKrsJzER+D3zceNVHbGR5
Fa+FrSHHe0sAMptVwMCXyuw4K6RbycLpIsvxWh75elLpV3ykZyW0TdwAq8aUKaDq
NOfFygDEuLz3tWSl0TORW8R64D/nmQrDFNRj9u21ccShBIwpnsq6Z6+4Re9KFwHh
+PDTHxCMv2ZadV+xg4JSo+8VClJtSvbE0rVsq10QTpTK0oNln1Sl5VsPQZdbfwsa
c4iGKtZpfET7aLjetlBRvAt+6vA/ko6GYKuJ3SUJnilk//LM5jK1tE6OM42El8DD
/YoeuQlVYYYZc3FKgEAFgYPz7XBD2F7JCmU6A2MtAxocZ36NOMKfILAx6dZqrJ3q
GP0gtHI27VFCxG/3Qrhe58DTMfdOChW+Pxlqb+EybQEOS4z+sYnF3b8F7ukEcoY0
MFhknSBsPHG+4yAa96/z
=4/uG
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--


--===============2048301581270417441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2048301581270417441==--
