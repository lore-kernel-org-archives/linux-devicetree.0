From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] phy: rockchip-typec: reset USB3 controller before
 initializing PHY
Date: Thu, 18 Jan 2018 18:22:17 +0100
Message-ID: <CAFqH_52U32FpykKPmXXUcdK=fGm+yLcXgDZ4qC2NKz2na2yg3Q@mail.gmail.com>
References: <1515751704-13213-1-git-send-email-william.wu@rock-chips.com> <1515751704-13213-4-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515751704-13213-4-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, lin.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

2018-01-12 11:08 GMT+01:00 William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>:
> According to the RK3399 TRM, for Type-C USB start-up sequence,
> we need to hold the whole USB 3.0 OTG controller in reset state
> to keep the PIPE power state in P2 while initializing PHY. This
> is because when initialize the Type-C PHY for USB3, we need to
> configure the PHY and PMA for the selected mode of operation,
> and wait for the PMA and PIPE ready, if the USB3 OTG controller
> isn't in P2 state, it may cause waiting timeout.
>
> Without this patch, waiting for the PMA and PIPE ready timeout
> issue easily happens when we shutdown the Logic on RK3399 and
> do the suspend/resume stress test.
>
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
> index ee85fa0..68a5840 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -372,6 +372,7 @@ struct rockchip_typec_phy {
>         struct reset_control *uphy_rst;
>         struct reset_control *pipe_rst;
>         struct reset_control *tcphy_rst;
> +       struct reset_control *otg_rst;
>         struct rockchip_usb3phy_port_cfg port_cfgs;
>         /* mutex to protect access to individual PHYs */
>         struct mutex lock;
> @@ -841,10 +842,16 @@ static int rockchip_usb3_phy_power_on(struct phy *phy)
>         if (tcphy->mode == new_mode)
>                 goto unlock_ret;
>
> +       ret = reset_control_assert(tcphy->otg_rst);
> +       if (ret < 0) {
> +               dev_err(tcphy->dev, "failed to assert otg reset: %d\n", ret);
> +               goto unlock_ret;
> +       }
> +
>         if (tcphy->mode == MODE_DISCONNECT) {
>                 ret = tcphy_phy_init(tcphy, new_mode);
>                 if (ret)
> -                       goto unlock_ret;
> +                       goto unlock_deassert;
>         }
>
>         /* wait TCPHY for pipe ready */
> @@ -852,7 +859,7 @@ static int rockchip_usb3_phy_power_on(struct phy *phy)
>                 regmap_read(tcphy->grf_regs, reg->offset, &val);
>                 if (!(val & BIT(reg->enable_bit))) {
>                         tcphy->mode |= new_mode & (MODE_DFP_USB | MODE_UFP_USB);
> -                       goto unlock_ret;
> +                       goto unlock_deassert;
>                 }
>                 usleep_range(10, 20);
>         }
> @@ -862,6 +869,11 @@ static int rockchip_usb3_phy_power_on(struct phy *phy)
>
>         ret = -ETIMEDOUT;
>
> +unlock_deassert:
> +       ret = reset_control_deassert(tcphy->otg_rst);
> +       if (ret < 0)
> +               dev_err(tcphy->dev, "failed to deassert otg reset: %d\n", ret);
> +
>  unlock_ret:
>         mutex_unlock(&tcphy->lock);
>         return ret;
> @@ -1066,6 +1078,12 @@ static int tcphy_parse_dt(struct rockchip_typec_phy *tcphy,
>                 return PTR_ERR(tcphy->tcphy_rst);
>         }
>
> +       tcphy->otg_rst = devm_reset_control_get(dev, "usb3-otg");
> +       if (IS_ERR(tcphy->otg_rst)) {
> +               dev_err(dev, "no otg_rst reset control found\n");
> +               return PTR_ERR(tcphy->otg_rst);
> +       }
> +
>         return 0;
>  }
>
> --
> 2.0.0
>
>

Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
