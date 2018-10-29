From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm: dts: socfpga*.dts*: use SPDX-License-Identifier
Date: Mon, 29 Oct 2018 10:33:39 -0500
Message-ID: <b7790735-c797-a5e3-ccf5-01080f652945@kernel.org>
References: <20181023190853.23252-1-simon.k.r.goldschmidt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023190853.23252-1-simon.k.r.goldschmidt@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On 10/23/2018 02:08 PM, Simon Goldschmidt wrote:
> Follow the recent trend for the license description.
> 
> This is also in an effort to fully sync the devicetrees with U-Boot.
> 
> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
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
> 

error: arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dts: does not
exist in index

Can you please rebase this patch after v4.20-rc1 has landed? The above
board filename has been changed.

Thanks,
Dinh
