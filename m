From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: =?UTF-8?Q?Re=3a_=5bPatch_v3=c2=a0=5d_drm/msm/dpu=3a_Correct_dpu_des?=
 =?UTF-8?Q?troy_and_disable_order?=
Date: Mon, 19 Nov 2018 14:02:04 +0530
Message-ID: <9b31405e-a9dd-3571-a969-caf2c27dd792@codeaurora.org>
References: <1542608738-3315-1-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542608738-3315-1-git-send-email-jshekhar@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jayant Shekhar <jshekhar@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org
List-Id: devicetree@vger.kernel.org


On 11/19/2018 11:55 AM, Jayant Shekhar wrote:
> In case of msm drm bind failure, pm runtime put sync
> is called from dsi driver which issues an asynchronous
> put on mdss device. Subsequently when dpu_mdss_destroy
> is triggered the change will make sure to put the mdss
> device in suspend and clearing pending work if not
> scheduled.
> 
> Changes in v2:
>     - Removed double spacings [Jeykumar]
> 
> Changes in v3:
>     - Fix clock on issue during bootup [Rajendra]
> 
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>

So I no longer see the clock usecount mismatch with this patch now,
that I had earlier reported with the v2.

Tested-by: Rajendra Nayak <rnayak@codeaurora.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index fd9c893..df8127b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -156,18 +156,16 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>   	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
>   	struct dss_module_power *mp = &dpu_mdss->mp;
>   
> +	pm_runtime_suspend(dev->dev);
> +	pm_runtime_disable(dev->dev);
>   	_dpu_mdss_irq_domain_fini(dpu_mdss);
> -
>   	free_irq(platform_get_irq(pdev, 0), dpu_mdss);
> -
>   	msm_dss_put_clk(mp->clk_config, mp->num_clk);
>   	devm_kfree(&pdev->dev, mp->clk_config);
>   
>   	if (dpu_mdss->mmio)
>   		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>   	dpu_mdss->mmio = NULL;
> -
> -	pm_runtime_disable(dev->dev);
>   	priv->mdss = NULL;
>   }
>   
> 
