From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/6] clk: qcom: Add ipq6018 Global Clock Controller support
Date: Fri, 7 Jun 2019 20:32:29 -0700
Message-ID: <20190608033229.GE24059@builder>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-5-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1559754961-26783-5-git-send-email-sricharan@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org, sboyd@codeaurora.org, agross@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:

> This patch adds support for the global clock controller found on
> the ipq6018 based devices.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: anusha <anusharao@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Please fix your s-o-b chain, as described in my reply to 1/8..

> ---
>  drivers/clk/qcom/Kconfig       |    9 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq6018.c | 5267 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 5277 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83c..e5fb091 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -120,6 +120,15 @@ config IPQ_GCC_8074
>  	  i2c, USB, SD/eMMC, etc. Select this for the root clock
>  	  of ipq8074.
>  
> +config IPQ_GCC_6018

Please maintain sort order.

> +	tristate "IPQ6018 Global Clock Controller"
> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for global clock controller on ipq6018 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  i2c, USB, SD/eMMC, etc. Select this for the root clock
> +	  of ipq6018.
> +
>  config MSM_GCC_8660
>  	tristate "MSM8660 Global Clock Controller"
>  	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f0768fb..025137d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>  obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>  obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
>  obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
> +obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o

Ditto.

>  obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
>  obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
>  obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
[..]
> +static int gcc_ipq6018_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &gcc_ipq6018_desc);
> +}
> +
> +static int gcc_ipq6018_remove(struct platform_device *pdev)
> +{
> +	return 0;

Just omit .remove from the gcc_ipq6018_driver instead of providing a
dummy function.

> +}
> +
> +static struct platform_driver gcc_ipq6018_driver = {
> +	.probe = gcc_ipq6018_probe,
> +	.remove = gcc_ipq6018_remove,
> +	.driver = {
> +		.name   = "qcom,gcc-ipq6018",
> +		.owner  = THIS_MODULE,

Don't specify .owner in platform drivers.

[..]
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ6018 Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-ipq6018");

This modalias won't be used.

Regards,
Bjorn
