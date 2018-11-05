From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH RESEND] arm: dts: socfpga*.dts*: use
 SPDX-License-Identifier
Date: Mon, 5 Nov 2018 14:30:15 -0600
Message-ID: <37965331-4b5e-fb95-6a88-b51669128853@kernel.org>
References: <20181105202727.23602-1-simon.k.r.goldschmidt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105202727.23602-1-simon.k.r.goldschmidt@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org



On 11/5/18 2:27 PM, Simon Goldschmidt wrote:
> Follow the recent trend for the license description.
> 
> This is also in an effort to fully sync the devicetrees with U-Boot.
> 
> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> ---
> Resending this as requested by Dinh. It still applies on top of
> 4.20-rc1 as it only touches the file headers and nothing has changed
> there.
> ---
>  arch/arm/boot/dts/socfpga.dtsi                | 16 +------
>  arch/arm/boot/dts/socfpga_arria10.dtsi        | 13 +-----
>  arch/arm/boot/dts/socfpga_arria10_socdk.dtsi  | 14 +-----
>  .../boot/dts/socfpga_arria10_socdk_nand.dts   | 13 +-----
>  .../boot/dts/socfpga_arria10_socdk_qspi.dts   | 13 +-----
>  .../boot/dts/socfpga_arria10_socdk_sdmmc.dts  | 14 +-----
>  arch/arm/boot/dts/socfpga_arria5.dtsi         | 15 +-----
>  arch/arm/boot/dts/socfpga_arria5_socdk.dts    | 16 +------
>  arch/arm/boot/dts/socfpga_cyclone5.dtsi       | 16 +------
>  .../dts/socfpga_cyclone5_de0_nano_soc.dts     | 13 +-----
>  arch/arm/boot/dts/socfpga_cyclone5_mcv.dtsi   | 14 +-----
>  arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts | 14 +-----
>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts  | 16 +------
>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts | 16 +------
>  .../boot/dts/socfpga_cyclone5_socrates.dts    | 16 +------
>  arch/arm/boot/dts/socfpga_cyclone5_sodia.dts  | 16 +------
>  .../boot/dts/socfpga_cyclone5_vining_fpga.dts | 46 +------------------
>  arch/arm/boot/dts/socfpga_vt.dts              | 16 +------
>  18 files changed, 28 insertions(+), 269 deletions(-)

Applied!

Thanks,
Dinh
