From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mtd: st fsmc_nand: pass the ale and cmd resource
 via resource
Date: Thu, 11 Oct 2012 14:15:21 +0300
Message-ID: <1349954121.12014.9.camel@sauron.fi.intel.com>
References: <1349356456-13371-1-git-send-email-plagnioj@jcrosoft.com>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5810964873148559958=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1349356456-13371-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5810964873148559958==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-mmD2qDIgIXUqRamvHdzi"


--=-mmD2qDIgIXUqRamvHdzi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-04 at 15:14 +0200, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> Do not use the platform_data to pass resource and be smart in the drivers=
.
> Just pass it via resource
>=20
> Switch to devm_request_and_ioremap at the sametime
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-mmD2qDIgIXUqRamvHdzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdqpJAAoJECmIfjd9wqK0sAEP/0RmpdhuUygucA+ZlF9HufDS
BYSmUJVMkuKZoZuAlHhFGxgGWNdCVbp0lnZ9DjkAQTVbszT9ECzOBlwJee/cAcPZ
UZQMQ4CbwWQx0nR5tjWMNa2JnB04hn7ciE8VxtftX4CGur6/d2HwajLDfn2h1ylF
bSHxu09YCZkvmfcmAenecQWCn3zFiqK9dMrP1N+ZQFMdnJDgeN20MPaVts5VVwxd
lcAh3OV+I+wIca2z3RDNqVwo4+WQ7qYys+HKUWl8cc1gkw/H9lArgi07Dz4V2Bvc
RIXWys6qb7uBJq6coVR62r3GJNHC+n/RoTsiWcdpago3Wspz3Rf4VVja4qfQCK55
qqgTSDzhxQXTQIeVVQ5XIWt+9n0cLzhExJjpneIkyqh+9GRZRRbHbBrDzK9lBcMl
TEJLH42eWWZicqdZOzbOpaF6j9WjLlHoUwpmbKcKdoHeubGD/R1x7hTm4YfAGZDL
YwWYBinLA55g9a3Z7At6fEoWGa/Mmo2KtFfpLZ/xzXgYVw7hhFeRei3ujFLK/ts1
2ItCNYlhKeDNJGuDawj3/odPE05IRC+etwdqzpYkv7elucWhruV92DrLLgGpEeK/
naXNeFE6xxqeiRiXd4wo/fWVMnQtTsHSJWLaMafDtLKiEddXs7oZuZTZbY5B+V+a
sagquHKHOVB39cRbC/mf
=v4C9
-----END PGP SIGNATURE-----

--=-mmD2qDIgIXUqRamvHdzi--


--===============5810964873148559958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5810964873148559958==--
