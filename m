From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] of: fix a build error to f_graph_get_endpoint_by_regs
 function
Date: Tue, 23 Jun 2015 16:43:54 +1000
Message-ID: <20150623164354.00844400@canb.auug.org.au>
References: <1435040094-22793-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1294390866=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1435040094-22793-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

--===============1294390866==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Qg9kB=Zkf.OnMcRxw2SNEV+"; protocol="application/pgp-signature"

--Sig_/Qg9kB=Zkf.OnMcRxw2SNEV+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Inki,

On Tue, 23 Jun 2015 15:14:53 +0900 Inki Dae <inki.dae@samsung.com> wrote:
>
> This patch fixes the below build error reported by Stephen,
> 	https://lkml.org/lkml/2015/6/22/665

Don't do this.  Put the errors explicitly in the mail.  lkml.org URLs
are particularly bad.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Qg9kB=Zkf.OnMcRxw2SNEV+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJViQAuAAoJEMDTa8Ir7ZwVKx0P/AkGvsDsBUmEpMn4U5WHECn9
xX/3Bv3Pytix+/aXjeuSHxvM2CnTUVXOEYihy8bB+8Eo1JuqtPYZnLgpR20jsHaU
/ykES7KGUeaqxRiWWPGjEdelZUR7Q5tGTpc/OwZqHbvAGwvlKW94fX8ybkM9Zkf2
f22UXBKv8YvEEi6RPLoCdIEx3yBiY0V3m37Th0mQ8ERtRRp42or4vZ5bIPls/bDv
OkUo88+U2U4cu36fKHqkhyHLNi+WO/vUAQqDYr7SICDBiIFET+nCuoDJmTTxs+Cg
yyArBeVuYv6iW8fjiZAGuQWWJtzj56QPDYsvHkR/Qul/vS6yOxKjvuIlrqpKCZqF
8yCNnWb/TleUnE96uPz9btmuacaP9uckLf781Ds1JY5p1c6hQ34Y+cXn97C7c2+q
hCswKMxHXDjXQw+cefa6TUi7wKNyc5RlD2Y2ejZEv4pon/6a5quPDSvbOGfi+kgv
rRiY+lICWqoa/tFwqBi9C6qwKsytkIAEaHgZxjzCSMQB1MpS8uFwgTJPR2R+r63b
WV3psCHCnTnpqyDgcnQqdhJWbWvQ7c/kk7lOt+lvb7lZZLLGIqoYldTmCPp3pp0T
b1Di/FH8QVqHv8heaULzM9Q1CjrQIsEko9aJigw5v2KhhlV8a9AmKW9Z1uG1Zeuh
6QUeY4fjON3G1uIqEC41
=vOu2
-----END PGP SIGNATURE-----

--Sig_/Qg9kB=Zkf.OnMcRxw2SNEV+--

--===============1294390866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1294390866==--
