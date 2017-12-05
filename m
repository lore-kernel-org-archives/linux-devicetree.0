From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v10 2/6] mailbox: qcom: Create APCS child device for
 clock controller
Date: Mon, 4 Dec 2017 22:01:50 -0800
Message-ID: <20171205060150.GJ28761@minitux>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
 <20171201170224.25053-3-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201170224.25053-3-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 01 Dec 09:02 PST 2017, Georgi Djakov wrote:

> There is a clock controller functionality provided by the APCS hardware
> block of msm8916 devices. The device-tree would represent an APCS node
> with both mailbox and clock provider properties.
> Create a platform child device for the clock controller functionality so
> the driver can probe and use APCS as parent.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index ab344bc6fa63..57bde0dfd12f 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -29,6 +29,7 @@ struct qcom_apcs_ipc {
>  
>  	struct regmap *regmap;
>  	unsigned long offset;
> +	struct platform_device *clk;
>  };
>  
>  static const struct regmap_config apcs_regmap_config = {
> @@ -96,6 +97,14 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
> +		apcs->clk = platform_device_register_data(&pdev->dev,
> +							  "qcom-apcs-msm8916-clk",
> +							  -1, NULL, 0);
> +		if (IS_ERR(apcs->clk))
> +			dev_err(&pdev->dev, "failed to register APCS clk\n");
> +	}
> +
>  	platform_set_drvdata(pdev, apcs);
>  
>  	return 0;
> @@ -104,8 +113,10 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  static int qcom_apcs_ipc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_apcs_ipc *apcs = platform_get_drvdata(pdev);
> +	struct platform_device *clk = apcs->clk;
>  
>  	mbox_controller_unregister(&apcs->mbox);
> +	platform_device_unregister(clk);
>  
>  	return 0;
>  }
