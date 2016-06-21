From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 04/15] clk: sunxi-ng: Add fixed factor clock support
Date: Tue, 21 Jun 2016 11:24:13 +0200
Message-ID: <20160621092413.GP26668@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-5-maxime.ripard@free-electrons.com>
 <20160621011537.GP1521@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0804287481365978275=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160621011537.GP1521@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0804287481365978275==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FRaepaAnLTQkJ4tS"
Content-Disposition: inline


--FRaepaAnLTQkJ4tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Jun 20, 2016 at 06:15:37PM -0700, Stephen Boyd wrote:
> On 06/07, Maxime Ripard wrote:
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_common.h"
> > +
> > +struct ccu_fixed_factor {
> > +	u16			div;
> > +	u16			mult;
> > +
> > +	struct ccu_common	common;
>=20
> Does this use the common structure although we have no usage for
> the members of struct ccu_common except struct clk_hw? I suppose
> this is done so registering a bunch of clks is easy?

Yes, when we discussed this with Mike back at the ELC, he said that he
really liked the approach you had the qualcomm clocks where you have a
single array with all the clocks, so I tried to follow that as much as
possible.

Even though it doesn't really make much sense here, indeed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FRaepaAnLTQkJ4tS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXaQe9AAoJEBx+YmzsjxAgG8cP/37TVecMg8O3pewe3t/MyUX2
mfsVCGso6c8U4Q/VoxN+K9gjVNfrMCvA6FsRhHnKTOCcuwwE0H9YlKtCmm6XPevF
htgzDSc5l/Q1+r3nfSPpxtBxWEhY91SDJ+D149fSgWj5n7/vTW065NhSSTaZHJXo
oXMuKC0cdlY3i3F+nVPL1gpGqUAJC52vNywh8lbMQapdnkkPBSIQaz3yWZCxEVuw
tR6lLuar9v4wPElwJeyJkSZHV57Et9SaybwAN4TOYaDQ3OH3zuloSZBA39hK7A7+
a0MhVAWTUkTfHGHrxxU4qXNN9Wz7A+olpwaq2zsRv+ksu+fcD9XMUnaFAJI0bqOZ
ydYJqawhHjAEHuqlXJF4f5rg9SQFsoZDOGZOjDwt9yyBH+uQB97Lgnz88bwaPjnC
qcDB+uiXx5NY5KsAIE2/0L3UHQdCWXDEOXpwolnEsJKlzDyw/MJGtKNePJzRJE+j
WFyPhgH6MeehZ2jX0Lkgk6vdqKz8CZ5DmHCL7OglrPWEi+C6qimwT1cq5eJ4HjBK
W1g7Vcp+sxPZSPIqSV0lbgmHW91+UrVO98+Mno+vqV78aEYAA3klT7K/VeL+GyP/
LnUZC0bbNRwtbumRxVBmrqojU9b8t53lKqvjXpYaoaDVJYOxPEBvBA9JlAjfX5Uk
mfd83zAKzhxf9Mlgu3Hu
=JpMU
-----END PGP SIGNATURE-----

--FRaepaAnLTQkJ4tS--


--===============0804287481365978275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0804287481365978275==--
