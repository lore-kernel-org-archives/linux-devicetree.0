From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: add gpio-ranges property to iMX6Q/D GPIO
 controllers
Date: Sat, 20 Aug 2016 01:49:38 +0300
Message-ID: <20361341-54d2-1e64-57aa-ce2370d05e9c@mentor.com>
References: <1471644388-10220-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1471644388-10220-3-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471644388-10220-3-git-send-email-vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Deepak Das <deepak_das-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/20/2016 01:06 AM, Vladimir Zapolskiy wrote:
> To establish a connection between GPIO controllers and pin multiplexor
> controller add gpio-ranges properties to all GPIO controllers found
> on iMX50 SoC. The change was done after human parsing of output from

Looks like it is better to update copy-pasted commit messages to
reflect not only imxXX-pinfunc.h file name but also a SoC name from
above.

I expect to get some review comments and fix it all together in v2,
but if you prefer to see better commit messages earlier, please let me
know and I'll resend the edited versions of the changes v1 2-7.

Sorry for a typo.

> % gawk -n '{ sub(/.*__/, ""); if ($1 ~ "^GPIO") print $1, $2/4}' imx6q-pinfunc.h | sort -n
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
