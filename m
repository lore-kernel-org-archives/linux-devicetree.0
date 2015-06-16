From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 0/3] Add the efuse driver on rockchip platform
Date: Tue, 16 Jun 2015 10:52:58 +0200
Message-ID: <557FE3EA.4000306@i2se.com>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434439665-27781-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: heiko@sntech.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, matthias.bgg@gmail.com, jay.xu@rock-chips.com, linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Caesar,

[add Maxime and Srinivas]

Am 16.06.2015 um 09:27 schrieb Caesar Wang:
> The original driver is uploaded by Jianqun.
> Here is his patchs:
>     https://patchwork.kernel.org/patch/5410341/
>     https://patchwork.kernel.org/patch/5410351/
>
> Jianqun, nevermind!
> I check-pick it and re-upload the driver for the upstream.
> e.g.:
>     Tested by on minnie board.(kernel-4.1-rc8)
>     cd /sys/devices/platform/ffb40000.efuse
>     localhost ffb40000.efuse # cat cpu_leakage_show
>     cpu_version_show
>     The results:
>             19
>             2
>
> Changes in v2:
> - Change the document decription.
> - Move the efuse driver into driver/soc/vendor.
> - update the efuse driver.
> - Add the dts node on RK3288.
>
>

i want to mention that there is a upcoming new framework suitable for
efuse drivers:

https://lkml.org/lkml/2015/5/21/643

Unfortunately i don't know the current development state.

Regards
Stefan
