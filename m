From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/7] phy: qcom-qmp: Fix phy pipe clock name
Date: Wed, 19 Jul 2017 08:40:03 +0530
Message-ID: <CAFp+6iEuGJ-AEuX84SmGk7TMPnpp+yny6W68XZyW=P85yEvjFA@mail.gmail.com>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org> <1500293043-1887-4-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500293043-1887-4-git-send-email-varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon <kishon-l0cyMroinI0@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,


On Mon, Jul 17, 2017 at 5:33 PM, Varadarajan Narayanan
<varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Presently, the phy pipe clock's name is assumed to be either
> usb3_phy_pipe_clk_src or pcie_XX_pipe_clk_src (where XX is the
> phy lane's number). However, this will not work if an SoC has
> more than one instance of the phy. Hence, instead of assuming
> the name of the clock, fetch it from the DT.
>
> Signed-off-by: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---

Looks good.

Acked-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>


>  drivers/phy/qualcomm/phy-qcom-qmp.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 78ca628..97020ec 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -925,20 +925,13 @@ static int qcom_qmp_phy_clk_init(struct device *dev)
>   *    clk  |   +-------+   |                   +-----+
>   *         +---------------+
>   */
> -static int phy_pipe_clk_register(struct qcom_qmp *qmp, int id)
> +static int phy_pipe_clk_register(struct qcom_qmp *qmp, const char *clk_name)
>  {
> -       char name[24];
>         struct clk_fixed_rate *fixed;
>         struct clk_init_data init = { };
>
> -       switch (qmp->cfg->type) {
> -       case PHY_TYPE_USB3:
> -               snprintf(name, sizeof(name), "usb3_phy_pipe_clk_src");
> -               break;
> -       case PHY_TYPE_PCIE:
> -               snprintf(name, sizeof(name), "pcie_%d_pipe_clk_src", id);
> -               break;
> -       default:
> +       if ((qmp->cfg->type != PHY_TYPE_USB3) &&
> +           (qmp->cfg->type != PHY_TYPE_PCIE)) {
>                 /* not all phys register pipe clocks, so return success */
>                 return 0;
>         }
> @@ -947,7 +940,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, int id)
>         if (!fixed)
>                 return -ENOMEM;
>
> -       init.name = name;
> +       init.name = clk_name;
>         init.ops = &clk_fixed_rate_ops;
>
>         /* controllers using QMP phys use 125MHz pipe clock interface */
> @@ -1110,6 +1103,8 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>
>         id = 0;
>         for_each_available_child_of_node(dev->of_node, child) {
> +               const char *clk_name;
> +
>                 /* Create per-lane phy */
>                 ret = qcom_qmp_phy_create(dev, child, id);
>                 if (ret) {
> @@ -1118,11 +1113,20 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>                         return ret;
>                 }
>
> +               ret = of_property_read_string(child, "clock-output-names",
> +                                                       &clk_name);
> +               if (ret) {
> +                       dev_err(dev,
> +                               "failed to get clock-output-names for lane%d phy, %d\n",
> +                               id, ret);
> +                       return ret;
> +               }
> +
>                 /*
>                  * Register the pipe clock provided by phy.
>                  * See function description to see details of this pipe clock.
>                  */
> -               ret = phy_pipe_clk_register(qmp, id);
> +               ret = phy_pipe_clk_register(qmp, clk_name);
>                 if (ret) {
>                         dev_err(qmp->dev,
>                                 "failed to register pipe clock source\n");
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
