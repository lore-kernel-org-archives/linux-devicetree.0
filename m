Return-Path: <SRS0=iC7B=MO=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas_usb3: add bindings for r8a77990
In-Reply-To: <1538481507-24821-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1538481507-24821-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 02 Oct 2018 15:17:56 +0300
Message-ID: <87sh1o8ruz.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:

> This patch adds bindings for r8a77990 (R-Car E3).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Doc=
umentation/devicetree/bindings/usb/renesas_usb3.txt
> index b22f0a5..d366555 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -6,6 +6,7 @@ Required properties:
>  	- "renesas,r8a7795-usb3-peri"
>  	- "renesas,r8a7796-usb3-peri"
>  	- "renesas,r8a77965-usb3-peri"
> +	- "renesas,r8a77990-usb3-peri"
>  	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 or RZ/G2
>  	  compatible device

oops:

checking file Documentation/devicetree/bindings/usb/renesas_usb3.txt
Hunk #1 FAILED at 6.
1 out of 1 hunk FAILED

could you rebase against testing/next?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAluzYfQACgkQzL64meEa
mQbpCg//Zd2jCrFwR5L34x20diTIPNJ0PBAu8/ANF8iRI0/tHWT5AVtyR47+HvHX
xmHjeryEeI8pSDIhfwccOOiJ+xTqDbdUqcpat2Uwvwxha5eR17E5QnB+xrM43meH
pKrM7sivnvyAI+DQs9GATjbH5p0iNP7zCMmhY3QtujwNKyFJGqtJE7G3uPFqKMkH
H5Mf3dUPh07/5qV7c8yfJV3Wk4FF8qL01bVQ9kP4+THX5a7gx4iSkGvONXQWl0vK
U9umWMzp7LABMQ2FaLejHwZxMRBF1YIFmjH542t3Jm8Euy2c2rq3SyD2GOpBPtie
KiLCqCeJkH3aaUeyXC/ULQxSSVM0tZBdhAJG4B7ASefd/ZkcVhvyTHHrhOV8NYpz
b8WghUfp5B3VtNSnHCPRhPryaqXqJAxPAYuEttJ0swd3weGihflrSBecPCbjU9xT
peQtrg7hcWR5wiVLivKPNpYW0F16mUsxFjs4QKsEheHHhP3W4rE6iwpNXk2X4y3H
UYMALRB8Kr3MVyTpTsPl/qZHatOVYRgjCHLReVyZFdhzJhElSMqxzelTxiv44SeI
dv8KeDWD7ycH5yrfpaRimmUB3G/YlS6w/VwDVPcqUZDRaXvWVOQUmcYD3FEAj5AC
trKSBFWdm9kAKU7JXU+zXmVG9L0JhVCs29G1HXpk9Zui5Ehx7dY=
=pXD9
-----END PGP SIGNATURE-----
--=-=-=--
