From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2 0/4] arm64: defconfig: enable additional led triggers
Date: Wed, 6 Dec 2017 14:27:26 +0530
Message-ID: <CAHLCerN4sYpU7PJG7JLhAy644s3jz9KD_myKWfOoOkEResPu-Q@mail.gmail.com>
References: <cover.1509951550.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509951550.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, lakml <linux-arm-kernel@lists.infradead.org>, Wei Xu <xuwei5@hisilicon.com>, manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org, timur@codeaurora.org
List-Id: devicetree@vger.kernel.org

(Adding Arnd)

Now that the merge window rush has abated, can you please apply this
trivial series?

On Mon, Nov 6, 2017 at 12:38 PM, Amit Kucheria <amit.kucheria@linaro.org> wrote:
> This patchset enables the kernel panic and disk-activity trigger for LEDs
> and then enables the panic trigger for three 96Boards - DB410c, Hikey and
> Hikey960.
>
> DB410c and Hikey panic behaviour has been tested by triggering a panic
> through /proc/sysrq-trigger, while Hikey960 is only compile-tested.
>
>
> Amit Kucheria (4):
>   arm64: defconfig: enable new trigger modes for leds
>   arm64: dts: qcom: apq8016-sbc: Allow USR4 LED to notify kernel panic
>   arm64: dts: hisilicon: hi6220-hikey: Allow USR1 LED to notify kernel
>     panic
>   arm64: dts: hisilicon: hi3660-hikey960: Allow USR4 LED to notify
>     kernel panic
>
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 1 +
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    | 1 +
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi         | 1 +
>  arch/arm64/configs/defconfig                      | 2 ++
>  4 files changed, 5 insertions(+)
>
> --
> 2.7.4
>
