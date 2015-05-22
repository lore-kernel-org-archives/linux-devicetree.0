From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v10 3/5] Documentation: Add documentation for the APM X-Gene SoC EDAC DTS binding
Date: Fri, 22 May 2015 10:02:31 +0200
Message-ID: <2511694.W7d3YRYFRf@wuerfel>
References: <1431991481-25684-1-git-send-email-lho@apm.com> <1431991481-25684-3-git-send-email-lho@apm.com> <1431991481-25684-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431991481-25684-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 18 May 2015 17:24:39 Loc Ho wrote:
> This patch adds documentation for the APM X-Gene SoC EDAC DTS binding.
> 
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>

This is starting to look pretty good. One final comment:

> +Example:
> +	csw: csw@7e200000 {
> +		compatible = "syscon";
> +		reg = <0x0 0x7e200000 0x0 0x1000>;
> +	};
> +
> +	mcba: mcba@7e700000 {
> +		compatible = "syscon";
> +		reg = <0x0 0x7e700000 0x0 0x1000>;
> +	};
> +
> +	mcbb: mcbb@7e720000 {
> +		compatible = "syscon";
> +		reg = <0x0 0x7e720000 0x0 0x1000>;
> +	};
> +
> +	efuse: efuse@1054a000 {
> +		compatible = "syscon";
> +		reg = <0x0 0x1054a000 0x0 0x20>;
> +	};

I think it would be helpful to assign a proper compatible string (in
addition o syscon, not replacing it) for each of these, just in case
we ever need to add a proper driver for one of them, or in case a
future chip uses an unmodified edac block with a slightly different
set of fuses or other registers that are referenced here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
