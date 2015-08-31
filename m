From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v4 0/4] edac: Add L3/SoC support to the APM X-Gene SoC
 EDAC driver
Date: Mon, 31 Aug 2015 14:26:11 -0700
Message-ID: <CAPw-ZTm_n6o2jXc5LuSZLrdZy3ZCmJmrRAP6S+7S-EO2ZAGANg@mail.gmail.com>
References: <1439534769-22811-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439534769-22811-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Borislav,

Are you okay with this version to pull in for 4.3 release?

-Loc

On Thu, Aug 13, 2015 at 11:46 PM, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org> wrote:
> v4:
> * Remove function for EDAC debugfs node and replace with export variable
> * Switch the driver to use the exported edac_debugfs variable
> * Revert the if statement logic for function as necessary
> * Remove un-necessary code in debugfs creation functions
>
> v3:
> * Add an function to retrieve the EDAC debugfs node
> * Move all debugfs node under EDAC code debugfs node
> * Update L3 to check for v1 errata
> * Rename error label for L3/SoC add routines
> * Re-structure SoC EDAC functions for code readability
> * Inline the function xgene_edac_soc_mem_data
> * Remove un-necessary { }
>
> v2:
> * Update binding documentation accordingly
> * Change all single bit defines to BIT(x)
> * Add support for L3 version 1 and 2 HW's
> * Change to use debug file system for error injection
> * In L3/SoC instance add function, allocate EDAC context after all
>   initalization successed
> * Support raw or detail info for SoC EDAC error reporting
>
> v1:
> * Add L3/SoC support to the APM X-Gene SoC EDAC driver
> ---
> Loc Ho (4):
>   edac: Export edac_debugfs
>   Documentation: Update the APM X-Gene SoC EDAC DTS binding for L3/SoC
>     subnodes
>   edac: Add L3/SoC EDAC support to the APM X-Gene SoC EDAC driver
>   arm64: Add L3/SoC DT subnodes to the APM X-Gene SoC EDAC node
>
>  .../devicetree/bindings/edac/apm-xgene-edac.txt    |   23 +
>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |   10 +
>  drivers/edac/edac_core.h                           |    1 +
>  drivers/edac/edac_mc_sysfs.c                       |    5 +-
>  drivers/edac/xgene_edac.c                          | 1169 ++++++++++++++++----
>  5 files changed, 1012 insertions(+), 196 deletions(-)
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
