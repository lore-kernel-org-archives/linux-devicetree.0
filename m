From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] ARM: zynq: DT: Use the zynq binding with macb
Date: Thu, 28 May 2015 09:22:30 +0100
Message-ID: <20150528082230.GY2067@n2100.arm.linux.org.uk>
References: <1432756728-6778-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432756728-6778-1-git-send-email-nathan.sullivan@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Sullivan <nathan.sullivan@ni.com>
Cc: michal.simek@xilinx.com, soren.brinkmann@xilinx.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2015 at 02:58:48PM -0500, Nathan Sullivan wrote:
> Use the new zynq binding for macb ethernet, since it will disable half
> duplex gigabit like the Zynq TRM says to do. Also allow the compatible
> cadence gem binding that won't disable half duplex but works otherwise.
> 
> Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> index a5cd2ed..154bf93 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -57,7 +57,7 @@
>  		regulator-always-on;
>  	};
>  
> -	amba {
> +	amba@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
>  		#size-cells = <1>;

ePAPR (which we follow on ARM) requires a reg= property if you have
an '@' number.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
