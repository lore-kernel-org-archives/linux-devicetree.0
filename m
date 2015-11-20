From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support of hi6220
Date: Fri, 20 Nov 2015 11:20:52 -0600
Message-ID: <87mvu8d1u3.fsf@saruman.tx.rr.com>
References: <1447832387-27549-1-git-send-email-zhangfei.gao@linaro.org> <87ziy9erpi.fsf@saruman.tx.rr.com> <2B3535C5ECE8B5419E3ECBE30077290901DC3D9462@US01WEMBX2.internal.synopsys.com> <871tbkelca.fsf@saruman.tx.rr.com> <20151120161533.GA2987@herrerog>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151120161533.GA2987@herrerog>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Herrero, Gregory" <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

"Herrero, Gregory" <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> Hi Felipe,
>
> I just realized this patch miss "dma_desc_fs_enable" property in
> params_hi6220. (drivers/usb/dwc2/platform.c:57)
>
> You need to apply this patch:
>
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index d5102c4..2dfdae3 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -59,6 +59,7 @@ static const struct dwc2_core_params params_hi6220 =3D {
>         .otg_ver                        =3D 0,    /* 1.3 */
>         .dma_enable                     =3D 1,
>         .dma_desc_enable                =3D 0,
> +       .dma_desc_fs_enable             =3D 0,
>         .speed                          =3D 0,    /* High Speed */
>         .enable_dynamic_fifo            =3D 1,
>         .en_multiple_tx_fifo            =3D 1,
>
>
> Note that it is needed due to below patch.
> "usb: dwc2: host: enable descriptor dma for fs devices"

done, thanks.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWT1Z1AAoJEIaOsuA1yqREvuEP/08LiVrPUhRZAgVctSuE1aRj
ITvckFZ5wafm9kiIy27WuQ+RCgXGAcwT+SZ3LYOcUAOqFiJV8fua2RPylY5s7U6M
47RZVZGF7Ffv/nV5R78gxdfgsh1rrsj7ZfIJZUeYHeWk64IHwL7qwQy70NcBjf+u
5f0Noivr19f4ewOVbcadel8ulQHg8v8YCAm42vdC9WCaP8uVsJMnV3jM72rTue2A
/ykVi2zqXwTVenWdCV2+sdH1vb+Mym6aDz5qDloSiacWnbEFcrXSdiLWJEbN70EY
sxT4WDhvboKBiLXr6oB9IegBbJimDKl90+OX4lv5ioa6M/bFiK/NKlwMjUCJvZNp
P51VxV9eYjRftCTODLwdBDWYOOR5lfywwIA+uZHvBttS+iTesrOHH9D3N4dHD2ZF
v9nxhappoWR6A8klSUa//FmH0WmqVPDH0dh5w339uxwEt4+uguz4SlYVGa1VLbTc
GkuMKpTIbUh/aB0htGPKECaV7R5dgGKYdWQg/Ovs+UCnDfryyWLo/Q18uC7OpMhY
rBQMjnEYvwzOAMk/LcEazFeDPBbwuibVZ2gAIN0WcY3AoVkyo+qbBaDHS1RY97zy
BR+s86g1Gj4jBS8YlJVK+nylCjkWtJstntzS4KPx3PzBNIeV7lYampVMwS1CayBn
pVI5GeaAbhjsz676Sb+H
=DtPP
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
