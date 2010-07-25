From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH] of/device: Make of_device_make_bus_id() usable by other
	code.
Date: Sun, 25 Jul 2010 13:34:30 +1000
Message-ID: <20100725133430.4c1d38a3.sfr@canb.auug.org.au>
References: <20100724160111.7072.68144.stgit@angua>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5265362604675918065=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100724160111.7072.68144.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5265362604675918065==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__25_Jul_2010_13_34_30_+1000_nXz58B.vnmxVYCYw"

--Signature=_Sun__25_Jul_2010_13_34_30_+1000_nXz58B.vnmxVYCYw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Sat, 24 Jul 2010 10:01:11 -0600 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index e11a0be..249bc11 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -27,6 +27,9 @@
> =20
>  extern const struct of_device_id *of_match_device(
>  	const struct of_device_id *matches, const struct device *dev);
> +#if !defined(CONFIG_SPARC)
> +extern void of_device_make_bus_id(struct device *dev);
> +#endif

You don't really need the protection here - it does not clash with
anything on SPARC, right?

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__25_Jul_2010_13_34_30_+1000_nXz58B.vnmxVYCYw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMS7DGAAoJEDMEi1NhKgbs5VMH/RerPDpTw5xiodVs8cJl3aiP
X4Nwxd2naa0Xh6ZXlbSVhRNo8zvR+N6CMFEaEOrR2aWOgvWidRwkhlZ61kugDIl2
lbhEGmmtopBQe9M06p2Lr50HaJy3kLTQ6H2ZwGC7J8GwheKPEyG5RdZRQzY1oRb3
zFdYDhyXgX6UcPE7S4OMNuD96Z5dvXJKlXnKgukz91TwwbhmJGKZLZIpLuY5K1eJ
0dL8HzRWD59PEbs0d92Z1ozVKYdAXrrK+8xWcQXDbBlFi8e+gOeyRjIFK+N6+PZa
l3SKQwpZOFauypOomiy4hB0g3bwGoHYpuD4x80MMEAKq/P0u9KzsS4j2xkAJ1Pg=
=z+b/
-----END PGP SIGNATURE-----

--Signature=_Sun__25_Jul_2010_13_34_30_+1000_nXz58B.vnmxVYCYw--

--===============5265362604675918065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5265362604675918065==--
