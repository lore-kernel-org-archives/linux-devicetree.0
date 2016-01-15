From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/5] DT: mfd: add device-tree binding doc fro PMIC
 max77620/max20024
Date: Thu, 14 Jan 2016 20:55:13 -0600
Message-ID: <20160115025513.GA14066@rob-hp-laptop>
References: <1452771166-13694-1-git-send-email-ldewangan@nvidia.com>
 <1452771166-13694-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452771166-13694-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 14, 2016 at 05:02:42PM +0530, Laxman Dewangan wrote:
> The MAXIM PMIC MAX77620 and MAX20024 are power management IC
> which supports RTC, GPIO, DCDC/LDO regulators, interrupt,
> watchdog etc.
> 
> Add DT binding document for the different functionality of
> this device.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1: 
> - Added units in some of properties.
> - Change the boolean property to tristate type and detail some of
>   properties.
> 
> Change from V2:
> - added unit in period related dt property.
> 
>  Documentation/devicetree/bindings/mfd/max77620.txt | 397 +++++++++++++++++++++
>  include/dt-bindings/mfd/max77620.h                 |  38 ++
>  2 files changed, 435 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
>  create mode 100644 include/dt-bindings/mfd/max77620.h

Acked-by: Rob Herring <robh@kernel.org>
