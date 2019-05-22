Return-Path: <SRS0=RGXl=TW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7624 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfEVGiS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 May 2019 02:38:18 -0400
Date: Wed, 22 May 2019 08:38:14 +0200
From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] of: resered-memory: ignore disabled memory-region nodes
Message-ID: <20190522063812.GA24329@ulmo>
References: <1558503353-13179-1-git-send-email-puneets@nvidia.com>
 <1558503353-13179-2-git-send-email-puneets@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1558503353-13179-2-git-send-email-puneets@nvidia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Puneet Saxena <puneets@nvidia.com>
Cc: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org, vdumpa@nvidia.com, snikam@nvidia.com
List-ID: <devicetree@vger.kernel.org>

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 11:05:53AM +0530, Puneet Saxena wrote:
> From: Krishna Reddy <vdumpa@nvidia.com>
>=20
> Ignore disabled nodes in the memory-region nodes list and continue
> to initialize the rest of enabled nodes.
>=20
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  drivers/of/of_reserved_mem.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 1977ee0adcb1..58d95d774e3b 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -314,6 +314,7 @@ int of_reserved_mem_device_init_by_idx(struct device =
*dev,
>  	struct device_node *target;
>  	struct reserved_mem *rmem;
>  	int ret;
> +	const char *status;
> =20
>  	if (!np || !dev)
>  		return -EINVAL;
> @@ -322,6 +323,10 @@ int of_reserved_mem_device_init_by_idx(struct device=
 *dev,
>  	if (!target)
>  		return -ENODEV;
> =20
> +	status =3D of_get_property(target, "status", NULL);
> +	if (status && strcmp(status, "okay") !=3D 0 && strcmp(status, "ok") !=
=3D 0)
> +		return 0;
> +

Does of_device_is_available() not work? Other than that, looks fine to
me.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzk7lEACgkQ3SOs138+
s6EMOg//Q2wxWFHcn+HZDqF3ajnr6B9r9j/l+8U2CvCcXowugiB1wwznnWaLL1Hb
hM8gQ/Mb0/72fGoZ5hQN5BJBZBiZk977HHQjut/guM49FRSlFkDn85uQiYs+lkik
ZSIEF/YRXImfrxx+a93GzIo4VWeYs4xRP0yMWzE9YyFRm4JC4V40FHi0w4/o7mX5
Y36bwYUvqEojzb2jacd0bXv+vDiQFj1CY1IMx0DlZvxDYLq0dYlzkf2Oso+e/G/c
N3NmqAIcZXRC6x/p2ZENlio1JhmBD5iGX2IzDeqabJtiyQ1qpPb3ydQlT512zzLH
YHIuZFP2K1Is8vE5zvpLiT+uNTBr4cT746hD1FVNTWu2mKlVPDt2s3qQl8Z/g2Sq
31ib+Ncsv11qv5GnLZ3cjVTdb/ek6wWHnNmxKoz4HZe2gYn+8IdsOnWrfz3jsXUi
Ul835PqbIwkJ0UaTlTXdYCTpmtXN4tXNMUrxc9QcUnu/NjfuJSvSMtDq1Y7pLY/T
kYRg8J74IE2BG3r3SThOrh6j9uVMswwqejeRALsuI5sEm39mguiE7TM3xMNPBxQz
YSlCGzYwUDdYZDqJSBwIqE6WSj2fI0wPb3hBfMSMQNxwk7bQ7YUJUFAILOM9oG+v
quQBOx9o22jutuvgrm6QiK3BlsgSlxVYVt/nehw5RUSnyWmOykc=
=X+WB
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
