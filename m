From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH v2 0/3] ARM: sun8i: a83t: Support Camera Sensor Interface
 controller
Date: Mon, 20 May 2019 17:10:03 +0200
Message-ID: <20190520151003.uklhhak5clxi5zpf@core.my.home>
References: <20190520150637.23557-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520150637.23557-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 05:06:34PM +0200, verejna wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> This is a re-send of Chen-Yu's A83T CSI patch series with review tags
> applied and removed address/size cells from csi_in port. Already applied
> patches from v1  were dropped.
> 
> The series is ready to be merged:
> 
>   Patch 1 and 2 via sunxi tree
>   Patch 3 via media tree

Sorry, wrong numbers. 2 is for media tree, 3 is for sunxi, 1 is a dt-bindings
patch, where I'm not sure.

thanks,
	Ondrej

> v2:
> - dropped address/size cells from csi_in port
> - added review tags
> 
> Please take a look and merge.
> 
> Thank you,
> 	Ondrej
> 
> --------------------------
> Original description:
> 
> Hi everyone,
> 
> This series adds support for the camera sensor interface controller
> found on the Allwinner A83T SoC. The controller is similar to the one
> found on  the H3, with the addition of a MIPI CSI-2 interface. However,
> this series only supports parallel and BT.656 interfaces, based on the
> existing driver.
> 
> Patch 1 adds an undocumented clock parent of the CSI MCLK. This was
> found after finding the default value to sometimes work and sometimes
> not, and then comparing against BSP code.
> 
> Patch 2 adds a compatible string for the A83T variant.
> 
> Patch 3 adds support for the A83T variant to the existing sun6i-csi
> driver.
> 
> Patch 4 adds a device node for the controller, as well as commonly
> used pin muxing options.
> 
> Patch 5 adds a pin muxing option for I2C1 on the PE pins, used in
> conjunction with the CSI pins.
> 
> Patch 6 provides an example usage of the CSI controller: the Bananapi M3
> with its camera module attached.
> 
> Please have a look.
> 
> Regards
> ChenYu
> 
> Chen-Yu Tsai (3):
>   dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
>   media: sun6i: Support A83T variant
>   ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor
>     Interface)
> 
>  .../devicetree/bindings/media/sun6i-csi.txt   |  1 +
>  arch/arm/boot/dts/sun8i-a83t.dtsi             | 29 +++++++++++++++++++
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  1 +
>  3 files changed, 31 insertions(+)
> 
> -- 
> 2.21.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
