From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 0/5] Hi3660: enable power management features
Date: Tue, 15 May 2018 15:50:54 +0100
Message-ID: <5AFAF3CE.70601@hisilicon.com>
References: <1526352795-6991-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526352795-6991-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 2018/5/15 3:53, Leo Yan wrote:
> Since hi3660 drivers have been merged into Linux kernel (mailbox driver is in
> Linux-next branch and other drivers are existed in Linux mainline kernel), so
> this patch series is to enable power management features on hi3660.
> 
> This patch series includes device tree binding for mailbox, stub clock and CPU
> OPPs, and has one patch to consolidate the Kconfigs for driver modules.
> 
> This patch set have been tested on Hikey960 and also verified the patch 'hisi:
> Consolidate the Kconfigs for the CLOCK_STUB and the MAILBOX' for Hikey620.
> 
> Changes from v1:
> * Changed patch subject from "dts: arm64: hi3660" to "arm64: dts: hi3660".
> 
> 
> Daniel Lezcano (1):
>   hisi: Consolidate the Kconfigs for the CLOCK_STUB and the MAILBOX
> 
> Kaihua Zhong (2):
>   arm64: dts: hi3660: Add mailbox node
>   arm64: dts: hi3660: Add stub clock node
> 
> Leo Yan (1):
>   arm64: dts: hi3660: Add CPU frequency scaling support
> 
> Tao Wang (1):
>   arm64: dts: hi3660: Add thermal cooling management
> 
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 145 ++++++++++++++++++++++++++++++
>  arch/arm64/configs/defconfig              |   1 -
>  drivers/clk/hisilicon/Kconfig             |  13 +--
>  drivers/mailbox/Kconfig                   |  12 ++-
>  4 files changed, 161 insertions(+), 10 deletions(-)
> 

Applied patch 1 to 4.
Thanks!

Best Regards,
Wei
