From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [RFC][PATCH 0/4] SRAM based reboot reason driver for HiKey
Date: Fri, 5 Aug 2016 15:46:10 +0300
Message-ID: <8107419f-ded4-6d0f-d2da-7e51bc3f418e@mentor.com>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Hi John,

On 08/04/2016 02:05 AM, John Stultz wrote:
> Now that Andy's reboot reason core driver has landed, I wanted
> to resubmit a reworked version of my SRAM based reboot reason
> driver.
>
> This allows the kernel to communicate to the bootloader what mode
> it should reboot to using some reserved memory.
>
> Feedback would be very much appreciated!

in my opinion the taken approach is wrong, and I've already explained
why and how to rework your driver to shrink the change, please see
https://lkml.org/lkml/2016/1/27/133

In this case I think that a SRAM device node should just contain
a plain description of partitions, compatible = "sram-reboot-mode" is
clearly not a device on "SRAM bus", it is not a device at all, so
please let's separate policy from mechanism

Because my proposed alternative approach separates policy from
mechanism, it for instanse allows to avoid overlappings on SRAM areas,
and still other drivers may serve as consumers of partitions on SRAM.

Please add me to Cc list when you send the next version of the driver.

With best wishes,
Vladimir

> thanks
> -john
>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Heiko Stübner <heiko@sntech.de>
> Cc: Caesar Wang <wxt@rock-chips.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: Android Kernel Team <kernel-team@android.com>
>
> John Stultz (4):
>   drivers: sram: Have sram driver probe children nodes
>   dt-bindings: power: reset: Add document for sram-reboot-mode driver
>   power: reset: Add sram-reboot-mode driver
>   dts: hikey: Add hikey support for sram-reboot-mode
>
>  .../bindings/power/reset/sram-reboot-mode.txt      | 35 ++++++++
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     | 22 ++++-
>  drivers/misc/sram.c                                |  3 +
>  drivers/power/reset/Kconfig                        | 10 +++
>  drivers/power/reset/Makefile                       |  1 +
>  drivers/power/reset/sram-reboot-mode.c             | 95 ++++++++++++++++++++++
>  6 files changed, 165 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/sram-reboot-mode.txt
>  create mode 100644 drivers/power/reset/sram-reboot-mode.c
>
