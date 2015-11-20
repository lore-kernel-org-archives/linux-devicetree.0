From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 4/4] Documentation: usb: dwc3: qcom: Add TCSR mux usage
Date: Fri, 20 Nov 2015 09:08:46 -0600
Message-ID: <877flcemip.fsf@saruman.tx.rr.com>
References: <1448008509-8913-1-git-send-email-agross@codeaurora.org> <1448008509-8913-5-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448008509-8913-5-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andy Gross <agross@codeaurora.org> writes:
> This patch adds documentation for the optional syscon-tcsr property in the
> Qualcomm DWC3 node.  The syscon-tcsr specifies the register and bit used =
to
> configure the TCSR USB phy mux register.
>
> Signed-off-by: Andy Gross <agross@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Docume=
ntation/devicetree/bindings/usb/qcom,dwc3.txt
> index ca164e7..dfa222d 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -8,6 +8,10 @@ Required properties:
>    "core"		Master/Core clock, have to be >=3D 125 MHz for SS
>  				operation and >=3D 60MHz for HS operation
>=20=20
> +Optional properties:
> +- syscon-tcsr	Specifies TCSR handle, register offset, and bit position f=
or
> +			configuring the phy mux setting.

oh, it's a PHY mux ? I don't think it should be part of any dwc3-* glue
layer then. By the time we reach dwc3, the mux should be properly
configured.

Kishon, any ideas ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTzd/AAoJEIaOsuA1yqREaYIP/3idfLH+qlOuKDt4kMr3sZiW
BqubE9+7oLPRXBSKnl46MAVVeQ/EPe+BE5abaS9q7KK8KKn2Wg0ITnzUGGg7XZPM
cGvmj9GeZIRdSuclpb2h0lyEUPrTq9cdAYTvbcot8CxoJVQ02gBIhYxhwx4N2NI/
QbyTMm01HFyPTbw+sLMUDXrepm66FCRhLkeZ8ZKZyyJlV20jd0FvanM8NjRm/Byc
p5M/DrJxTWcZnwbtyXdkeZ/kFdhelrno42WGnSYHnkTIIghgFX+lORxPVliMYM34
rYc27zesIytaH+WbltHX+n33qkAA5f5rFslSi43r9dcPcXhor4WOabDJ9hxrA2MO
f4SIqZSaP1Id4kytn608dM6OTTWTDp90vlGZqMQWW6wZXWvb2ilLSx7EmMR7CYgk
ODEzuxenTsTKThER2xil58LUJAmlKCr6FLeLUUZlVsQjvtNwkPRGAKJRST6Pi4sv
56y+Le1epDeROFKg0Nc9M5FBsl9GGg/86JZBm5Dq+9v10NWl9vv7ZQGgDs0l6Utz
636Tck8dNNL3d+cgeZyxYEaetU+6F56II9BWBtT4F7I+Unu90/KXpUzfRksMVOOz
RaY2Aqg6zADde0TqsZzUHKsQXHAQjeV40qeNVeJKs5lrqLl7YBQY9CKCyUCkvda0
X6jA5DAtSiL30RME9mpV
=nQFT
-----END PGP SIGNATURE-----
--=-=-=--
