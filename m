From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/10] arm64: allwinner: a64: Add
 devicetree binding for DMA controller
Date: Mon, 18 Sep 2017 10:11:34 +0200
Message-ID: <20170918081134.obpoaiwd7dgzdcak@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-7-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h4xpe5swv5okxfft"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBN777XGQKGQEJKPMYYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-7-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--h4xpe5swv5okxfft
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 17, 2017 at 05:19:52AM +0200, Stefan Br=C3=BCns wrote:
> The A64 is register compatible with the H3, but has a different number
> of dma channels and request ports.
>=20
> Attach additional properties to the node to allow future reuse of the
> compatible for controllers with different number of channels/requests.
>=20
> If dma-requests is not specified, the register layout defined maximum
> of 32 is used.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/sun6i-dma.txt          | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Docume=
ntation/devicetree/bindings/dma/sun6i-dma.txt
> index 98fbe1a5c6dd..6ebc79f95202 100644
> --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> @@ -27,6 +27,32 @@ Example:
>  		#dma-cells =3D <1>;
>  	};
> =20
> +------------------------------------------------------------------------=
------
> +For A64 DMA controller:
> +
> +Required properties:
> +- compatible:	"allwinner,sun50i-a64-dma"
> +- dma-channels: Number of DMA channels supported by the controller.
> +		Refer to Documentation/devicetree/bindings/dma/dma.txt
> +- all properties above, i.e. reg, interrupts, clocks, resets and #dma-ce=
lls
> +
> +Optional properties:
> +- dma-requests: Number of DMA request signals supported by the controlle=
r.
> +		Refer to Documentation/devicetree/bindings/dma/dma.txt

You're error'ing out if dma-requests, so it isn't optional. I guess we
should just make it mandatory.

Once done,
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--h4xpe5swv5okxfft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv3+2AAoJEBx+YmzsjxAgp/4QAKPdySi93mLQnDCjsdpOT7qf
/9Z7gILHg4xLn0Cin6dP3OgPsZlmY4heoylBOLd4yPEr+Tg4CVJy1OpXppmN6dc2
DQaswqy/sHaz8xgm+GOEWP/OxFSQ33LC2NMUfhDPqjBbEVGq9Xs+wQfK6JKZhE78
RBb4lb10ow9RVuxTef2KKpH8oxCnnauYgl5xhaiKilLyjSAmA8ZwilWwGzmwsdPA
0IuV1GdvCaA6z+zQxBob4wQW3ZyO3/tavqDiRDc7ND9OXkTr1ptskc1A7ZHn/QKu
7Prmixm8XOGZ9crgLiQ1+Gh668Ey++rtxUA0sR6Rf6QZSILMzdsuFdjxKCClehvE
CzlIhS5hbiH4NeJqt2Q07RLdcx1Ss4fGWG+H0ALobicURYih1M6eLbOfj5aqnC+5
PmQIrsDx9j5/el0Vg9XmFGtG5xf6Jc3322hnQDqDG4KPxSZHMANCdi7uVS9hVnyv
Skt54TZ3HF/hETH67q54fHNSInCMX/19XSTA7EainuEmv2Ys4e7ExuH00dnztltU
VgkOiyWJpz69ZSQB8yYSuTHMMEjZFXMLp4y4PE2Au3RZtRRyBn/8BkqUn7n5j1Jw
Ef2zTwuc0MAoRVdHLyU8PMPro1WylttfdJpRd0KPKTSzIBrJNcqjILmUengA8Pzr
R2iqOYMY1PIt5YpurYTE
=N6gM
-----END PGP SIGNATURE-----

--h4xpe5swv5okxfft--
