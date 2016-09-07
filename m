From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/7] ARM: dts: imx: add gpio-ranges properties to some
 iMX GPIO controllers
Date: Wed, 7 Sep 2016 18:31:15 +0300
Message-ID: <a97478e5-e423-2c9b-de71-3341c76ff4fe@mentor.com>
References: <1471723491-15330-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471723491-15330-1-git-send-email-vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Deepak Das <deepak_das-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Shawn, Fabio.

On 08/20/2016 11:04 PM, Vladimir Zapolskiy wrote:
> % gawk -n '{ sub(/.*__/, ""); if ($1 ~ "^GPIO") print $1, $2/4}' \
> 	arch/arm/boot/dts/imxXX-pinfunc.h | sort -n
>
> Note that this means that potential errors in arch/arm/boot/dts/imx*-pinfunc.h
> descriptions may migrate to this change, please double check the values.
>
> If needed similar changes may be done for the rest of iMX SoCs.
>
> Changes from v1 to v2:
> * in copy-pasted commit messages corrected SoC names
>
> Vladimir Zapolskiy (7):
>   ARM: dts: add gpio-ranges property to iMX50 GPIO controllers
>   ARM: dts: add gpio-ranges property to iMX6Q/D GPIO controllers
>   ARM: dts: add gpio-ranges property to iMX6DL/S GPIO controllers
>   ARM: dts: add gpio-ranges property to iMX6SL GPIO controllers
>   ARM: dts: add gpio-ranges property to iMX6SX GPIO controllers
>   ARM: dts: add gpio-ranges property to iMX6UL GPIO controllers
>   ARM: dts: add gpio-ranges property to iMX7D/S GPIO controllers
>
>  arch/arm/boot/dts/imx50.dtsi  | 16 +++++++++++++
>  arch/arm/boot/dts/imx6dl.dtsi | 53 +++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6q.dtsi  | 37 ++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6sl.dtsi | 52 ++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6sx.dtsi | 14 ++++++++++++
>  arch/arm/boot/dts/imx6ul.dtsi | 11 +++++++++
>  arch/arm/boot/dts/imx7s.dtsi  | 14 ++++++++++++
>  7 files changed, 197 insertions(+)
>

Gentle ping, please provide review comments, the change would be good
to have in v4.9.

This is a DTS change, therefore it is a pure hardware description
independent on any particular users, and it can be used by bootloaders,
Linux and other kernels.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
