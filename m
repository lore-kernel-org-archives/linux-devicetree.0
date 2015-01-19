From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Add simplefb node with
 de_fe0-de_be0-lcd0-hdmi pipeline
Date: Mon, 19 Jan 2015 14:20:02 +0100
Message-ID: <20150119132002.GD4367@lukather>
References: <1421672477-12978-1-git-send-email-hdegoede@redhat.com>
 <1421672477-12978-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421672477-12978-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Jan 19, 2015 at 02:01:17PM +0100, Hans de Goede wrote:
> Testing has shown that on sun4i the display backend engine does not have
> deep enough fifo-s causing flickering / tearing in full-hd mode due to
> fifo underruns. This can be avoided by letting the display frontend engine
> do the dma from memory, and then letting it feed the data directly into
> the backend unmodified, as the frontend does have deep enough fifo-s.
>=20
> Note since u-boot-v2015.01 has been released using the de_be0-lcd0-hdmi
> pipeline on sun4i, we need to keep that one around too (unfortunately).
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a=
10.dtsi
> index f5e35b5..ccd60e3 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -44,6 +44,14 @@
>  				 <&ahb_gates 44>;
>  			status =3D "disabled";
>  		};
> +
> +		framebuffer@1 {
> +			compatible =3D "allwinner,simple-framebuffer", "simple-framebuffer";
> +			allwinner,pipeline =3D "de_fe0-de_be0-lcd0-hdmi";
> +			clocks =3D <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
> +				 <&ahb_gates 44>, <&ahb_gates 46>;
> +			status =3D "disabled";
> +		};

Thanks for this.

I do have a question though, maybe I'm missing something, but what
would prevent us from using the existing node already? The output
pipeline seems to be the same, at least for which output we
use. Wether we use or not the display frontend looks like an
implementation detail.

That or just having several strings in allwinner,pipeline.

If this simplefb binding is just going to be a collection of all the
various combinations we have, plus the legacy options, I'm a bit
worried that this is just going to be a hell to maintain, without any
way to remove it at compile time (if such feature is ever merged in
DTC).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUvQSCAAoJEBx+YmzsjxAgu60P/RYBTh8OyIHMrG0CN+az2mey
YwPzEJfNBqFjAIczne6sPINI6QOgqY3GnKKz04ASCwbYO4L1HANW9BkmiILw3mqm
uQI3DVUcRPCGGp1mSmwS2QdThoArhsstvofAlDfgj5kdQGB/10UiO5Ob+BnLoCOm
gKIqmPRqs+i1SweetS1Jy7eTnzd/A8RSfLEmpDEjOQu8VDqeXWuR5IifNZCLXRAy
7pHqHEd5OEOXx6LuwPOi2RVwTQMv1eeIEd1uNNEovPGYxt6y3ZiuQe25ONftCs2s
Fs3qC/ny5aB6yMc/BSUOFf7Ot6dalkf5H6SgTocTIUyPmLvHk9IpMl1eg39EcLfS
ggCFbLPbT1vQGkVeTouGY7OIW5Q2AW1zGu7vhyRyHgyXyO15dYnCoLc2k277eUjn
4E/GEgJtjjn5CbojgpsCTrWzPj92HrNqtxOcp63Iz8A1L2ETcl77DXBdDacRAYSx
MlFCFLbKmJFyvhMGmBzOf5dDAzq3/iwe4HIjGwlboCR956iDfRTHibuPSO1ozSGt
jdX5Z3tmxE8/npAhJx1m7VFgOdaHq+sZyetOCMDEFQ5ZOp1hYjnBehDUL5nwHB8O
yqAxVGFpPtb8N9ZnzIVVI0aMa6I+YH81BJS55Noz/6gHQ+DD7wGo7gyJ3CLlw/LY
ni+Bim6QrCQQmBWdR/1V
=+bpN
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
