From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dts: usb3: Add configure-gfladj property to USB3 nod
Date: Fri, 11 Aug 2017 14:10:08 +0300
Message-ID: <87r2wi8inj.fsf@linux.intel.com>
References: <1502443796-5255-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502443796-5255-1-git-send-email-yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yinbo.zhu-3arQi8VN3Tc@public.gmane.org, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.orgyinbo.zhu-3arQi8VN3Tc@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: open list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, moderated list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Bart Van Assche <bart.vanassche-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

yinbo.zhu-3arQi8VN3Tc@public.gmane.org writes:
> From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
>
> Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index ffbf3cf..f525297 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -731,6 +731,8 @@
>  			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode =3D "host";
>  			snps,quirk-frame-length-adjustment =3D <0x20>;
> +			configure-gfladj;

this binding isn't documented, nor is it used anywhere.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlmNkJAACgkQzL64meEa
mQbwdQ//ZUTPCVXoZRpswUugz1/9O8it68NPATmhen3bMGvAsPSlHkO6LLgDBERv
6HWYLCsBI+kDiDSLCT/KBDu0UXN7eK0wo+FJUq1uqtN3Q90fpVYCF+WXJXOzHkmd
spy3eGidSU+SGrjQ1mbhkDvZFHmDO5gmZ+xt50UAPXLPGkdIA6LRDBd3Gr0aTJN9
i1Qu9eH96lfjW9spJhi8eyggplEUPWY2WBGAmN+l19yT7gszt9E4I+VGKqmvW8SK
DXKcoKXQkI6he6OJpEdM0kKSExmBhb3Y5dEQKmOxijLmsh7iq0J2l7OMwD5WAdp1
5woPGlJqzCVimMir1LgzZG7Mlak0SIAxgRA4SYUBXaqkhKm+vs4C73jsR3zs72Fu
NiqgasEG5/cXI1Jn7OWWrjIuuEDByNYVenOF1HPRnpTQQ6BDXe1GcjK4Tywfyj+b
WB9ZxQz5KxrEJGe1nDiO7wy5sd+m58yhbGYsHWIIMM83Q/aTEjUHJb8icwYxhiWP
gCHzbKHSR3Rah+5iSjtDS2xpx9tQaqC1HjaAuCLExviGp2OT8zG0dyNmq6Q27Ilv
ps2zb5SAWwC+daYRd9MrAuQeMLM/hLXM9GXNth2DNKCvdIPAbAtUcpHB228MFKsS
MFkZX7g5mSoMmlhH4IVMQA6s7R/u0BFgtD8aoQRH9K8UO48IHEw=
=xTCj
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
