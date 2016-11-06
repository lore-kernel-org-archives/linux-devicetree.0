From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] arm64: dts: sunxi: enable EHCI1, OHCI1 and USB PHY
 nodes in Pine64
Date: Sun, 6 Nov 2016 19:54:26 +0100
Message-ID: <20161106185426.gcucyzjcw4zqwizz@lukather>
References: <20161105143830.10099-1-icenowy@aosc.xyz>
 <20161105143830.10099-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0944530526149840947=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161105143830.10099-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0944530526149840947==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eishjhdtbdkwb5tj"
Content-Disposition: inline


--eishjhdtbdkwb5tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 05, 2016 at 10:38:30PM +0800, Icenowy Zheng wrote:
> Pine64 have two USB Type-A ports, which are wired to the two ports of
> A64 USB PHY, and the lower port is the EHCI/OHCI1 port.
>=20
> Enable the necessary nodes to enable the lower USB port to work.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 4709590..d836995 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -72,3 +72,15 @@
>  &i2c1_pins {
>  	bias-pull-up;
>  };
> +
> +&usbphy {
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};

Please order the nodes by alphebetical order.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eishjhdtbdkwb5tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH3xhAAoJEBx+YmzsjxAge10P/0SlSPhXaX5Un9IZ5t4upEpr
xhMRcvjBW14qWkwvP3ufdfsq+v2kyGQS3rTNKDszENdtea3HfaPXjkn5ziH/gn+n
SSLfIkEBzZPKXyiOzdw7Tv2ZEaatw/BagLtTjAH4/SZcOXDhYVjh5kIe2LqzOXds
55D4QxfxcBqS0jdkneKQEFRAHRb1LGYMc4wybNBFh22WhfKbDF9tRBppAlN5TaiO
cIR1i839P4a0BDHdaVn/uSu/CrChwv7iCEHEoP7rMsIuN4yWX+inU5hu1qChMEcW
plZDzwZbKlnvCUUyDX6GrnJY9ef9bRX5h8rtgdaEIWBwxeqmN4IQ6WdUPwmLjZEx
4dp7jPgEXsK21dNn4kMLnfKMctHu93186wcOgQA8JFT06KZnpvp/KUc0d2PfHR5f
yxs+Tee3myYEInw3esDa/YEpBQDTBF/pJSORLfzbuySIsez85af4ZZoMm6Vvuq9h
rToyR1+QoL7D+5jWRcSq/s2ypNqTZ/859mEb6GCEFbbQKc9myQi9B5blQ/jfxkv7
8ZJ60TtnEpsFASwkdOHL5cjTm6C3teK0j1zFRZhBPQvbwyOLcwzvOBgKr1BQofh8
Bdo3NjLZKQtw0o0VH9T+CqgckHsYIRGju9lSIvD9qf2VEinlEgQ1AIYCyNY/sqMG
C7EUoSLavy20MCXnZKoX
=JMHi
-----END PGP SIGNATURE-----

--eishjhdtbdkwb5tj--


--===============0944530526149840947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0944530526149840947==--
