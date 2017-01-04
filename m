From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [RFC PATCH] arch: arm64: dts: add USB OTG interrupts support in ZynqMP device tree
Date: Wed, 04 Jan 2017 15:30:28 +0200
Message-ID: <87tw9fvtor.fsf@linux.intel.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, gregkh@linuxfoundation.org, mathias.nyman@intel.com, agraf@suse.de, bharatku@xilinx.com, punnaiah.choudary.kalluri@xilinx.com, dhdang@apm.com, marc.zyngier@arm.com, mnarani@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: anirudh@xilinx.com, anuragku@xilinx.com
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Manish Narani <manish.narani@xilinx.com> writes:
> This patch adds OTG interrupt support in device tree. It will add
> an extra interrupt line number dedicated to OTG events. This will
> enable OTG interrupts to serve in DWC3 OTG driver.
>
> Signed-off-by: Manish Narani <mnarani@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts=
/xilinx/zynqmp.dtsi
> index 68a90833..ce9ad02 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -351,7 +351,7 @@
>  			compatible =3D "snps,dwc3";
>  			status =3D "disabled";
>  			interrupt-parent =3D <&gic>;
> -			interrupts =3D <0 65 4>;
> +			interrupts =3D <0 65 4>, <0 69 4>;

help the driver by passing names to these IRQ lines.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhs+PQACgkQzL64meEa
mQZjORAA1PvdCvLob9i32QXYOK4XX+p+hZgnLYC2KfENcHvOr1k0QaFNGbz0A16r
Gd6qmzpGgWfllyi6rljlqgljcEDysLRQ9W/pf6l/roPhN4YFpndJWLCTg+EQWsK2
6NXr1xkxnZOgVyr1NfE3G6j3O7CqyPuwutIvUFLW4jo5orQrN8tUvNOGFQqLLvDA
Zm5lxTTLstCMtOF1PkcU84ive1UnwRhkPtuSHJj115acv6cMnTZG1bN630kJ3PPA
QGL+Pf07OAdblWiIx3PK2/EhQ2PJ3XH7UfpXsLsjndqLA4Yk1qhKYinwQWWLPuPd
MsH90eR12zVNCewPY+ZioQiyT/Dm/9oy//SKxqrsgQc2G+kDaLV9P0CInZw13ZCo
ps6l7uM1wU+YUjHDcimUoWI6b0+6knCH6ltLhpSOwmYA9B0f1jq8RjWIMbAwHnMu
AfsDHuBOX22ASY+ecEgtX+BhK30p1IvlmsAGN79zR9Y89A8TVC9bBrKWiGuRn+yb
wibzKfCEArTkfpoqa0nL9AX9VAv0QeRJQ36GTKLAnug0f1lXoKFrNAWYTwKqGznQ
tgrKW5WtRJpcNg+SAejERGOmXScWt4doIRasIVJCZzbQTjk0JItO1pQen/+j4MCN
9VCCrx/IbwEjcAvWXSsYUz4XY2fsxkAsEPpiwHfesB4hlJcaNoo=
=9EI6
-----END PGP SIGNATURE-----
--=-=-=--
