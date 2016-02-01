From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 5/5] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Mon, 1 Feb 2016 07:54:26 -0600
Message-ID: <20160201135426.GA24362@rob-hp-laptop>
References: <1453903808-29788-1-git-send-email-ldewangan@nvidia.com>
 <1453903808-29788-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453903808-29788-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 07:40:08PM +0530, Laxman Dewangan wrote:
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
> ---
> Changes from V1:
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
>  .../bindings/regulator/regulator-max77620.txt      | 163 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/regulator/Kconfig                          |   9 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/max77620-regulator.c             | 844 +++++++++++++++++++++
>  4 files changed, 1017 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
>  create mode 100644 drivers/regulator/max77620-regulator.c
