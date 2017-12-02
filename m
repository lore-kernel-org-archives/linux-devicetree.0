From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 06/12] ARM: dts: imx6qdl-aristainetos: Move regulators out
 of simple-bus
Date: Sat, 2 Dec 2017 04:47:44 +0100
Message-ID: <cddb61fa-2662-3ed4-cf0d-71b9c5afd2e0@denx.de>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
 <1512156285-18451-6-git-send-email-festevam@gmail.com>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-6-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello fabio,

Am 01.12.2017 um 20:24 schrieb Fabio Estevam:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> It is not recommended to place regulator nodes inside simple-bus, so
> move them out in order to fix the following build warnings with W=1:
> 
> arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name

This is not fixed through this patch.

> arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (unit_address_vs_reg): Node /regulators/regulator@0 has a unit name, but no reg property
> arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (unit_address_vs_reg): Node /regulators/regulator@1 has a unit name, but no reg property
> arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (unit_address_vs_reg): Node /regulators/regulator@2 has a unit name, but no reg property
> arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (unit_address_vs_reg): Node /regulators/regulator@3 has a unit name, but no reg property
> 
> Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>   arch/arm/boot/dts/imx6qdl-aristainetos.dtsi  | 73 +++++++++++++-------------
>   arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi | 76 +++++++++++++---------------
>   2 files changed, 70 insertions(+), 79 deletions(-)

Beside of the nitpick, Thanks for fixing!

Reviewed-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Tested-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
