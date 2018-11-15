From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/3] arm64: dts: stratix10: use "altr,stratix10-rst-mgr"
 binding
Date: Thu, 15 Nov 2018 10:33:04 +0100
Message-ID: <1542274384.4915.4.camel@pengutronix.de>
References: <20181105200549.17159-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105200549.17159-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinh.nguyen@intel.com>
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On Mon, 2018-11-05 at 14:05 -0600, Dinh Nguyen wrote:
> From: Dinh Nguyen <dinh.nguyen@intel.com>
> 
> The standard reset-simple driver the uses the "altr,rst-mgr" binding is
> not getting initialized early enough in the boot process, so timers
> that the kernel needs are still left in reset. Thus an early
> reset driver was created. This early reset driver is only for the
> SoCFPGA 32-bit platform.
> 
> The Stratix10 platform does not need any of the timers that in reset to
> boot, thus we don't need to early reset driver. Therefore, use the
> "altr,stratix10-rst-mgr" binding for the reset-simple platform driver on
> the Stratix10 platform.
> 
> Also remove the "altr,modrst-offset" property because the driver no
> longer needs it.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 8253a1a9e985..5f0b18ae5007 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -308,9 +308,8 @@
>  
>  		rst: rstmgr@ffd11000 {
>  			#reset-cells = <1>;
> -			compatible = "altr,rst-mgr";
> +			compatible = "altr,stratix10-rst-mgr", "altr,rst-mgr";
>  			reg = <0xffd11000 0x1000>;
> -			altr,modrst-offset = <0x20>;
>  		};
>  
>  		spi0: spi@ffda4000 {

Do you want me to pick this up as well, or just patches 2 and 3?

regards
Philipp
