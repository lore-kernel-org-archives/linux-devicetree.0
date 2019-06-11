From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Date: Tue, 11 Jun 2019 17:32:13 -0300
Message-ID: <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com> <20190611063333.48501-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611063333.48501-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <Anson.Huang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, alexandre.belloni@bootlin.com, Dong Aisheng <aisheng.dong@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Tue, Jun 11, 2019 at 3:31 AM <Anson.Huang@nxp.com> wrote:
>
> From: Anson Huang <Anson.Huang@nxp.com>
>
> i.MX system controller RTC driver can support all i.MX SoCs
> with system controller inside, this patch makes the compatible
> string more generic to support other i.MX SoCs with system
> controller inside, such as i.MX8QM etc..
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-imx-sc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
> index c933045..38ef3ca 100644
> --- a/drivers/rtc/rtc-imx-sc.c
> +++ b/drivers/rtc/rtc-imx-sc.c
> @@ -178,7 +178,7 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id imx_sc_dt_ids[] = {
> -       { .compatible = "fsl,imx8qxp-sc-rtc", },
> +       { .compatible = "fsl,imx-sc-rtc", },

What is wrong with the current compatible string?

If you want to support i.MX8QM just add in its dtsi:

compatible = "fsl,imx8qm-sc-rtc", "fsl,imx8qxp-sc-rtc"

and add a dt-bindings entry for "fsl,imx8qm-sc-rtc"
