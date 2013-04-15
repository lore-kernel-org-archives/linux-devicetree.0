From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/10] utilfdt_read: pass back up the length of data read
Date: Mon, 15 Apr 2013 19:22:06 -0400
Message-ID: <201304151922.07391.vapier@gentoo.org>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-3-git-send-email-vapier@gentoo.org>
 <20130415045838.GI16400@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8534316692254635531=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130415045838.GI16400-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============8534316692254635531==
Content-Type: multipart/signed;
  boundary="nextPart34166819.M5jEI6o6Ba";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart34166819.M5jEI6o6Ba
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 15 April 2013 00:58:38 David Gibson wrote:
> On Wed, Apr 10, 2013 at 02:29:07PM -0400, Mike Frysinger wrote:
> > For a follow up commit, we want to be able to scan the buffer that was
> > returned to us.  In order to do that safely, we need to know how big
> > the buffer actually is, so pass that back if requested.
>=20
> Rather than changing all the callers, I'd prefer to see a new function
> implemented.  The existing utilfdt_read(), which assumes the caller
> can get the size from the fdt header, can be reimplemented in terms of
> the version returning the length.

ok, i've added stub funcs that take a _len param and rebase the existing on=
es=20
on top of that
=2Dmike

--nextPart34166819.M5jEI6o6Ba
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRbIufAAoJEEFjO5/oN/WB4OcP/iIOWyS1clo8IyntZauMWXIo
CNQJtus80heQ3qpnhrb+baRnQ4D7l99gHBZ0bqpqlILEXMtSdoN53jtkhGyvfDaC
5l2tNGLFisCljkdDK0BNLjzuYh/TWBkdqlyIc/8vcXBQA9qjgpQhj3S7d1XCuy03
CJBKU2buLPxZheszuX4pRu1U/FVNGE2xenlULMFdqyB/4sSv61lVuMNj+Iqa755C
sod6s3/GYVZDTMEurBwaJfqro29X74Wzbr7f7uJ1/GxVnPSZB4O38o6E/CmjjmIZ
GgnSI5eM3jD4e5N/CodCIk/IAF1fDPgbFgiOYZZTCuj4Bj+8Wwr3q08xFwKtQrtt
8Z0pwNS2cVbQKtuonHJYepvz3r1psswILwPEpygvCy8Ewo1k7uzEvnkxw7zoUZ9b
9+aibZFgacUoybNGwfu338SBqwrL2XkFT2wnu5m0YMvFaFMHTmG5L601wuWheRES
Cw5Mp+tVEm3AjFPepm+2ffgpjdF/cbUHmziKUrrTHMhu4zDxI50/B4fLYdHarBvr
/ZkEn9Q0I94fKkFKvx2vE4lhPUb2N5RV2jDhMIdqONIGUhQddNybWvJ5WUhjYg1D
mMf39zIHmEXiR+0RdpNUDnINhK9NRrTaM+lDttalLIH62K9jvu2O9znepjpCfWvo
1mX3MUXpm0jTGxvkyGAh
=+oJM
-----END PGP SIGNATURE-----

--nextPart34166819.M5jEI6o6Ba--

--===============8534316692254635531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8534316692254635531==--
