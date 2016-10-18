From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: usb: dwc2: Revert incorrect FIFO changes
Date: Tue, 18 Oct 2016 14:25:21 +0300
Message-ID: <87bmyhrja6.fsf@linux.intel.com>
References: <cover.1476750819.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1476750819.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> This series reverts patches that incorrectly removed some FIFO
> programming.
>
> Hi Felipe,
>
> This fixes a regression on 4.9-rc1, could you queue them in your fixes
> tree?

added to testing/fixes. I'll be sending a pull request tomorrow if I
manage to get my tests done by the end of tomorrow ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYBgahAAoJEMy+uJnhGpkG2uYP/jK0hz9Cm7U5/FYFM4f4GMhu
nPxB49luRN4jtZjc4A6kg9xMFlDjFVncGwEEErWwSf9pxSvykB6gvKfZwOITMjYX
MKPdKK2JC/re/xdJWj75LBWD+xiGkdXonwAmMRqJIz+8fOpVTX7VNyHgv3BlSp1z
AQB24wZugx/Yl6C+R1Hwbnc+yg1sJ+DHz4L7e4ZJd4XOZH5JOVdlhSTFTbtJXtVP
qQ/UB1ty4OCvDrpLKVvIZIZGZNcmsIse/n4F1l6mu+Saa0PuSi5k7cshOOpW+nC9
UBKzgYU4HjoSkcTu/jeFxiRkZSL0W0Mf7pGBFIl8XjGfLq2U8cnySTDB/trI1eGo
v71UzyhvPsf0PXtQn5lKm+ujoAMq9BCvURDGq9GkdC6ELkvmdSrqHh8PWA+ju4EF
rssmANM12U73i34FIAFa8894EAK3atvTsvBwzvDZPwfzNcVfubClDnXsiPJbNBwf
tdNM6SJqKoC8ynTzAMlqPGAwRxaQxn3hcj6YXb6tK950em6h6/h0zaxr58GSh/zL
zBFJrtg4xnL+7w0b0QB9NbiW+DMm3C1cufCbZqdhV+h+ktj7+YSRkT5QagKYR6IM
wQkUaQNPEjG/Kw+EJNUzcHkeIxofKfwHBf5zYVZ4v08yROmV8noqKmZdWyvm7qgS
LOxzsgQ0oovwRkonElsc
=Irgk
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
