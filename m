Return-Path: <shawnguo@kernel.org>
Date: Mon, 19 Aug 2019 14:01:42 +0200
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6: replace simple-bus by simple-mfd for
 anatop
Message-ID: <20190819120140.GC5999@X250>
References: <20190814075558.2319-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814075558.2319-1-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 14, 2019 at 09:55:57AM +0200, Marco Felsch wrote:
> Replace it to fix the following DTC warnings:
> 
> arch/arm/boot/dts/imx6qdl.dtsi:702.19-715.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-1p1: missing or empty reg/ranges property
> arch/arm/boot/dts/imx6qdl.dtsi:717.19-730.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-3p0: missing or empty reg/ranges property
> arch/arm/boot/dts/imx6qdl.dtsi:732.19-745.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-2p5: missing or empty reg/ranges property
> arch/arm/boot/dts/imx6qdl.dtsi:747.32-762.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddcore: missing or empty reg/ranges property
> arch/arm/boot/dts/imx6qdl.dtsi:764.29-779.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddpu: missing or empty reg/ranges property
> arch/arm/boot/dts/imx6qdl.dtsi:781.31-796.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddsoc: missing or empty reg/ranges property
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied both, thanks.
