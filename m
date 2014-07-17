From: divya ojha <odivya77@gmail.com>
Subject: Re: [RFCv2] drm/msm: DT support for 8960/8064
Date: Thu, 17 Jul 2014 13:40:02 +0530
Message-ID: <CADsdr6O75H33KV7D9fvDEpPfQ6FZ2bH-P84Zf=bjEVuNGbJn9A@mail.gmail.com>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
	<1404835244-3735-1-git-send-email-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1404835244-3735-1-git-send-email-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Jul 8, 2014 at 9:30 PM, Rob Clark <robdclark@gmail.com> wrote:
> Now that we (almost) have enough dependencies in place (MMCC, RPM, etc),
> add necessary DT support so that we can use drm/msm on upstream kernel.
>
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> ---
> I thought I sent this already, but looks like I've forgot.
..
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7f7aade..041c2fc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -123,7 +123,8 @@ struct hdmi *hdmi_init(struct drm_device *dev, struct drm_encoder *encoder)
>         for (i = 0; i < config->hpd_reg_cnt; i++) {
>                 struct regulator *reg;
>
> -               reg = devm_regulator_get(&pdev->dev, config->hpd_reg_names[i]);
> +               reg = devm_regulator_get_exclusive(&pdev->dev,
> +                               config->hpd_reg_names[i]);
>                 if (IS_ERR(reg)) {
>                         ret = PTR_ERR(reg);
>                         dev_err(dev->dev, "failed to get hpd regulator: %s (%d)\n",
> @@ -138,7 +139,8 @@ struct hdmi *hdmi_init(struct drm_device *dev, struct drm_encoder *encoder)
>         for (i = 0; i < config->pwr_reg_cnt; i++) {
>                 struct regulator *reg;
>
> -               reg = devm_regulator_get(&pdev->dev, config->pwr_reg_names[i]);
> +               reg = devm_regulator_get_exclusive(&pdev->dev,
> +                               config->pwr_reg_names[i]);
>                 if (IS_ERR(reg)) {
>                         ret = PTR_ERR(reg);
>                         dev_err(dev->dev, "failed to get pwr regulator: %s (%d)\n",

Don't we need to have a if(regulator_enabled) check after
devm_regulator_get function ?
I see a similar test after camera regulator_get function call.

-Regards
Divya
