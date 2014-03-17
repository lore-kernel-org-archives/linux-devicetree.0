From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Mon, 17 Mar 2014 11:55:18 +0000
Message-ID: <20140317115518.GD11706@sirena.org.uk>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
 <1395049541-28128-8-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1395049541-28128-8-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: nicolas.ferre@atmel.com, Boris BREZILLON <b.brezillon@overkiz.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 17, 2014 at 05:45:40PM +0800, Bo Shen wrote:

>    - compatible: "atmel,asoc-wm8904"
>    - atmel,model: The user-visible name of this sound complex.
> +  - clocks: A list of clocks needed by the wm8904 chip.
> +  - clock-output-names: Driver related clock names. Shall contain "pck0".

If this is a clock for the CODEC it should be documented as part of the
binding for the CODEC and connected to the CODEC in the device tree
rather than being part of a machine driver binding.

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTJuKjAAoJELSic+t+oim9ZiAP/jR39IUYtk7IKqBgV0K7XNpD
q0M0ebzD5GOn60zrRepSVThsOK+tslzW/hIEQiRtJ/YDHyP5kNxXcBrhQd16xhT7
2JlgF15o2oO5sc3lwbF7wzytulSMGn+qhRCybqJliZUBROGI48HaQH6ANX1yTlrq
DZt+K6YWUJNeJBCU2XFYCOrGmi29PbBjl+Li8PX3zcoBG0LO/gKAxIi7xS+suMEj
C3CxSEkv2E210CJ4Ienx1amOmNTwiOOM3cjy5d66bQIGvYxfAzaMwB9ptLZjm8S0
wjTIQWz3ICo3vncsnl8Vur8b0WJmv2KXFM773JwDloCLwNUZGotEaT4JCExTVZ0d
4gMbjUcnHKxaUZYgq5RryilS9GWoSoM0PB5z0vDJ5yur4JZq9k0zzPf5nh2/yzrt
BNYjgxfdx3oWkqZBpekVkGZ2IagFiOoC+94mfjuxKwE0Llw4C4y82zcVmtzRzgh1
nh36QnYWbwzMz/uADbn36pC3ww70c4lxXOujP1MPdFqs1zOQtpS+wOuhN+9IcGR8
05W8KEbkDGteg4JcSq0GX0L+6H7uDPtI3VCFXEsw6es4OKMp5RsWVLblsm5hntja
GYNg891vXRGj8idTz6iWLL5kjCRWi84RnFvV4ZMn8PXYpvW+IrComI9QHhrM4L/B
IBesqsKPO9XX9opHtYDH
=W3NA
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
