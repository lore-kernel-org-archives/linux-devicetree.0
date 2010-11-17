From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH 0/7] Various OF fixes for little-endian and ARM
Date: Wed, 17 Nov 2010 11:07:06 +1100
Message-ID: <20101117110706.74ea16df.sfr@canb.auug.org.au>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4296008808650335411=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1289939635-30742-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4296008808650335411==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Nov_2010_11_07_06_+1100_Jytv82HdiKqH5TIJ"

--Signature=_Wed__17_Nov_2010_11_07_06_+1100_Jytv82HdiKqH5TIJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, 16 Nov 2010 14:33:48 -0600 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>=20
> This is a mixture of driver fixes for OF on little-endian and ARM platfor=
ms.
>=20
> The last 2 patches need more thought. Currently, it's just copied from PP=
C. There=20
> are some ARM platforms which set 64-bit dma_masks (iop13xx and orion5x)
> which is not handled. I would think 64-bit PPC would have a similar issue.
>=20
> Rob Herring (7):
>   OF: make drivers depend on CONFIG_OF instead of CONFIG_PPC_OF
>   of: Fixes for OF probing on little endian systems
>   ipmi: explicitly include of_address.h and of_irq.h
>   mmc: sdhci-of: fix build on non-powerpc platforms
>   mmc: sdhci-of: support generic OF controllers
>   ARM: add dma_mask to pdev_archdata
>   OF: set dma_mask for ARM

I think you need to change the order of these patches so that the fixes
for the bugs exposed by allowing the building of these drivers on other
platforms are before the patch that allows the building.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Nov_2010_11_07_06_+1100_Jytv82HdiKqH5TIJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM4xyqAAoJEDMEi1NhKgbsP2MIAJfBLKHy2qHCchUC4BKyJPxB
75ZI9IKRemXnSjL1mD1jWodDYUrIT+4mr5PejD0KVeZsrqlS4KPSZyFjafM9fenB
v89Ukx1diW2222pxVq3byGkCob0UDNTJ0BKftPjpM5WX19xzfn9/dXA/WWL25LAk
221rqNxXSaXwqf3WcWXUu5DMQ3p1OdeOPRxMcDbwaFMFUxgibJgSFA8dse6l/KMl
OQDwPfBGL9LOYRPUzsSIOvulYToRQQ9LybUp9K8OkPgSH1daQlowhoGsCw/3DKnQ
CdG3bVL8LkFChRFjLnH4stnRS3ICpr5UpTNrp255ZdDFTzT8HMiD89sSmyMWx4U=
=ACJe
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Nov_2010_11_07_06_+1100_Jytv82HdiKqH5TIJ--

--===============4296008808650335411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4296008808650335411==--
