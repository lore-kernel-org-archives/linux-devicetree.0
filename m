From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v11 4/9] soc: qcom: rpmpd: Add a Power domain driver to
 model corners
Date: Thu, 17 Jan 2019 09:42:54 -0800
Message-ID: <20190117174254.GA17273@roeck-us.net>
References: <20190110040209.6028-1-rnayak@codeaurora.org>
 <20190110040209.6028-5-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110040209.6028-5-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 09:32:04AM +0530, Rajendra Nayak wrote:
> The Power domains for corners just pass the performance state set by the
> consumers to the RPM (Remote Power manager) which then takes care
> of setting the appropriate voltage on the corresponding rails to
> meet the performance needs.
> 
> We add all power domain data needed on msm8996 here. This driver can easily
> be extended by adding data for other qualcomm SoCs as well.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/Kconfig  |   9 ++
>  drivers/soc/qcom/Makefile |   1 +
>  drivers/soc/qcom/rpmpd.c  | 282 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/soc/qcom/rpmpd.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index fcbf8a2e4080..df5cd9fa0d5e 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -98,6 +98,15 @@ config QCOM_RPMH
>  	  of hardware components aggregate requests for these resources and
>  	  help apply the aggregated state on the resource.
>  
> +config QCOM_RPMPD
> +	bool "Qualcomm RPM Power domain driver"
> +	depends on MFD_QCOM_RPM && QCOM_SMD_RPM

Since this is bool, but the dependent configurations are tristate,
configurations such as arm64:allmodconfig result in

CONFIG_QCOM_RPMPD=y
CONFIG_MFD_QCOM_RPM=m
CONFIG_QCOM_SMD_RPM=m

This in turn results in

   arm-linux-gnueabi-ld: drivers/soc/qcom/rpmpd.o: in function `rpmpd_send_enable': 
>> rpmpd.c:(.text+0x64): undefined reference to `qcom_rpm_smd_write' 
   arm-linux-gnueabi-ld: drivers/soc/qcom/rpmpd.o: in function `rpmpd_power_on': 
   rpmpd.c:(.text+0x408): undefined reference to `qcom_rpm_smd_write' 
>> arm-linux-gnueabi-ld: rpmpd.c:(.text+0x460): undefined reference to `qcom_rpm_smd_write' 

as reported by 0day.

Either this needs to change to tristate, or the dependency must be
	depends on MFD_QCOM_RPM=y && QCOM_SMD_RPM=y

Guenter
