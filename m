From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 03/13] mbox: qcom: replace integer with valid macro
Date: Wed, 16 Jan 2019 22:25:45 -0800
Message-ID: <20190117062545.GB25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-4-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545039990-19984-4-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:

> Use the correct macro when registering the platform device.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index dc8fdab1..b782173 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -108,7 +108,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  register_clk:
>  	apcs->clk = platform_device_register_data(&pdev->dev,
>  						  "qcom-apcs-msm8916-clk",
> -						  -1, NULL, 0);
> +						  PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(apcs->clk))
>  		dev_err(&pdev->dev, "failed to register APCS clk\n");
>  
> -- 
> 2.7.4
> 
