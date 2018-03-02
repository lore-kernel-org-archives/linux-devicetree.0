Return-Path: <SRS0=V9sa=FY=chromium.org=evgreen@kernel.org>
MIME-Version: 1.0
In-Reply-To: <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-3-git-send-email-kramasub@codeaurora.org> <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
From: Evan Green <evgreen@chromium.org>
Date: Fri, 2 Mar 2018 12:58:50 -0800
Message-ID: <CAE=gft76Twp9xZUPkv0x+qs5E9Hj72EwZNZx=vtNQ9uzKx_5Nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
Content-Type: text/plain; charset="UTF-8"
To: Stephen Boyd <sboyd@chromium.org>
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Jonathan Corbet <corbet@lwn.net>, David Brown <david.brown@linaro.org>, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Hi Karthik,

On Tue, Feb 27, 2018 at 5:38 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> This driver manages the Generic Interface (GENI) firmware based Qualcomm
> Universal Peripheral (QUP) Wrapper. GENI based QUP is the next generation
> programmable module composed of multiple Serial Engines (SE) and supports
> a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. This
> driver also enables managing the serial interface independent aspects of
> Serial Engines.
>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig        |   9 +
>  drivers/soc/qcom/Makefile       |   1 +
>  drivers/soc/qcom/qcom-geni-se.c | 971 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h    | 247 ++++++++++
>  4 files changed, 1228 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom-geni-se.c
>  create mode 100644 include/linux/qcom-geni-se.h
>
[...]
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> new file mode 100644
> index 0000000..61335b8
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> +
> +/**
> + * geni_se_clk_tbl_get() - Get the clock table to program DFS
> + * @se:                Pointer to the concerned Serial Engine.
> + * @tbl:       Table in which the output is returned.
> + *
> + * This function is called by the protocol drivers to determine the different
> + * clock frequencies supported by Serial Engine Core Clock. The protocol
> + * drivers use the output to determine the clock frequency index to be
> + * programmed into DFS.
> + *
> + * Return: number of valid performance levels in the table on success,
> + *        standard Linux error codes on failure.
> + */
> +int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl)
> +{
> +       struct geni_wrapper *wrapper = se->wrapper;
> +       unsigned long freq = 0;
> +       int i;
> +       int ret = 0;
> +
> +       mutex_lock(&wrapper->lock);
> +       if (wrapper->clk_perf_tbl) {
> +               *tbl = wrapper->clk_perf_tbl;
> +               ret = wrapper->num_clk_levels;
> +               goto out_unlock;
> +       }
> +
> +       wrapper->clk_perf_tbl = kcalloc(MAX_CLK_PERF_LEVEL,
> +                                       sizeof(*wrapper->clk_perf_tbl),
> +                                       GFP_KERNEL);
> +       if (!wrapper->clk_perf_tbl) {
> +               ret = -ENOMEM;
> +               goto out_unlock;
> +       }
> +
> +       for (i = 0; i < MAX_CLK_PERF_LEVEL; i++) {
> +               freq = clk_round_rate(se->clk, freq + 1);
> +               if (!freq || freq == wrapper->clk_perf_tbl[i - 1])
> +                       break;
> +               wrapper->clk_perf_tbl[i] = freq;
> +       }
> +       wrapper->num_clk_levels = i;
> +       *tbl = wrapper->clk_perf_tbl;
> +       ret = wrapper->num_clk_levels;
> +out_unlock:
> +       mutex_unlock(&wrapper->lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL(geni_se_clk_tbl_get);

I think Bjorn had this feedback before, but if you did this work in
probe you could remove the mutex altogether.

> +       wrapper->ahb_clks[0].id = m_ahb_clk;
> +       wrapper->ahb_clks[1].id = s_ahb_clk;
> +       ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> +       if (ret) {
> +               dev_err(dev, "Err getting AHB clks %d\n", ret);
> +               return ret;
> +       }
> +
> +       mutex_init(&wrapper->lock);
> +       dev_set_drvdata(dev, wrapper);
> +       dev_dbg(dev, "GENI SE Driver probed\n");
> +       return devm_of_platform_populate(dev);
> +}
> +
> +static int geni_se_remove(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct geni_wrapper *wrapper = dev_get_drvdata(dev);
> +
> +       kfree(wrapper->clk_perf_tbl);

Maybe null out clk_perf_tbl for safety?

> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> new file mode 100644
> index 0000000..4996de7
> --- /dev/null
> +++ b/include/linux/qcom-geni-se.h
[...]
> +/* SE_DMA_RX_IRQ_STAT Register fields */
> +#define RX_DMA_DONE                    BIT(0)
> +#define RX_EOT                         BIT(1)
> +#define RX_SBE                         BIT(2)
> +#define RX_RESET_DONE                  BIT(3)
> +#define RX_FLUSH_DONE                  BIT(4)
> +#define RX_GENI_GP_IRQ                 GENMASK(10, 5)
> +#define RX_GENI_CANCEL_IRQ             BIT(11)
> +#define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
> +
> +#ifdef CONFIG_QCOM_GENI_SE

I think this needs to be #if IS_ENABLED(CONFIG_QCOM_GENI_SE), since
the function prototypes below won't light up if this is built as a
module.

Thanks,
Evan
