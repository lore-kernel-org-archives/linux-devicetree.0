From: Mark Brown <broonie@kernel.org>
Subject: Re: Question about fixed regulator DT properties
Date: Wed, 26 Nov 2014 20:36:10 +0000
Message-ID: <20141126203610.GY7712@sirena.org.uk>
References: <546B5EF9.3080102@mentor.com>
 <546CAB49.8030103@mentor.com>
 <20141125121749.GV7712@sirena.org.uk>
 <54760D6A.9080306@mentor.com>
 <20141126175304.GM7712@sirena.org.uk>
 <5476266E.9040901@mentor.com>
 <20141126192021.GU7712@sirena.org.uk>
 <547630AD.1010108@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SHRM/EOepzdjttEK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547630AD.1010108@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--SHRM/EOepzdjttEK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2014 at 09:57:33PM +0200, Vladimir Zapolskiy wrote:

> If "regulator-boot-on" is specified and the regulator is untouched by
> bootloader/firmware, then the kernel simply enables it.

> As far as I understand the latter side-effect is exploited on quite many
> ARM boards, when there is no defined regulator consumer, but I agree
> that it looks hackish. My assumption is that probably fixed regulator

It's not just hackish, if the regulator actually needs to be on but has
no users it's actively broken since the core might decide to power it
off at any time for any reason.  Such regulators *must* be flagged as
always-on.

> logic around "regulator-boot-on" property should be changed, so that the
> kernel will not attempt to physically re-enable/enable the
> "regulator-boot-on" regulator at all, then misusage of the property
> should gone forced by necessity of finding a proper regulator consumer.

The only boards which might be able to get away with this are
non-DT/ACPI ones which aren't getting merged anyway and it is in general
going to be better to expand the set of cases where we do the disables
(since it saves power).

--SHRM/EOepzdjttEK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUdjm5AAoJECTWi3JdVIfQeckH/1Q92XiUUs7wTJbHUFPsBfzc
TiJJUUuyY7I54A+mtxNFmXAVwL6nrQ5shEtq5Z0ErgbBKXwNnFkZKV8qrqHoxNJj
V5ZhkiN+hp5a2Wg8H9mtuUTO8sTQmHFgXSSHQAMQeu5lrRBxr/9X5SJhqqkYLgnr
YAQrT7pCU7UNf2ng9ZskPqjXVy+3GNjPzsdplsCbsPGZ6bmHEaM/+070WaEP1kO2
lw+/Yx368NczQyN4rPUDRwgqiNFLBPxSmm/1SGp/ZkeX/zHEem7xDpZf8uJUCujB
yZWieTJjBGqo1Ovje8qOcbINmvrxyc1wDESOYAJ8xL4bnljp3IWPgTl6dWmv4a8=
=lXYu
-----END PGP SIGNATURE-----

--SHRM/EOepzdjttEK--
