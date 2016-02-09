From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V7 8/8] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Tue, 9 Feb 2016 20:32:24 +0530
Message-ID: <56B9FF80.7010107@nvidia.com>
References: <1454171931-27752-1-git-send-email-ldewangan@nvidia.com> <1454171931-27752-9-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1454171931-27752-9-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

I have taken care of all your previous comment on this patch.

Can you please review?

I got the macro from Lee's and spinning the V8 of this series so if 
there is any thing, I can take care on my next version.

Thanks,
Laxman


On Saturday 30 January 2016 10:08 PM, Laxman Dewangan wrote:
> MAXIM Semiconductor's PMIC, MAX77620 and MAX20024 have the
> multiple DCDC and LDOs. This supplies the power to different
> components of the system.
> Also these rails has configuration for ramp time, flexible
> power sequence, slew rate etc.
>
> Add regulator driver to access these rails via regulator APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>
> - Cleanup code based on comment received on mfd/rtc.
> - Avoid duplication on error message.
>
> Changes form V2:
> - Run coccicheck and checkpatch in strict mode for the alignment.
> - Refactor Regulator driver to use core API for DT parsing.
> - Update based on API changes.
>
> Changes from V3:
> - Change all sys initcall to module driver.
> - change the max77620_read argument to unisgned int from u8.
>   
> Changes from V4:
> - Added DT binding document as devicetree/bindings/regulator/regulator-max77620.txt
> - Detail out properties.
>
> Changes from V5:
> - Separate out DT binding doc for regulator.
>
> Changes from V6:
> - Use direct regmap APIs.
> - Drop active-discharge configuration as it wil be move to core and through
>    callback. Follow on patches are palnned for this.
>

