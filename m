From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/7] devicetree: bindings: Document supported
 Allwinner sunxi SoCs
Date: Thu, 25 Sep 2014 15:36:09 +0200
Message-ID: <20140925133609.GK15315@lukather>
References: <1411570141-29960-1-git-send-email-wens@csie.org>
 <1411570141-29960-7-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x/TyKPcLwmKZr+b7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411570141-29960-7-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--x/TyKPcLwmKZr+b7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 10:49:00PM +0800, Chen-Yu Tsai wrote:
> This adds a list of supported Allwinner SoC bindings.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/sunxi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentat=
ion/devicetree/bindings/arm/sunxi.txt
> new file mode 100644
> index 0000000..d7d1039
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -0,0 +1,12 @@
> +Allwinner sunXi Platforms Device Tree Bindings
> +
> +Each device tree must specify which Allwinner SoC it uses,
> +using one of the following compatible stirngs:
                                         ^ strings

> +
> +  allwinner,sun4i-a10
> +  allwinner,sun5i-a10s
> +  allwinner,sun5i-a13
> +  allwinner,sun6i-a31
> +  allwinner,sun7i-a20
> +  allwinner,sun8i-a23
> +  allwinner,sun9i-a80

Maybe you can just add this info to the already existing README?


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--x/TyKPcLwmKZr+b7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUJBpIAAoJEBx+YmzsjxAgRiIP/iMPCF6kTGSeqYXomG2kXNCO
yVa6LFcQj/qx7p8J2zfs/sgDr10txjVuJtXZfBLtj9rp2+5mUuuMDr+7HoOKEeyQ
cV4TymTvEthQeSCOonTVLyBZxIC9+enmeVBzxKJFx2rs4uoyK/13TSs66PKr5F1a
gIfkkYYHh/jQ5vB0ZPWDtEbkQOzkv1Wvnl8/iqd1cpY48fGfga0YmkQq/hLirPq1
ywsPEnk/aTp0NddoBckHI6YdIQGGuRX6BQf4k2IDr7z/qAvQw58Uraiq3AjScp9W
/RrIiExi8+JHOLUf95AZcu833aAjzKbV7yUEEr6+Hh849rSaLokh0JST5ipStSK6
/Gc30vlKTP3zwaISbCwcnjaAxp8kW/6h1VMBLdSD/Vbcp16eOy4in0DIFYlfszye
nmV+lH9JoWy0HdGp9WdSDz4urutI/g+31fcFBqMssmxvpRQa7CXHfZDC2nBKda23
XLRI/x+Ast27kaqteE/w4zFmMzUKYOrUben/dFIO0Lpnst4iUrCPVrtCKjoYAw21
NholxPGV1JyEJe6dpkJqhi3P7tWB4ziAk7gLC40O0g6q6UgePBg9J7Yam241oinm
upE6KKVzVoByFhcKQhZs35aGd5Yep38GdBGGhKevth0LFT40a0lR1Obx6FnHa90H
VUjNbEAOVMILtLwa04Go
=3l1C
-----END PGP SIGNATURE-----

--x/TyKPcLwmKZr+b7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
