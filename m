From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] drm/exynos: Rework fimc clocks handling
Date: Wed, 17 Apr 2013 10:30:01 +0200
Message-ID: <516E5D89.2040305@samsung.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
 <1366133486-22973-3-git-send-email-s.nawrocki@samsung.com>
 <CAK9yfHw=V+5AgM9i+Cc7cr9TJqgsYigQApSJehNFwv=cFU2bCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <CAK9yfHw=V+5AgM9i+Cc7cr9TJqgsYigQApSJehNFwv=cFU2bCg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: inki.dae@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 04/17/2013 06:02 AM, Sachin Kamat wrote:
> Hi Sylwester,
> 
> On 16 April 2013 23:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>> @@ -1835,16 +1859,19 @@ static int fimc_probe(struct platform_device *pdev)
>>         ret = exynos_drm_ippdrv_register(ippdrv);
>>         if (ret < 0) {
>>                 dev_err(dev, "failed to register drm fimc device.\n");
>> -               goto err_ippdrv_register;
>> +               goto err_pm_dis;
>>         }
>>
>>         dev_info(&pdev->dev, "drm fimc registered successfully.\n");
>>
>>         return 0;
>>
>> -err_ippdrv_register:
>> +err_pm_dis:
>> +       devm_kfree(dev, ippdrv->prop_list);
> 
> devm_kfree was removed in patch1 of this series. Do we need it back?

Certainly not, that's a rebase error. I'll resend it fixed.
Thanks for your review.

Regards,
Sylwester
