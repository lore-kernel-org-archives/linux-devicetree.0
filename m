From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [Patch v4 6/9] driver/edac/fsl_ddr: Add support of little endian
Date: Fri, 12 Aug 2016 09:41:58 +0200
Message-ID: <20160812074158.GD12013@nazgul.tnic>
References: <1470779760-16483-1-git-send-email-york.sun@nxp.com>
 <1470779760-16483-7-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470779760-16483-7-git-send-email-york.sun-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 02:55:43PM -0700, York Sun wrote:
> Get endianness from device tree. Both big endian and little endian
> are supported. Default to big endian for backward compatibility to
> MPC85xx.
> 
> Signed-off-by: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
> 
> ---
> Change log
>   v4: Absorb name changes by "Rename macros and names"
>       Drop testing for big-endian as suggested
>       Use of_property_read_bool() as suggested
>   v3: no change
>   v2: Separated from "Add support for ARM-based SoCs" patch
> 
>  .../fsl/ddr.txt}                                   |  2 +
>  drivers/edac/fsl_ddr_edac.c                        | 96 +++++++++++++---------
>  2 files changed, 58 insertions(+), 40 deletions(-)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/mem-ctrlr.txt => memory-controllers/fsl/ddr.txt} (86%)

...

> @@ -95,8 +106,8 @@ static ssize_t fsl_mc_inject_data_lo_store(struct device *dev,
>  	struct mem_ctl_info *mci = to_mci(dev);
>  	struct fsl_mc_pdata *pdata = mci->pvt_info;
>  	if (isdigit(*data)) {
> -		out_be32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_LO,
> -			 simple_strtoul(data, NULL, 0));
> +		ddr_out32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_LO,
> +			  simple_strtoul(data, NULL, 0));
>  		return count;
>  	}
>  	return 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#122: FILE: drivers/edac/fsl_ddr_edac.c:96:
+                         simple_strtoul(data, NULL, 0));

Please send a fix ontop.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
