From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] phy: qcom-qmp: Fix phy pipe clock name
Date: Mon, 17 Jul 2017 15:30:47 -0700
Message-ID: <20170717223047.GA20973@minitux>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-4-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500293043-1887-4-git-send-email-varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon 17 Jul 05:03 PDT 2017, Varadarajan Narayanan wrote:

> Presently, the phy pipe clock's name is assumed to be either
> usb3_phy_pipe_clk_src or pcie_XX_pipe_clk_src (where XX is the
> phy lane's number). However, this will not work if an SoC has
> more than one instance of the phy. Hence, instead of assuming
> the name of the clock, fetch it from the DT.
> 

Adding the support to fetch this from DT looks reasonable, but you
should make sure to fall back to the old logic in case you don't find a
"clock-output-names" property.

[..]
> @@ -1110,6 +1103,8 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>  
>  	id = 0;
>  	for_each_available_child_of_node(dev->of_node, child) {
> +		const char *clk_name;
> +
>  		/* Create per-lane phy */
>  		ret = qcom_qmp_phy_create(dev, child, id);
>  		if (ret) {
> @@ -1118,11 +1113,20 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> +		ret = of_property_read_string(child, "clock-output-names",
> +							&clk_name);
> +		if (ret) {

This would be the case for any existing dts files, so you're not allowed
to treat this as an error.

> +			dev_err(dev,
> +				"failed to get clock-output-names for lane%d phy, %d\n",
> +				id, ret);
> +			return ret;
> +		}
> +

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
