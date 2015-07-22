From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: Add dts files for Marvell Berlin4CT
 SoC
Date: Wed, 22 Jul 2015 10:19:19 +0100
Message-ID: <55AF6017.6040407@arm.com>
References: <1437555470-6283-1-git-send-email-jszhang@marvell.com> <1437555470-6283-2-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437555470-6283-2-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 22/07/15 09:57, Jisheng Zhang wrote:
> Add initial dtsi file to support Marvell Berlin4CT SoC with
> quad Cortex-A53 CPUs.
>
> It also adds dts file for Marvell Berlin4CT DMP board which is
> based on Berlin4CT SoC.
>
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm64/boot/dts/Makefile                  |   1 +
>   arch/arm64/boot/dts/marvell/Makefile          |   5 +
>   arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts |  67 +++++++++++
>   arch/arm64/boot/dts/marvell/berlin4ct.dtsi    | 164 ++++++++++++++++++++++++++
>   4 files changed, 237 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/marvell/Makefile
>   create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
>   create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct.dtsi
>

[..]

> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts b/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
> new file mode 100644
> index 0000000..58ed7f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
> @@ -0,0 +1,67 @@

[..]

> +/dts-v1/;
> +
> +#include "berlin4ct.dtsi"
> +
> +/ {
> +	model = "MARVELL BG4CT DMP BOARD";
> +	compatible = "marvell,berlin4ct-dmp", "marvell,berlin4ct", "marvell,berlin";
> +
> +	chosen {
> +		bootargs = "earlycon=uart8250,mmio32,0xf7fcd000";
> +		stdout-path = "serial0:115200n8";

Just earlycon without any parameters will suffice. Currently earlycon
parsing code has issues and it's being worked out[1]. The serial port
details specified in stdout-path will be used by earlycon.

Regards,
Sudeep

[1] https://lkml.org/lkml/2015/4/8/604
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
