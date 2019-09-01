From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH v5 00/18] add thermal driver for h6
Date: Sun, 1 Sep 2019 23:52:14 +0200
Message-ID: <20190901215214.f4vbxemdd7mf3gun@core.my.home>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190810052829.6032-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Yangtao,

On Sat, Aug 10, 2019 at 05:28:11AM +0000, Yangtao Li wrote:
> This patchset add support for A64, H3, H5, H6 and R40 thermal sensor.
> 
> Thx to Icenowy and Vasily.
> 
> BTY, do a cleanup in thermal makfile.

I've added support for A83T and also some cleanups, according to my
feedback:

https://megous.com/git/linux/log/?h=ths-5.3

Feel free to pick up whatever you like from that tree.

For others, there are also DTS patches in that tree for H3, H5, A83T, and H6, so
that shoul make testing of this driver easier.

regards,
	Ondrej

> Icenowy Zheng (3):
>   thermal: sun8i: allow to use custom temperature calculation function
>   thermal: sun8i: add support for Allwinner H5 thermal sensor
>   thermal: sun8i: add support for Allwinner R40 thermal sensor
> 
> Vasily Khoruzhick (1):
>   thermal: sun8i: add thermal driver for A64
> 
> Yangtao Li (14):
>   thermal: sun8i: add thermal driver for h6
>   dt-bindings: thermal: add binding document for h6 thermal controller
>   thermal: fix indentation in makefile
>   thermal: sun8i: get ths sensor number from device compatible
>   thermal: sun8i: rework for sun8i_ths_get_temp()
>   thermal: sun8i: get ths init func from device compatible
>   thermal: sun8i: rework for ths irq handler func
>   thermal: sun8i: support mod clocks
>   thermal: sun8i: rework for ths calibrate func
>   dt-bindings: thermal: add binding document for h3 thermal controller
>   thermal: sun8i: add thermal driver for h3
>   dt-bindings: thermal: add binding document for a64 thermal controller
>   dt-bindings: thermal: add binding document for h5 thermal controller
>   dt-bindings: thermal: add binding document for r40 thermal controller
> 
>  .../bindings/thermal/sun8i-thermal.yaml       | 157 +++++
>  MAINTAINERS                                   |   7 +
>  drivers/thermal/Kconfig                       |  14 +
>  drivers/thermal/Makefile                      |   9 +-
>  drivers/thermal/sun8i_thermal.c               | 596 ++++++++++++++++++
>  5 files changed, 779 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
>  create mode 100644 drivers/thermal/sun8i_thermal.c
> 
> ---
> v5:
> -add more support
> -some trival fix
> ---
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
