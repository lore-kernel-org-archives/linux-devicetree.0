From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v9 3/5] Documentation: Add documentation for the APM X-Gene SoC EDAC DTS binding
Date: Fri, 15 May 2015 12:44:44 +0200
Message-ID: <2623886.1GmlYtlSK2@wuerfel>
References: <1431623147-4950-1-git-send-email-lho@apm.com> <1431623147-4950-3-git-send-email-lho@apm.com> <1431623147-4950-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431623147-4950-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 May 2015 11:05:45 Loc Ho wrote:
> +       edac: edac@78800000 {
> +               compatible = "apm,xgene-edac";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               reg = <0x0 0x78800000 0x0 0x100>;

This seens a 'ranges' property to make the address resolution
work. An empty property should be fine.

> +               interrupts = <0x0 0x20 0x4>,
> +                            <0x0 0x21 0x4>,
> +                            <0x0 0x27 0x4>;
> +
> +               edacmc0: edacmc0@7e800000 {
> +                       compatible = "apm,xgene-edac-mc";
> +                       regmap-csw = <&csw>;
> +                       regmap-mcba = <&mcba>;
> +                       regmap-mcbb = <&mcbb>;
> +                       reg = <0x0 0x7e800000 0x0 0x1000>;
> +               };
> +
> +               edacpmd0: edacpmd0@7c000000 {
> +                       compatible = "apm,xgene-edac-pmd";
> +                       regmap-efuse = <&efuse>;
> +                       reg = <0x0 0x7c000000 0x0 0x200000>;
> +               };

Why do you have labels for each one? If nothing references
these nodes, just remove the labels.

Regarding the names, remove the numbers for the nodes that are
uniquely identified by the register location, e.g. replace
edacmc0@7e800000 with edacmc@7e800000.

If you have multiple edac-mc devices, would they point to the
same syscon nodes, or different ones for each? If they are the
same, just move the references to the main node.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
