From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 13/23] regulator: ab3100: refactor probe to use IDs
Date: Mon, 22 Apr 2013 13:37:49 +0100
Message-ID: <20130422123749.GJ30351@opensource.wolfsonmicro.com>
References: <1366624634-6579-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0291490296007375961=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366624634-6579-1-git-send-email-linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0291490296007375961==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwgQ89ZNnFUwFHTC"
Content-Disposition: inline


--rwgQ89ZNnFUwFHTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 22, 2013 at 11:57:14AM +0200, Linus Walleij wrote:

> Hi Mark, seeking an ACK on this to take it through the
> ARM SoC tree.

Since the arm-soc tree is locked down now I may as well just apply it so
it shows up in the merge window?

--rwgQ89ZNnFUwFHTC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRdS7ZAAoJELSic+t+oim9SBkQAJJgwteVwBhzOH3PEpoe7jze
+/8HoRceVw1s71vhzZpEDJ5OM7Imwjmy3PgL34G6evZkC/7r+7gQBKR95+vd9sKf
NrRPZ2aWFD2PL9E6ET8MXjP3ybf/wYhbHPQ5RPwBLRWCb6vfg1pkWnV+HsDiC4a/
yTE2zo4e4S3RYB0T7WgMnj+C6rtRKYGvnhi9O2FnQOXMUUt023j2KfHRC79C70Pj
4yDo/DFKFI/z9T4x/Am+l+LN2slr6RDFDSIrgHAYOOLXgwpagWv2EAffL1CihIyA
SsOa0ASqjiA4tTUNkxIszm1FN5lteL7ysegfa9D+YYIxBu0D3rETVW3ZUXp5tfF0
JQhLwQLqPxaEJSy/ucybbtm9GkvN+1tVwh1sDKbfMETTAoPcr6a9V5fgWUz+tonH
lI4SklcW0dQggbedcHVuPj1YPFSicwO4kJBEHF6EkVHjtCtNOZjiQ13s18b7t6rr
tR7EAM9TWYgYvfIUl6zYYil4nJKmxYRCv7QtOKRe5bHDtIxS4eRe3U6vKNaWPFEw
BmSI+zL4MqQqKVdruvdl74VI9VtuoY3WN+Ee35ZlVyFQ0GOCHsril4GkfVkQxxza
rqBc4EKGToiTU9oppMQtiX7vGLgPEsDdXeB8q36oNU4YCfmx66ATf3O3SdPFa0jr
87RITjOgEMGRKdGiaPEL
=DdYj
-----END PGP SIGNATURE-----

--rwgQ89ZNnFUwFHTC--

--===============0291490296007375961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0291490296007375961==--
