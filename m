From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] ARM: dts: add support for NS, NSP, and NS2 clocks
Date: Fri, 20 Nov 2015 09:12:19 -0800
Message-ID: <564F5473.9020608@broadcom.com>
References: <1448032640-27713-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448032640-27713-1-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jon,

On 11/20/2015 7:17 AM, Jon Mason wrote:
> Changes in v3:
> Tweaked the NSP entry names, per Ray Jui
>
> Changes in v2:
> Rebased off of outstanding NSP DT patches and tweaked the entry names
> per Ray Jui
>
>
> This patch series adds device tree support for the Broadcom Northstar,
> Northstar Plus, and Northstar 2 clocks.
>
> Last sent as an RFC (see https://lkml.org/lkml/2015/10/13/882) due to
> the inability to merge because of the driver dependencies.  Those
> necessary driver changes were merged into 4.4.  All comments have been
> addressed and it is ready to be pulled in.
>
>
> Jon Mason (3):
>    ARM: dts: enable clock support for BCM5301X
>    ARM: dts: enable clock support for Broadcom NSP
>    ARM64: dts: enable clock support for Broadcom NS2
>
>   arch/arm/boot/dts/bcm-nsp.dtsi        | 81 ++++++++++++++++++++++++------
>   arch/arm/boot/dts/bcm5301x.dtsi       | 92 +++++++++++++++++++++++++++--------
>   arch/arm64/boot/dts/broadcom/ns2.dtsi | 80 +++++++++++++++++++++++++++++-
>   3 files changed, 216 insertions(+), 37 deletions(-)
>

This entire patch series looks good to me! Thanks!

Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
