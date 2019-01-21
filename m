Return-Path: <SRS0=9pdO=P5=holtmann.org=marcel@kernel.org>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v3 2/2] Bluetooth: dt-bindings: Realtek serial bluetooth
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190120124046.6715-2-beagleboard@davidjohnsummers.uk>
Date: Mon, 21 Jan 2019 15:46:13 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <173522CE-3B41-4BDC-AD4B-3AEA963771CE@holtmann.org>
References: <20190120124046.6715-1-beagleboard@davidjohnsummers.uk>
 <20190120124046.6715-2-beagleboard@davidjohnsummers.uk>
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi David,

> Since v2, the compatible binding names have been changed to end in
> -bt, as requested by robh. Also the example has been expanded.
>=20
> As before, for these Realtek devices, are typicaly joint wifi and
> bluetooth devices; with seperate interfaces which will be
> independently wired to the cpu. For these devices wifi is sdio, whilst
> bluetooth is a uart. This patchset just sets the device tree links for
> the bluetooth interface.
>=20
> The example device tree source code, alas hasn't been tested. It is a
> copy of that used on the ASUS Tinker Board:
>=20
> =
https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f7588870485=
78ada61a4b7ab8e678
>=20
> If these patches are accepted, my next job will be to mainline the
> rest of the Tinker Board patches - so if this element of the device
> tree has to change, I will also update the example here.
>=20
> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> ---
> .../bindings/net/realtek-bluetooth-serial.txt | 32 +++++++++++++++++++
> 1 file changed, 32 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
>=20
> diff --git =
a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt =
b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> new file mode 100644
> index 000000000000..119f9db4f87f
> --- /dev/null
> +++ =
b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> @@ -0,0 +1,32 @@
> +Realtek bluetooth devices connected via a UART.
> +These devices typically also have a wi-fi connected via sdio - the
> +compatible described here is used just for referencing the bluetooth.

If it is not in a file name or code, I prefer you write it Bluetooth =
since that is the approving naming in written text. Same as Wi-Fi and =
SDIO etc. The tendency to lower-case everything in written text is just =
bad style.

> +
> +- compatible: should be "realtek,<name>-bt"
> +  except for "realtek,trl8761atv" - which only has a serial bluetooth =
connection
> +       "realtek,rtl8723as-bt"
> +       "realtek,rtl8723bs-bt"
> +       "realtek,rtl8723ds-bt"
> +       "realtek,rtl8761atv"
> +       "realtek,rtl8821as-bt"
> +       "realtek,rtl8821cs-bt"
> +       "realtek,rtl8822bs-bt"
> +
> +Example:
> +
> +&uart0 {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&uart0_xfer>, <&uart0_cts>;
> +	bluetooth {
> +		compatible =3D "realtek,rtl8723bs-bluetooth=E2=80=9D;

I think you need to correct the example to also use -bt.

Regards

Marcel
