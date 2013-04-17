From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/3] drm/exynos: Rework fimc clocks handling
Date: Wed, 17 Apr 2013 09:32:41 +0530
Message-ID: <CAK9yfHw=V+5AgM9i+Cc7cr9TJqgsYigQApSJehNFwv=cFU2bCg@mail.gmail.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
	<1366133486-22973-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1366133486-22973-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: inki.dae@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

On 16 April 2013 23:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> @@ -1835,16 +1859,19 @@ static int fimc_probe(struct platform_device *pdev)
>         ret = exynos_drm_ippdrv_register(ippdrv);
>         if (ret < 0) {
>                 dev_err(dev, "failed to register drm fimc device.\n");
> -               goto err_ippdrv_register;
> +               goto err_pm_dis;
>         }
>
>         dev_info(&pdev->dev, "drm fimc registered successfully.\n");
>
>         return 0;
>
> -err_ippdrv_register:
> +err_pm_dis:
> +       devm_kfree(dev, ippdrv->prop_list);

devm_kfree was removed in patch1 of this series. Do we need it back?


-- 
With warm regards,
Sachin
