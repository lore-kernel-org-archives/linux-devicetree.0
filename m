From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] edac: Add L3/SoC support to the APM X-Gene SoC EDAC driver
Date: Mon, 01 Jun 2015 16:39:29 +0200
Message-ID: <1979546.jtvJnZomID@wuerfel>
References: <1432937075-16558-1-git-send-email-lho@apm.com> <1432937075-16558-2-git-send-email-lho@apm.com> <1432937075-16558-3-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432937075-16558-3-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 29 May 2015 16:04:34 Loc Ho wrote:
> +static void xgene_edac_soc_check(struct edac_device_ctl_info *edac_dev)
> +{
> +       struct xgene_edac_dev_ctx *ctx = edac_dev->pvt_info;
> +       static const char * const mem_err_ip[] = {
> +               "10GbE0",
> +               "10GbE1",
> +               "Security",
> +               "SATA45",
> +               "SATA23/ETH23",
> +               "SATA01/ETH01",
> +               "USB1",
> +               "USB0",
> +               "QML",
> +               "QM0",
> +               "QM1 (XGbE01)",
> +               "PCIE4",

This list seems a little too hardware specific, I'd assume that the numbers
get a different meaning with the xgene2.
	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
