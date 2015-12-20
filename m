From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] rtc: support DS1302 RTC on ICP DAS LP-8x4x
Date: Sat, 19 Dec 2015 21:38:15 -0600
Message-ID: <20151220033815.GD9883@rob-hp-laptop>
References: <397668667-27328-3-git-send-email-ynvich@gmail.com>
 <1450201525-9137-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450201525-9137-1-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alessandro Zummo <a.zummo@towertech.it>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 08:45:23PM +0300, Sergei Ianovich wrote:

Nothing in this is specific to ICP, so the subject should be updated.

> Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>    v4..v5
>    * drop THIS_MODULE from struct platform driver
>    * use "dallas" for vendor name per vendor-prefixes.txt
> 
>    v3..v4
>    * move DTS bindings to a different patch
> 
>    v2..v3
>    * use usleep_range instead of custom nsleep
>    * number change (07/16 -> 09/21)
> 
>    v0..v2
>    * use device tree
>    * use devm helpers where possible
> 
>  .../devicetree/bindings/rtc/rtc-ds1302.txt         |  14 +++
>  drivers/rtc/Kconfig                                |   2 +-
>  drivers/rtc/rtc-ds1302.c                           | 100 ++++++++++++++++++++-
>  3 files changed, 113 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> new file mode 100644
> index 0000000..810613b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> @@ -0,0 +1,14 @@
> +* Dallas Semiconductor DS-1302 RTC
> +
> +Simple device which could be used to store date/time between reboots.
> +
> +Required properties:
> +- compatible : Should be "dallas,rtc-ds1302"
> +- reg : Should be address and size of IO memory region

This device is a SPI (or SPI like?) interface. So you have some sort of 
of FPGA logic in between the cpu and ds1302. The DT should have a node 
for the controller and then the ds1302 as a child of it. A full blown 
SPI driver may be overkill here, but that's a separate discussion from 
the DT binding.

Rob

> +
> +Examples:
> +
> +rtc@40900000 {
> +	compatible = "dallas,rtc-ds1302";
> +	reg = <0x1700901c 0x1>;
> +};
