From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH RESEND V2 3/7] cpufreq: Use imx-cpufreq-dt for i.MX8MN's
 speed grading
Date: Mon, 19 Aug 2019 14:07:05 +0530
Message-ID: <20190819083705.fqpsyk7rgqmul6y4@vireshk-i7>
References: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
 <1566109945-11149-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566109945-11149-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, rjw@rjwysocki.net, leonard.crestez@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 18-08-19, 02:32, Anson Huang wrote:
> Add i.MX8MN to blacklist, so that imx-cpufreq-dt driver can handle
> speed grading bits just like other i.MX8M SoCs.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
> No changes.
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index ec2057d..febcec8 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -109,6 +109,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "fsl,imx7d", },
>  	{ .compatible = "fsl,imx8mq", },
>  	{ .compatible = "fsl,imx8mm", },
> +	{ .compatible = "fsl,imx8mn", },
>  
>  	{ .compatible = "marvell,armadaxp", },
>  

Applied. Thanks.

-- 
viresh
