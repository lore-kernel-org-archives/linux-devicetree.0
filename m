From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [RFC] drivercore: Add of_match_table to the common device drivers
Date: Sun, 7 Mar 2010 18:07:44 +1100
Message-ID: <20100307180744.956998c5.sfr@canb.auug.org.au>
References: <20100307064111.1442.63478.stgit@angua>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5492554108190086775=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100307064111.1442.63478.stgit@angua>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kay.sievers-tD+1rO4QERM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5492554108190086775==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__7_Mar_2010_18_07_44_+1100_t/SLSVRYrNVMKvge"

--Signature=_Sun__7_Mar_2010_18_07_44_+1100_t/SLSVRYrNVMKvge
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Just a quick note:

On Sat, 06 Mar 2010 23:47:00 -0700 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asi=
c.c
> index 67fe13f..a5806ab 100644
> --- a/drivers/macintosh/macio_asic.c
> +++ b/drivers/macintosh/macio_asic.c
> @@ -40,8 +40,7 @@ static struct macio_chip      *macio_on_hold;
>  static int macio_bus_match(struct device *dev, struct device_driver *drv=
)=20
>  {
>  	struct macio_dev * macio_dev =3D to_macio_device(dev);
> -	struct macio_driver * macio_drv =3D to_macio_driver(drv);
> -	const struct of_device_id * matches =3D macio_drv->match_table;
> +	const struct of_device_id * matches =3D drv->match_table;
                                                   ^^^^^^^^^^^
of_match_table

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__7_Mar_2010_18_07_44_+1100_t/SLSVRYrNVMKvge
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuTUMAACgkQjjKRsyhoI8xYvgCfSaC9bQ7bF9GWY3q/HYpa96fm
h4wAn0u1SZgN6+q95twIDeqPglbbcxlX
=zF28
-----END PGP SIGNATURE-----

--Signature=_Sun__7_Mar_2010_18_07_44_+1100_t/SLSVRYrNVMKvge--

--===============5492554108190086775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5492554108190086775==--
