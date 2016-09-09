From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v6 1/3] Documentation: dt: net: add ath9k
 wireless device binding
Date: Fri, 9 Sep 2016 09:48:48 +0200
Message-ID: <3b93ec95-ec7c-863a-06b7-fab4f2688855@rempel-privat.de>
References: <20160821143105.27487-1-martin.blumenstingl@googlemail.com>
	<20160906214623.20424-1-martin.blumenstingl@googlemail.com>
	<20160906214623.20424-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0461246733=="
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <20160906214623.20424-2-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=unsubscribe>
List-Archive: <http://lists.ath9k.org/pipermail/ath9k-devel>
List-Post: <mailto:ath9k-devel@lists.ath9k.org>
List-Help: <mailto:ath9k-devel-request@lists.ath9k.org?subject=help>
List-Subscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=subscribe>
Mime-version: 1.0
Sender: ath9k-devel-bounces@lists.ath9k.org
Errors-To: ath9k-devel-bounces@lists.ath9k.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, ath9k-devel@lists.ath9k.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com
Cc: mark.rutland@arm.com, arend.vanspriel@broadcom.com, mcgrof@do-not-panic.com, julian.calaby@gmail.com, robh+dt@kernel.org, bjorn@mork.no, chunkeey@googlemail.com, kvalo@codeaurora.org, nbd@nbd.name
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0461246733==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Bxtiu2cekENIgaO2oRxW9hKiMH8OcGjgX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Bxtiu2cekENIgaO2oRxW9hKiMH8OcGjgX
Content-Type: multipart/mixed; boundary="9Xwrn6R4lVxTbIFvXOtaiR87aJgD27Cuk";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ath9k-devel@lists.ath9k.org, devicetree@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com
Cc: mcgrof@do-not-panic.com, mark.rutland@arm.com, robh+dt@kernel.org,
 kvalo@codeaurora.org, chunkeey@googlemail.com, arend.vanspriel@broadcom.com,
 julian.calaby@gmail.com, bjorn@mork.no, nbd@nbd.name
Message-ID: <3b93ec95-ec7c-863a-06b7-fab4f2688855@rempel-privat.de>
Subject: Re: [PATCH v6 1/3] Documentation: dt: net: add ath9k wireless device
 binding
References: <20160821143105.27487-1-martin.blumenstingl@googlemail.com>
 <20160906214623.20424-1-martin.blumenstingl@googlemail.com>
 <20160906214623.20424-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20160906214623.20424-2-martin.blumenstingl@googlemail.com>

--9Xwrn6R4lVxTbIFvXOtaiR87aJgD27Cuk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hallo all,

if it is not too late i would add my two cents :)


Am 06.09.2016 um 23:46 schrieb Martin Blumenstingl:
> Add documentation how devicetree can be used to configure ath9k based
> devices.
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>=

> ---
>  .../devicetree/bindings/net/wireless/qca,ath9k.txt | 39 ++++++++++++++=
++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qca,=
ath9k.txt
>=20
> diff --git a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.t=
xt b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> new file mode 100644
> index 0000000..77b9202
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> @@ -0,0 +1,39 @@
> +* Qualcomm Atheros ath9k wireless devices
> +
> +This node provides properties for configuring the ath9k wireless devic=
e. The
> +node is expected to be specified as a child node of the PCI controller=
 to
> +which the wireless chip is connected.
> +
> +Required properties:
> +- compatible: For PCI and PCIe devices this should be an identifier fo=
llowing
> +		the format as defined in "PCI Bus Binding to Open Firmware"
> +		Revision 2.1. One of the possible formats is "pciVVVV,DDDD"
> +		where VVVV is the PCI vendor ID and DDDD is PCI device ID.
> +
> +Optional properties:
> +- reg: Address and length of the register set for the device.
> +- qca,clk-25mhz: Defines that a 25MHz clock is used

Some SoCs even Atheros WiSoCs use WiFi clock for System Clock. In this
case we need to use clock framework any way, so why not in this case too?=

Provide dummy static clock in DT and connect it with this node?
=09
        osc25m: oscillator {
                compatible =3D "fixed-clock";
                #clock-cells =3D <0>;
                clock-frequency =3D <25000000>;
                clock-accuracy =3D <30000>;
        };

        acc: clock-controller@80040000 {
                compatible =3D "some-clock-controller";
                #clock-cells =3D <1>;
                clocks =3D <&osc25m>;
                reg =3D <0x80040000 0x204>;
        };


&pci0 {
	ath9k@168c,002d {
		compatible =3D "pci168c,002d";
		reg =3D <0x7000 0 0 0 0x1000>;
		clocks =3D <&osc25m>;
		qca,disable-5ghz;
	};
};


driver will need to use clk_get and compare frequency instead of
of_property_read_bool(np, "qca,clk-25mhz"). In this case you will need
to define source clock only one time and reuse it by all affected DT
nodes. If we have 40MHz clock you will only need to change it in
fixed-clock.


> +- qca,no-eeprom: Indicates that there is no physical EEPROM connected =
to the
> +			ath9k wireless chip (in this case the calibration /
> +			EEPROM data will be loaded from userspace using the
> +			kernel firmware loader).
> +- qca,disable-2ghz: Overrides the settings from the EEPROM and disable=
s the
> +			2.4GHz band. Setting this property is only needed
> +			when the RF circuit does not support the 2.4GHz band
> +			while it is enabled nevertheless in the EEPROM.
> +- qca,disable-5ghz: Overrides the settings from the EEPROM and disable=
s the
> +			5GHz band. Setting this property is only needed when
> +			the RF circuit does not support the 5GHz band while
> +			it is enabled nevertheless in the EEPROM.

This option can be reused for every WiFi controller. Not only for qca.
So may be instead of adding vendor specific name, make it reusable for
all vendors. Instead of qca,disable-5ghz and qca,disable-2ghz make
disable-5ghz and disable-2ghz?


> +- mac-address: See ethernet.txt in the parent directory
> +- local-mac-address: See ethernet.txt in the parent directory
> +
> +
> +In this example, the node is defined as child node of the PCI controll=
er:
> +&pci0 {
> +	ath9k@168c,002d {
> +		compatible =3D "pci168c,002d";
> +		reg =3D <0x7000 0 0 0 0x1000>;
> +		qca,disable-5ghz;
> +	};
> +};
>=20


--=20
Regards,
Oleksij


--9Xwrn6R4lVxTbIFvXOtaiR87aJgD27Cuk--

--Bxtiu2cekENIgaO2oRxW9hKiMH8OcGjgX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlfSaW8ACgkQHwImuRkmbWliNwD/VqoZWWY3CK8/u5+/yl6GcaNm
kixJW+V9f9j87QQ2vsIBAIpbQtKTXWLGPuLH1LJbAa6Yn134zhhiOPdWdkMq95ei
=jSTg
-----END PGP SIGNATURE-----

--Bxtiu2cekENIgaO2oRxW9hKiMH8OcGjgX--

--===============0461246733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath9k-devel mailing list
ath9k-devel@lists.ath9k.org
https://lists.ath9k.org/mailman/listinfo/ath9k-devel

--===============0461246733==--
