From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Devicetree support for enc28j60 SPI Ethernet chip
Date: Thu, 18 Oct 2012 12:39:37 +0300
Message-ID: <1350553177.5769.307.camel@sauron.fi.intel.com>
References: <507B04AA.1050502@vanka.net>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2970455929249393599=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <507B04AA.1050502-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
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
To: Michal Vanka <mv-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
Cc: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org, lanconelli.claudio-DtroZxfa9uMAvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============2970455929249393599==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-iYU7jbEjY5Pe8jqeSAZ1"


--=-iYU7jbEjY5Pe8jqeSAZ1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-10-14 at 20:30 +0200, Michal Vanka wrote:
> Hi,
> the following patch adds generic openfirmware/devicetree support to=20
> enc28j60 driver.
>=20
> It also adds support for custom hardware based (FPGA) "interrupt line=20
> deasserter" for processors with level triggered interrupts
> (for example Altera Nios2).

Hi, please, re-send with

devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

in CC.

--=20
Best Regards,
Artem Bityutskiy

--=-iYU7jbEjY5Pe8jqeSAZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf85ZAAoJECmIfjd9wqK0KecP/jtw/9B1DGC8guGyIzExM4Rv
fi5+N7sH20SAfv40RKONs1PdUPiANkv1GCKQjWx+ku7i7H/8ukQcL79QVOgnKPtK
VlypVFxc+UXifqE3cs7AZwjcTldsQuwKYBVwpfZwC+baLsSANiEdQ9azpm9cOQDg
6Pm6gOyJTHAwJJq+/820OqLJ13KWB8g2kmDUuUfiyhLa61QInHqRloeve+sYbUZ2
S310EV1kMvtf44QlVZuigav3KcT5+AQYe5GFfxamueaagWzZYZcxTvZVIviiiBQa
iS92HQgt2OArg43U0KBSxjMK0iaXXhjOd5He+Ys5LLOhPoZXPmszQZ2ITbTuHcge
DQlLLOdksZC7+xw6qkIp/lsbSMwO+DOhFaFSTIOR2Jh4/45HzNEPdjLa87MwowQd
3LZhfRQnPqNXLeUuHSVZYde1RXsgmrcfYJyWUqSHX33J7yROBLkuG+OkzBEJqmp2
BWQB2LWz4AJTPQ3EhlZ9o39z5geC1ie3i9VJI25OiMM7CBk0ESh1pHnIuL6tjHOk
TOJNNX+fe3z0I7xePTv9GS5qRvdgS9j5SiOP2ftIZ9c8QhTr4P8SzKrSIPYASBK4
bkCe8Q/G4ygOMXdjPkW4qZA6JE7W+J0ngVk/uy9mBFsAVZ89H/F5P6As6+0ElPNB
2pCHM4t/G/JjQ1zW5sPH
=P1q3
-----END PGP SIGNATURE-----

--=-iYU7jbEjY5Pe8jqeSAZ1--


--===============2970455929249393599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2970455929249393599==--
