From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: tl6040-vibra: Device Tree support
Date: Mon, 7 May 2012 00:02:34 -0700
Message-ID: <20120507070233.GB22074@core.coreip.homeip.net>
References: <1336133113-12224-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1336133113-12224-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-input-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Fri, May 04, 2012 at 03:05:13PM +0300, Peter Ujfalusi wrote:
> +	if (pdata) {
> +		info->vibldrv_res = pdata->vibldrv_res;
> +		info->vibrdrv_res = pdata->vibrdrv_res;
> +		info->viblmotor_res = pdata->viblmotor_res;
> +		info->vibrmotor_res = pdata->vibrmotor_res;
> +		vddvibl_uV = pdata->vddvibl_uV;
> +		vddvibr_uV = pdata->vddvibr_uV;
> +	} else {
> +		of_property_read_u32(node, "vibldrv_res", &info->vibldrv_res);
> +		of_property_read_u32(node, "vibrdrv_res", &info->vibrdrv_res);
> +		of_property_read_u32(node, "viblmotor_res",
> +				     &info->viblmotor_res);
> +		of_property_read_u32(node, "vibrmotor_res",
> +				     &info->vibrmotor_res);

Since these 4 appear to be mandatory properties don't we need to
validate they are actually present in DT?

Thanks.

-- 
Dmitry
