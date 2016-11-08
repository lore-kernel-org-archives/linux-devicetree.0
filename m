From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/30] usb: dwc2: gadget: Add descriptor DMA binding
Date: Tue, 08 Nov 2016 11:14:52 +0200
Message-ID: <87r36mib8z.fsf@linux.intel.com>
References: <cover.1478558343.git.johnyoun@synopsys.com> <e0d302ebcbad32242da84894c173b743b9199f71.1478558343.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e0d302ebcbad32242da84894c173b743b9199f71.1478558343.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:

> From: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>
> Add the devicetree binding to enable descriptor DMA and read it in to
> the corresponding parameter during probe.
>
> Signed-off-by: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  1 +
>  drivers/usb/dwc2/core.h                        |  4 ++++
>  drivers/usb/dwc2/gadget.c                      | 11 +++++++++++
>  drivers/usb/dwc2/params.c                      |  4 ++++
>  4 files changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentati=
on/devicetree/bindings/usb/dwc2.txt
> index 389a461..1db9c37 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -27,6 +27,7 @@ Refer to phy/phy-bindings.txt for generic phy consumer =
properties
>    Refer to usb/generic.txt
>  - snps,host-dma-disable: disable host DMA mode.
>  - snps,gadget-dma-enable: enable gadget DMA mode.
> +- snps,gadget-dma-desc-enable: enable gadget DMA descriptor mode.

seems to be discoverable as well:

#define GHWCFG4_DESC_DMA_DYN			(1 << 31)
#define GHWCFG4_DESC_DMA			(1 << 30)

care to comment?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIZeMAAoJEMy+uJnhGpkGb5gP/1O8w8oja09hxUGdBb0pwWjR
mFrrfuwbADH/+Esv65KO+MdL1nc2/3Q5Up9hIKwuG5qBrwSrNkrtLea1CkRxdi/9
ooFY/CRF2nKXAAk4PjmmlmqlF+VNEdTc+1otjZ/Bd28h1zzaQ//S01ywxwoJITGz
Xf9WfYMLJFeUT/d589LJrSyKXcHBEn5gNfB+IVQIUTV5/3dS4rNuVJCK1CL2yRGG
Tt9qrNkaXZaNK6eokZtDBCVUi8uR10CimrChL05kEtEzt2Alc5H7+PICFH67H0rI
ikOb6J1s/hgPNnYIKBATNfzKaZTqAvvZobOjSPrs/iqDnG9HunFQgUrvyWNE1+Qm
N80fTWEg8U3V0kuJA81LGaoJ+Oj2w1FTFN+bTP1aWjagK9Egn7ae6PgheHIFFO9V
cz7a9XoErXFyfNu9wflJhs6ZdjRTJ4X84+IGKoycJDLg4Mcg/7HiKmr0uUPwaQeF
vWKvVKfFXVsPPDjcWpIMUdskt08GZODjRqXZMZHGtJ/+9I1m12yTKupNVy0FYWRC
M75ThBbn0gqFgTAWN7sdAfagfoKOQe3u/yPXLS6Tbf9FPGhKhaaShrahTt1fmv1B
/GeMjk3ckpEmbv3E3szW15ldLsIibEGA0Krk4b5AysWT2ss8Dwdzs5K+Qz6wRU2B
GF+K6obULkE9yQlc5/yT
=EisB
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
