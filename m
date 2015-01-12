From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 05/11] usb: gadget: at91_udc: Remove non-DT handling code
Date: Mon, 12 Jan 2015 15:39:05 -0600
Message-ID: <20150112213905.GI2858@saruman>
References: <1417606330-17753-1-git-send-email-boris.brezillon@free-electrons.com>
 <1417606330-17753-6-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rCb8EA+9TsBVtA92"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417606330-17753-6-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--rCb8EA+9TsBVtA92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 12:32:04PM +0100, Boris Brezillon wrote:
> Since non-DT board support has been removed from the at91 architecture we
> can safely remove non-DT handling code.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

doesn't apply cleanly:

checking file drivers/usb/gadget/udc/Kconfig
checking file drivers/usb/gadget/udc/at91_udc.c
Hunk #1 succeeded at 1710 (offset 13 lines).
Hunk #2 succeeded at 1722 (offset 13 lines).
Hunk #3 succeeded at 1958 (offset 13 lines).
Hunk #4 FAILED at 1960.
1 out of 4 hunks FAILED

please rebase on testing/next which I just pushed.

--=20
balbi

--rCb8EA+9TsBVtA92
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtD75AAoJEIaOsuA1yqREnL0P/0ZdPB46Byvm2oj9t56CEeZk
R2kBsJhznYqBJzUXMaccvjcP1HXr4HVQQhTR/dF52cus4nXHvNK2p9NQ/9Ja8Qf9
PhyPAoAryTrhQvc50JSOs9z1DsIE3uRwvRIRyVJrplMp04M+Bs6BVHj7s0BXkXOV
NkZJqcjKIonBxyHZ7+/4P1/cWCPoJ/JeE6F7Zs+Az6eOcH7KSphtVFRAULV6lC10
TaH5xJcEWPDljOzIgRKcAUljopldnnBo22+KJW2ErZf3EdIwTCZPL3Ae+4rlG1L0
4JAOOrYL4OaGACb5NdJ3j1dEx5/dJyF+jAUNq4JfgPyr0UzmZOc6bQ6u5h30LLNJ
Y49Ppgz2ohe3PydGi4cjrlwoVp0UrQzTa6E2s/EmPs0c39Omz9RrR5px8sSAyZQc
YBuP2a1qi83Kx6ftdeFoP8NQ6s4vOCO3ZjD7JwF08SSCYI1jqBebSX50/fSx7vIe
t1IURJqbXVOxnA7FCf5g5p6IeDxKjEtIL7W5JuRXT89CXz4z5IoSOxNOH13+J6iq
sSS7WygyBz+9QQQXCyqrbNyus7HNDSfCoOWPQPcKlHLMkkutsNPlcTBCEUM+I4pN
Lx7XQW7AFNtIzM41qdOQfROzYOfJCZDeA7zpBgjSHHQe2oehgow5gkDTQuLQQAa0
qZxv5X3Vq1za1z9rfY+C
=uDD9
-----END PGP SIGNATURE-----

--rCb8EA+9TsBVtA92--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
