From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add msm8974 driver
Date: Fri, 11 Oct 2019 10:05:06 -0700
Message-ID: <20191011170506.GD571@minitux>
References: <20191005114605.5279-1-masneyb@onstation.org>
 <20191005114605.5279-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191005114605.5279-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: georgi.djakov@linaro.org, robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonathan@marek.ca
List-Id: devicetree@vger.kernel.org

On Sat 05 Oct 04:46 PDT 2019, Brian Masney wrote:
> diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
[..]
> +static void msm8974_icc_rpm_smd_send(struct device *dev, int rsc_type,
> +				     char *name, int id, u64 val)
> +{
> +	int ret;
> +
> +	if (id == -1)
> +		return;
> +
> +	/*
> +	 * Setting the bandwidth requests for some nodes fails and this same
> +	 * behavior occurs on the downstream MSM 3.4 kernel sources based on
> +	 * errors like this in that kernel:
> +	 *
> +	 *   msm_rpm_get_error_from_ack(): RPM NACK Unsupported resource
> +	 *   AXI: msm_bus_rpm_req(): RPM: Ack failed
> +	 *   AXI: msm_bus_rpm_commit_arb(): RPM: Req fail: mas:32, bw:240000000
> +	 *
> +	 * Since there's no publicly available documentation for this hardware,
> +	 * and the bandwidth for some nodes in the path can be set properly,
> +	 * let's not return an error.
> +	 */

So presumably all that matters for paths including these endpoints is
the clk_set_rate() on the bus itself. But I prefer that we merge it like
you propose and then swing back to work out the details.

> +	ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE, rsc_type, id,
> +				    val);
> +	if (ret)
> +		dev_dbg(dev, "Cannot set bandwidth for node %s (%d): %d\n",
> +			name, id, ret);
> +}
> +

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
