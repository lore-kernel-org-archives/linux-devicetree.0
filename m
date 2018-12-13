From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arch: arm: socfpga: arria10: Add stmmac ptp_ref clock to
 socdk devicetree
Date: Thu, 13 Dec 2018 15:56:50 -0600
Message-ID: <c703c4d4-4442-19b1-8645-aa906b08f7e6@kernel.org>
References: <20181213205910.26359-1-dalon.westergreen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213205910.26359-1-dalon.westergreen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dwesterg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thor.thayer@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-Id: devicetree@vger.kernel.org



On 12/13/18 2:59 PM, dwesterg@gmail.com wrote:
> From: Dalon Westergreen <dalon.westergreen@linux.intel.com>
> 
> Add the stmmac ptp_ref clock as it is configured in the arria10 socdk.
> The stmmac driver defaults the ptp_ref clock to the main stmmac clock
> if the ptp_ref clock is not set in the devicetree.  This is inapprotiate

s/inapprotiate/inappropriate

> for the arria10 socdk.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> index 2a7466891d0e..58bfa84dcdb3 100644
> --- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> @@ -74,7 +74,8 @@
>  &gmac0 {
>  	phy-mode = "rgmii";
>  	phy-addr = <0xffffffff>; /* probe for phy addr */
> -
> +	clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
> +	clock-names = "stmmaceth", "ptp_ref";
>  	
These should go into the base arria10 dtsi at socfpga_arria10.dtsi?
Should the other gmacs get the same updates?

Also the patch header should be "ARM: dts: arria10:"

Dinh
