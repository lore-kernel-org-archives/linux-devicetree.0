From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] pinctrl: pinctrl-imx: add imx6q pinctrl driver
Date: Tue, 17 Apr 2012 14:12:50 -0600
Message-ID: <4F8DCEC2.2060800@wwwdotorg.org>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com> <1334333915-1174-2-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334333915-1174-2-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 04/13/2012 10:18 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>

> diff --git a/drivers/pinctrl/pinctrl-imx.c b/drivers/pinctrl/pinctrl-imx.c

>  static const struct of_device_id imx_pmx_dt_ids[] = {
> +#ifdef CONFIG_PINCTRL_IMX6Q
> +	{ .compatible = "fsl,imx6q-iomuxc", .data = (void *) &imx6q_pinctrl_info, },
> +#endif
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx_pmx_dt_ids);

Sorry for the slow review.

Based on SPEAr pinctrl review comments, we shouldn't have a single
driver that knows about all the different SoCs that it could support,
but rather one driver per SoC, with each of those calling into some
utility code in the core driver to do all the probe/remove work.

For more details, see commit a4c0738 "pinctrl: tegra: refactor probe
handling" in
git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
(in branch for-3.5/gpio-pinmux).
