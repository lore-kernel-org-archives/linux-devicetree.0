From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 0/3] Add DSP node on i.MX8QXP board
Date: Fri, 19 Jul 2019 09:00:05 +0200
Message-ID: <20190719070005.mkqvfhjras2jmo52@pengutronix.de>
References: <20190718151346.3523-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190718151346.3523-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, mark.rutland@arm.com, aisheng.dong@nxp.com, peng.fan@nxp.com, anson.huang@nxp.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, paul.olaru@nxp.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, leonard.crestez@nxp.com, festevam@gmail.com, shengjiu.wang@nxp.com, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

thanks for your patches :) but it's quite common to bundle the driver
related and the dt related patches. Can you add the firmware related
patch to this series in your v2?

Regards,
  Marco

On 19-07-18 18:13, Daniel Baluta wrote:
> i.MX8QXP boards feature an Hifi4 DSP from Tensilica. This patch series
> adds the DT node.
> 
> Note that we switched to the new yaml format for bindings documentation.
> 
> The DSP will run SOF Firmware [1]. Patches adding support for Linux DSP
> driver are already sent for review to SOF folks [2].
> 
> This patch series also contains a patch introducing DT related clocks.
> 
> The patch was already reviewed here:
> 	https://lkml.org/lkml/2019/7/17/975
> 
> but I added it in this patch series because it wasn't yet picked by
> Shawn so patches 2/3 will not compiled without patch 1.
> 
> [1] https://github.com/thesofproject/sof
> [2] https://github.com/thesofproject/linux/pull/1048/commits
> 
> Daniel Baluta (3):
>   clk: imx8: Add DSP related clocks
>   arm64: dts: imx8qxp: Add DSP DT node
>   dt-bindings: dsp: fsl: Add DSP core binding support
> 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 87 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  4 +
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 32 +++++++
>  drivers/clk/imx/clk-imx8qxp-lpcg.c            |  5 ++
>  include/dt-bindings/clock/imx8-clock.h        |  6 +-
>  5 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> 
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
