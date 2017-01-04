From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] usb: dwc3: add support for OTG driver compilation
Date: Wed, 04 Jan 2017 15:31:26 +0200
Message-ID: <87r34jvtn5.fsf@linux.intel.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com> <1483536181-22356-2-git-send-email-mnarani@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483536181-22356-2-git-send-email-mnarani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manish Narani <manish.narani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org, bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dhdang-qTEPVZfXA3Y@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mnarani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Manish Narani <manish.narani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> writes:
> This patch adds support for OTG driver compilation and object
> file creation
>
> Signed-off-by: Manish Narani <mnarani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/dwc3/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index ffca340..2d269ad 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -17,6 +17,10 @@ ifneq ($(filter y,$(CONFIG_USB_DWC3_GADGET) $(CONFIG_U=
SB_DWC3_DUAL_ROLE)),)
>  	dwc3-y				+=3D gadget.o ep0.o
>  endif
>=20=20
> +ifneq ($(CONFIG_USB_DWC3_DUAL_ROLE),)
> +	dwc3-y				+=3D otg.o
> +endif

you just broke compilation

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhs+S4ACgkQzL64meEa
mQaOsg//Rx79uroRsUxxSYAPBRGkjkY66aF03m4Pj5myW+4IaNoKmxjWawrZGvpR
j/cozODmifkO7aC/qZ7+TOyy2XfbeiD/gFLxSBGrcryy/3bvuy1L2TbNSMMB6jG5
0/kNs2Y3ZKS8raCMampE/I8ebjgt1TVBF4sk/beZp1TXDpWSW4hX2svffEKkbGju
+2nBiZNtIZjQEQzEVZGdJynZ4YRGMLXOkXn3Tb4NcHmUebDVS3ZNhbEdTli+aoKD
CHFT+bi99stpGbS2YdABqfEwUPQA2KAbi/A4G6hJRn6Xdd7L/BdRvkqEjk81WFt6
k44htWcmRhrj4ILYVWvjPl5Tyfiiu+bCPK7ECFQBWmPO0NcoIAsFjtSJCe7gEocA
uEDreDmV49jFnV6KM83hvl109nRKpMt7nnjrQu4XU+I2qxRfHKsw3pHqwcoh5snx
p/XtU4TYpLV+dHfZIfA6T2xqa8iRtBcdNI4LDcPBmHylXJdJZvknh2PiWSuMe4Xe
YrOYv7Uis8ekKdliiIm9D8RF0CEueAsDhu9yjWsQAZ4nhEbJOV5N358GMRrnK9M0
Sj7rVvHri6GvzxnjYPFjSPgll8jhtUF4PebBoKCRvVARIrh36o4XPVWciy/w+lBO
Jykr9XcdJPqW6G3TclWu5mpuMpdO/9aAW9zZbcYNvcZuFMLi4Kc=
=50ti
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
