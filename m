Return-Path: <SRS0=CDwP=QN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40460 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730467AbfBFNUB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Feb 2019 08:20:01 -0500
Date: Wed, 6 Feb 2019 14:19:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: tegra186-bpmp: Remove name
 property
Message-ID: <20190206131957.GM21676@ulmo>
References: <20190125145202.2982-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wAI/bQb0EMvlZCHl"
Content-Disposition: inline
In-Reply-To: <20190125145202.2982-1-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--wAI/bQb0EMvlZCHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:52:02PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This property is not used by device trees and was likely supposed to be
> a hint as to what the BPMP node should be named, rather than describing
> a property of the BPMP node.
>=20
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt        | 1 -
>  1 file changed, 1 deletion(-)

Applied to for-5.1/dt-bindings.

Thierry

--wAI/bQb0EMvlZCHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxa3v0ACgkQ3SOs138+
s6HfzQ//Zy41D3hYlfKPGeXMsoZWN9qrQEkg8TvbURjuCJ3ACIaHa70oZEdgxXmP
eG0VWuQ4V5+7NFxjEULurjqqTCckQ41pzM+2eIbz1uDMjCrwbESq4Mud+KfJLkXc
sgu+SiiSkf1vhCbfKpnNOhEEdFgigVkldJb8gbmjqBkEWXhP2xasy+QMm5GO9LxI
5VSfiImeK1EFFi/3r91SX3WYYFbnPHnSvLDQLDbn6hRD42rAQaI0s4xywBCqJoIE
sE8p7GxQgnh6rYYCYnemlM3ruLXG3Vmzs/Mqr6/OXIf2AK1IEE0uPGl031uTZrAV
B/YUTg/vtH0+HGX/n+ouSyKX9GuNNtTBHJbM+g300aCoKNgTC0/Zx0GHDz9T/tgn
odHq8gUN/s8DE9kWRmYwy+ChZHoBSVRucuGE6AfGWHiY5EE2Ahw+AT86F5OsQ+e3
j+FpwklQegA/Z2NiSgvv43+K9wjrzxzXH7gqxemVYursRStmzEMQqGA2yI5JiXvV
FlLQ3wJY4TozKg/153ADS/UKiVg4sGDkdJsdvjLBhhJ4cPSbobz38Eh9AhPnL2W7
nvV3Qgymk8uQu6XesnwCJ+jVEuyGKrstaIcE0nCEdj4VGPdLUoX06nm/s3IPQ+vy
9x7e3g87idiJTxvj3wu4ByOwMhYTa3XJ5Mp7Fso+2K0LAI2hCA8=
=vi34
-----END PGP SIGNATURE-----

--wAI/bQb0EMvlZCHl--
