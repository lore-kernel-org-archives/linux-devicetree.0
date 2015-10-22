From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v2 0/2] simplefb: Add regulator handling support
Date: Fri, 23 Oct 2015 01:53:06 +0900
Message-ID: <20151022165306.GB8232@sirena.org.uk>
References: <1445407141-16459-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3658623181464895614=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445407141-16459-1-git-send-email-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3658623181464895614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/w6WUUxYkubDgwa5"
Content-Disposition: inline


--/w6WUUxYkubDgwa5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 01:58:59PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is v2 of the simplefb regulator support series. This series adds
> regulator claiming and enabling support for simplefb.

This approach seems reasonable

Acked-by: Mark Brown <broonie@kernel.org>

--/w6WUUxYkubDgwa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWKRRxAAoJECTWi3JdVIfQcpMH/itm6cjqTgugRBjNYytJ1IjH
7BdaX8rCLmk+oJW9iZt/PXmW8W9/OO0hDP/Fd+WOqM1adTFWcWm3IkdAenBM6wPJ
5ADDqqVTnrAxzRttDglO4FnnClbzMFaCZ2UGU1OmTe/PuxOH3kFhAmx+PeFF+FuH
3PCeA27ItN+l44eIQhJQXFa6MGMA6JmtiTsyBn+qocDJFQisiJxHvuuYmy6X6E9d
HZlun+Ir3EpaK/4L96H6bgNgc2/74SRHA3via/PMYY3IwpO+wAmg5J8k1McKuhPx
7BwfeXpvlvbNsmF3PT7HA0vs2Kp0kDAGbF2xYxEvDkMt5jcDCqlkL9YWOmBx8Qo=
=0/WQ
-----END PGP SIGNATURE-----

--/w6WUUxYkubDgwa5--


--===============3658623181464895614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3658623181464895614==--
