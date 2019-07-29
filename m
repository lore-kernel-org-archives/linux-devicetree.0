From: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH 12/15] arm64: dts: msm8974: thermal: Add interrupt support
Date: Mon, 29 Jul 2019 11:03:46 +0200
Message-ID: <2812534.bLfc0ztHNv@g550jk>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart47414754.PgozLFlKrf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, masneyb@onstation.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--nextPart47414754.PgozLFlKrf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Freitag, 26. Juli 2019 00:18:47 CEST Amit Kucheria wrote:
> Register upper-lower interrupt for the tsens controller.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
> Cc: masneyb@onstation.org
> 
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 36 +++++++++++++++--------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 

Hi, the title of this patch should be "arm" and not "arm64".

Luca

--nextPart47414754.PgozLFlKrf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE66ocILd+OiPORlvAOY2pEqPLBhkFAl0+tnIACgkQOY2pEqPL
Bhkyjg/8C4wIk+65w28F4Xcc3cdIuUZypP6UVkCguRZF6zUkrBdjETjJDUhXz0+a
Oyb44HxdAgQ7E/UqfEozAvpB8z3H5sBFrP6dykqMu3CQtOzPfB1ILhbn7+V+VToF
bmmuVcxEOnTCgoJb730JL06PvmUUMs/7W9gwAUjCVdp2DymS0OQJ3awSIxugE2GA
itAxee+KyTq7ttQRK2n3efOlaCqAf3jll7jl7xDBwodJa0uJi2tUhD4b9ZhFpA37
DCDsAY3wh/KJkf3uN3coZFTT3K635HZ0hP/7Kx9RK6TTXuCVJPyOXqRdw66rO74d
8sHy/yrqgByCVZex9lMuTcPyQZq3usZnAEakCMM/MPGuVclhSQhtVF8Xt0Utw5+b
FZlhg2gBflZHv2WLxNMdS/NyF28GN86e4uMJ7jusYxzVu+XBWeY8HGkqrxBdUFYn
khInFKGamOPVSXQYrmNZX8LW/ZciyNyB6ZOrFOO0aiE5cVsYZEWcmiWqD58XXNzc
RYupWAtn+ajc0U6mD51PAy2EvX2PFnyK4yxjXbeGT+0fZwQGWUQLFytF7ZBz9QPe
dZ6jedXlUOfVP1pduqgMJ5Vl6zjz7gN1ZIJOpAqqKT2Ttgy/4fRGcRwaswPSAlhn
0bxCZzt8QDr+gR9a5eMjr70Q5OGObzj8gPaxWFCjKpPcqHzRXAs=
=Cmln
-----END PGP SIGNATURE-----

--nextPart47414754.PgozLFlKrf--
