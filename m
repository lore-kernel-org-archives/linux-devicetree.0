From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] dt-bindings: cpu: Fix JSON schema
Date: Mon, 1 Apr 2019 11:10:50 +0200
Message-ID: <20190401091050.cwph7xlpv3pmkwnq@flea>
References: <20190318100521.29109-1-maxime.ripard@bootlin.com>
 <CAL_JsqJ_LYycXazkdP2Q=e-jynKiX+z5En0bz0AWpDjsevwQTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2tjdwgjf4v6o3rdy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ_LYycXazkdP2Q=e-jynKiX+z5En0bz0AWpDjsevwQTg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ARM-SoC Maintainers <arm@kernel.org>, Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--2tjdwgjf4v6o3rdy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sugaya, Arnd, Olof,

On Thu, Mar 28, 2019 at 02:35:54PM -0500, Rob Herring wrote:
> +arm-soc
>
> On Mon, Mar 18, 2019 at 5:05 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Commit fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for
> > Milbeaut") added support for a new cpu enable-method, but did so using
> > tabulations to ident. This is however invalid in the syntax, and resulted
> > in a failure when trying to use that schemas for validation.
> >
> > Use spaces instead of tabs to indent to fix this.
> >
> > Fixes: fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> This should be applied to arm-soc tree having the commit.

Could you pick up that patch?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2tjdwgjf4v6o3rdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKHVmgAKCRDj7w1vZxhR
xW1YAQCR/A/H5YjdmsVxCdhdYOcorF7S6Kum5Nfjp8cTGgEPmwEAttw3vzwXSa4I
TDaAxsQ3rSpABs4PIS2QDbqgIU2b0wY=
=qVao
-----END PGP SIGNATURE-----

--2tjdwgjf4v6o3rdy--
