From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: sun6i: Add support for
 Allwinner A23 (sun8i) variant
Date: Sat, 20 Sep 2014 12:33:56 +0200
Message-ID: <20140920103356.GR2166@lukather>
References: <1411010680-4481-1-git-send-email-wens@csie.org>
 <1411010680-4481-3-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WKQ7zUpzoH2KEHMN"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBV5Q6WQAKGQELCKBA3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411010680-4481-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--WKQ7zUpzoH2KEHMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2014 at 11:24:39AM +0800, Chen-Yu Tsai wrote:
> The A23 SoC has the same dma engine as the A31 (sun6i), with a
> reduced amount of endpoints and physical channels. Add the proper
> config data and compatible string to support it.
>=20
> A slight difference in sun8i is an undocumented register needs
> to be toggled for dma to function.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--WKQ7zUpzoH2KEHMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUHVgUAAoJEBx+YmzsjxAgfs0QAIC/9JiDK4PXlYruKh1cldiH
RU2b3uqcfV1UrCPRCJzW7z4hoxkskterpr/xIMS8DpvnXw2uUNTdeIqXfVWOnTTR
alAfwpOS9X61LQISpGbQU85kW8SUoQKANwfTpmaL9nJKdrMk9Lm6S34rKC0ewBfb
3/Luqfz3ZJ+U36hAhnpeWLZziZPXmKeAIazgBJGIf73fe1kS07JPxZ07B0R9x0dl
j5AXOruFbr/pFfdDakyzTF+UccM52XMxyl+CFrtkgV8s2bZ3lwl7JCF7fcmV4FT+
6z0B1DKcgt1qLITcyO/NND2XmFwA4gNKr29DzvDWQvEKlwoNBEnn4V0wdiz7dDE7
5CJLNwO2HYyH0u8bAIlp4bonrpArQnjtkDeMdtyKNAwyPlzwK9SamFZpIvnKG8mg
yWWs3iltH4bINWYasD7mfZdcsjiazIJ+5I9yZ2CGNgcEnW+hvY28QK/hGhbHiK3J
emCQ8xBI4EyNGpAUTI15KtneZP0m9kEt4XEjiYK7yAmUFTxziOEo6939yQw2q0SZ
QkvDyS4UMPmyfK7Bp20SZ9PKLD5J/bwUR0o1+EmACrkQQq++8+J8ias9s/a96wwM
Qyxh0C//xVNmNJqdyID1a8+tIlKHKeC+3jaQsGD1QFOUsD/NtTDB8BX8howcA88A
O278DaU3PlQytitlfTHk
=QXlq
-----END PGP SIGNATURE-----

--WKQ7zUpzoH2KEHMN--
