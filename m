From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add Marvell PMU documentation
Date: Mon, 07 Dec 2015 18:44:34 +0100
Message-ID: <878u56b1bx.fsf@free-electrons.com>
References: <E1a5j6L-000873-3P@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1a5j6L-000873-3P-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org> (Russell King's
	message of "Sun, 06 Dec 2015 23:52:21 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
=20
 On lun., d=C3=A9c. 07 2015, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>=
 wrote:

> Add the required DT binding documentation for the Marvell PMU driver.
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Applied on mvebu/dt

Thanks,

Gregory

> ---
> Who takes these patches?  This never got merged when the PMU driver
> itself was merged.
>
>  Documentation/devicetree/bindings/soc/dove/pmu.txt | 56 ++++++++++++=
++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/dove/pmu.tx=
t
>
> diff --git a/Documentation/devicetree/bindings/soc/dove/pmu.txt b/Doc=
umentation/devicetree/bindings/soc/dove/pmu.txt
> new file mode 100644
> index 000000000000..edd40b796b74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/dove/pmu.txt
> @@ -0,0 +1,56 @@
> +Device Tree bindings for Marvell PMU
> +
> +Required properties:
> + - compatible: value should be "marvell,dove-pmu".
> +    May also include "simple-bus" if there are child devices, in whi=
ch
> +    case the ranges node is required.
> + - reg: two base addresses and sizes of the PM controller and PMU.
> + - interrupts: single interrupt number for the PMU interrupt
> + - interrupt-controller: must be specified as the PMU itself is an
> +    interrupt controller.
> + - #interrupt-cells: must be 1.
> + - #reset-cells: must be 1.
> + - domains: sub-node containing domain descriptions
> +
> +Optional properties:
> + - ranges: defines the address mapping for child devices, as per the
> +   standard property of this name.  Required when compatible include=
s
> +   "simple-bus".
> +
> +Power domain descriptions are listed as child nodes of the "domains"
> +sub-node.  Each domain has the following properties:
> +
> +Required properties:
> + - #power-domain-cells: must be 0.
> +
> +Optional properties:
> + - marvell,pmu_pwr_mask: specifies the mask value for PMU power regi=
ster
> + - marvell,pmu_iso_mask: specifies the mask value for PMU isolation =
register
> + - resets: points to the reset manager (PMU node) and reset index.
> +
> +Example:
> +
> +	pmu: power-management@d0000 {
> +		compatible =3D "marvell,dove-pmu";
> +		reg =3D <0xd0000 0x8000>, <0xd8000 0x8000>;
> +		interrupts =3D <33>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +		#reset-cells =3D <1>;
> +
> +		domains {
> +			vpu_domain: vpu-domain {
> +				#power-domain-cells =3D <0>;
> +				marvell,pmu_pwr_mask =3D <0x00000008>;
> +				marvell,pmu_iso_mask =3D <0x00000001>;
> +				resets =3D <&pmu 16>;
> +			};
> +
> +			gpu_domain: gpu-domain {
> +				#power-domain-cells =3D <0>;
> +				marvell,pmu_pwr_mask =3D <0x00000004>;
> +				marvell,pmu_iso_mask =3D <0x00000002>;
> +				resets =3D <&pmu 18>;
> +			};
> +		};
> +	};
> --=20
> 2.1.0
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
