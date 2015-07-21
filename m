From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: Add dts files for Marvell Berlin4CT SoC
Date: Tue, 21 Jul 2015 16:03:49 +0100
Message-ID: <55AE5F55.2020007@arm.com>
References: <1437488279-2088-1-git-send-email-jszhang@marvell.com> <1437488279-2088-2-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437488279-2088-2-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 21/07/15 15:17, Jisheng Zhang wrote:
> Add initial dtsi file to support Marvell Berlin4CT SoC with
> support of quad Cortex-A53 CPUs.
>
> It also adds dts file for Marvell Berlin4CT DMP board which is
> based on Berlin4CT SoC.
>
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm64/boot/dts/Makefile                  |   1 +
>   arch/arm64/boot/dts/marvell/Makefile          |   5 +
>   arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts |  68 +++++++++++
>   arch/arm64/boot/dts/marvell/berlin4ct.dtsi    | 160 ++++++++++++++++++++++++++
>   4 files changed, 234 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/marvell/Makefile
>   create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
>   create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct.dtsi
>

[..]

> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts b/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
> new file mode 100644
> index 0000000..a990c8d

[..]

> +/dts-v1/;
> +
> +/memreserve/ 0x00000000 0x01000000;
> +
> +#include "berlin4ct.dtsi"
> +
> +/ {
> +	model = "MARVELL BG4CT DMP BOARD";
> +	compatible = "marvell,berlin4ct-dmp", "marvell,berlin4ct", "marvell,berlin";
> +
> +	chosen {
> +		bootargs = "earlyprintk";

I think you need to use earlycon instead ?

> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> new file mode 100644
> index 0000000..0b667f2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi

[..]

> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

Better to add interrupt-affinity as per pmu bindings[1]

Regards,
Sudeep

[1] Documentation/devicetree/bindings/arm/pmu.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
