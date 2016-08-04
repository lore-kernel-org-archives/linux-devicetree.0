From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 3/4] power: reset: Add sram-reboot-mode driver
Date: Wed, 3 Aug 2016 20:08:52 -0700
Message-ID: <CALAqxLXL2aTe3DsEngCRuV76svnN-2LkDDuDna+289NWzjRYXg@mail.gmail.com>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
 <1470265523-27557-4-git-send-email-john.stultz@linaro.org> <20160804010341.GH13516@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160804010341.GH13516@tuxbot>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, Heiko St?bner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 3, 2016 at 6:03 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 03 Aug 16:05 PDT 2016, John Stultz wrote:
>
> [..]
>> diff --git a/drivers/power/reset/sram-reboot-mode.c b/drivers/power/reset/sram-reboot-mode.c
> [..]
>> +
>> +struct sram_reboot_mode {
>> +     struct reboot_mode_driver reboot;
>> +     void __iomem *reboot_reason_val_addr;
>
> 23 characters is...a lot of characters...

Fair enough. Renamed to reason_addr.


>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     if (!res)
>> +             return PTR_ERR(res);
>> +
>> +     sram_rbm->reboot_reason_val_addr = devm_ioremap(&pdev->dev, res->start,
>> +                                                      resource_size(res));
>
> Use devm_ioremap_resource() instead, it saves you the return value check
> on platform_get_resource() and is cleaner.

Ok. Done.


>> +     if (IS_ERR(sram_rbm->reboot_reason_val_addr))
>> +             return PTR_ERR(sram_rbm->reboot_reason_val_addr);
>> +
>> +     ret = reboot_mode_register(&sram_rbm->reboot);
>
> I think you should take the time to throw in a
> devm_reboot_mode_register(), it would save you from the
> dev_set_drvdata() and you can drop the remove function.

So I've only got a vague sense of what your suggesting here. Do you
have a pointer to a good example?

thanks
-john
