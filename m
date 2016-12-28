From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
 chips
Date: Wed, 28 Dec 2016 15:01:50 -0800
Message-ID: <20161228230150.GB17126@codeaurora.org>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-3-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482253431-23160-3-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/20, Vivek Gautam wrote:
> PHY transceiver driver for QUSB2 phy controller that provides
> HighSpeed functionality for DWC3 controller present on
> Qualcomm chipsets.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

One comment below, but otherwise

Reviewed-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

> +static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
> +{
> +	struct device *dev = &qphy->phy->dev;
> +	u8 *val;
> +
> +	/*
> +	 * Read efuse register having TUNE2 parameter's high nibble.
> +	 * If efuse register shows value as 0x0, or if we fail to find
> +	 * a valid efuse register settings, then use default value
> +	 * as 0xB for high nibble that we have already set while
> +	 * configuring phy.
> +	 */
> +	val = nvmem_cell_read(qphy->cell, NULL);
> +	if (IS_ERR(val) || !val[0]) {
> +		dev_dbg(dev, "failed to read a valid hs-tx trim value, %ld\n",
> +								PTR_ERR(val));

If val is 0 PTR_ERR(0) will be junk? I guess that's ok for debug
print.

> +		return;
> +	}
> +
> +	/* Fused TUNE2 value is the higher nibble only */
> +	qusb2_setbits(qphy->base + QUSB2PHY_PORT_TUNE2, val[0] << 0x4);
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
