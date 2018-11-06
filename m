Return-Path: <SRS0=AngT=NR=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Add reference clock properties
In-Reply-To: <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com> <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com>
Date: Tue, 06 Nov 2018 13:26:14 +0200
Message-ID: <877ehqv44p.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Thinh Nguyen <thinh.nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


hi,

Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
> Add two new device properties to program the reference clock period and
> to enable low power management using the reference clock. This allows a
> higher demand to go in low power for Audio Device Class devices. This
> feature is currently only valid for DWC_usb31 peripheral controller
> v1.80a and higher.
>
> Set "snps,refclk-period-ns" to program the reference clock period. The
> valid input periods are as follow:
>  +-------------+-----------------+
>  | Period (ns) | Freq (MHz)      |
>  +-------------+-----------------+
>  | 25          | 39.7/40         |
>  | 41          | 24.4            |
>  | 50          | 20              |
>  | 52          | 19.2            |
>  | 58          | 17.2            |
>  | 62          | 16.1            |
>  +-------------+-----------------+
>
> Set "snps,refclk-lpm" to enable low power scheduling of isochronous
> transfers by running SOF/ITP counters using the reference clock. Both
> "snps,dis_u2_susphy_quirk" and "snps,dis_enblslpm_quirk" must not be
> set for this feature to be enabled.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index 636630fb92d7..712b344c3a31 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -95,6 +95,24 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,refclk-period-ns: set to program the reference clock period. The=
 valid
> +   			input periods are as follow:
> +			+-------------+-----------------+
> +			| Period (ns) | Freq (MHz)      |
> +			+-------------+-----------------+
> +			| 25          | 39.7/40         |
> +			| 41          | 24.4            |
> +			| 50          | 20              |
> +			| 52          | 19.2            |
> +			| 58          | 17.2            |
> +			| 62          | 16.1            |
> +			+-------------+-----------------+
> + - snps,enable-refclk-lpm: set to enable low power scheduling of isochro=
nous
> +			transfers by running SOF/ITP counters using the
> +			reference clock. Only valid for DWC_usb31 peripheral
> +			controller v1.80a and higher. Both
> +			"snps,dis_u2_susphy_quirk" and
> +			"snps,dis_enblslpm_quirk" must not be set.

sounds like you should rely on clk API here. Then on driver call
clk_get_rate() to computer whatever you need to compute.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlvhelYACgkQzL64meEa
mQY9Ww//TSMHef35QJXBbKfU5kmP5+eljRPtLqbCHT8+XTEpF1nqpXrCaUCFrjZG
SLeMSNxDZ+MmUDoNSG962qogZ1K/U8KuFwiG7/ovKHPuNdGjMF66wqg1kzpVXYCR
Xyq3e1iXxWzIYHRNADd64w2KRmwCAt2kHLY72sj8OmH+Q6m7MqDKMQ+C60xtf3B5
x+HMi2BT6c0eDTnVWrbZ2M6VeJV0RUGteOJWiIzNJO8SaMxsyBmediQ71s8pyoQB
lhBt28+c5ZBgbXeKDSOhLglb86Iw5a2YTDQd7l+fwqckxD4hnSyweMHYRpJUS1zo
5ltSvBphtbGA/VpyZFCgG1VbES3UvAotcjFbjEPlUdIbmUbhJcSkGcqr4SsWEgnz
0yw5OLktf7EPTNiyd5HwfjLan8sfxg2Jonw7D6iKDvHd+IhqKABfULCn6SAk7w80
yPask6ZwSgYHoH7XBmmVhmEJICIaRK7TAiOCA9o+Q1VP+hKmPjX7GRntpvOy7d68
btZqdo2OegVOWGgfgMh2QYTV2PUcvmPhW/8cJPhMBGNvX7zdc9tVkbWoViZYtMoA
dQxjMQEYML5OnUspGTDcp7/WJGeIdgM2ps4/IXqpPVQkcK0uiQjlf4uowVLL5E5N
lHE+az5vBmHcblvG7Z3IQLN7PQO7C3PnnsYOZPtnHcvrPilAHa4=
=oeZF
-----END PGP SIGNATURE-----
--=-=-=--
