From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 3/4] ARM: DT: STi: Add DT node for MiPHY365x
Date: Sun, 2 Mar 2014 00:13:58 +0530
Message-ID: <53122A6E.3070001@ti.com>
References: <1392377036-12816-1-git-send-email-lee.jones@linaro.org>
 <1392377036-12816-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1392377036-12816-3-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 14 February 2014 04:53 PM, Lee Jones wrote:
> The MiPHY365x is a Generic PHY which can serve various SATA or PCIe
> devices. It has 2 ports which it can use for either; both SATA, both
> PCIe or one of each in any configuration.
>
> Cc: devicetree@vger.kernel.org
> Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

since this uses 'dt-bindings/phy/phy-miphy365x.h' which is used in phy 
driver as well, I need ACK from dt maintainers so that I can queue both 
the driver and dt patches myself.

Thanks
Kishon
> ---
>   arch/arm/boot/dts/stih416-b2020-revE.dts |  6 +++++-
>   arch/arm/boot/dts/stih416-b2020.dts      |  6 ++++++
>   arch/arm/boot/dts/stih416.dtsi           | 13 +++++++++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/stih416-b2020-revE.dts b/arch/arm/boot/dts/stih416-b2020-revE.dts
> index a874570..dbe67fa 100644
> --- a/arch/arm/boot/dts/stih416-b2020-revE.dts
> +++ b/arch/arm/boot/dts/stih416-b2020-revE.dts
> @@ -32,6 +32,10 @@
>   		ethernet1: ethernet@fef08000 {
>   			snps,reset-gpio 	= <&PIO0 7>;
>   		};
> -	};
>
> +		miphy365x_phy: miphy365x@0 {
> +			st,pcie_tx_pol_inv = <1>;
> +			st,sata_gen = "gen3";
> +		};
> +	};
>   };
> diff --git a/arch/arm/boot/dts/stih416-b2020.dts b/arch/arm/boot/dts/stih416-b2020.dts
> index 276f28d..fd9cbad 100644
> --- a/arch/arm/boot/dts/stih416-b2020.dts
> +++ b/arch/arm/boot/dts/stih416-b2020.dts
> @@ -13,4 +13,10 @@
>   	model = "STiH416 B2020";
>   	compatible = "st,stih416", "st,stih416-b2020";
>
> +	soc {
> +		miphy365x_phy: miphy365x@0 {
> +			st,pcie_tx_pol_inv = <1>;
> +			st,sata_gen = "gen3";
> +		};
> +	};
>   };
> diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
> index 85b8063..9fd8efb 100644
> --- a/arch/arm/boot/dts/stih416.dtsi
> +++ b/arch/arm/boot/dts/stih416.dtsi
> @@ -9,6 +9,8 @@
>   #include "stih41x.dtsi"
>   #include "stih416-clock.dtsi"
>   #include "stih416-pinctrl.dtsi"
> +
> +#include <dt-bindings/phy/phy-miphy365x.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/reset-controller/stih416-resets.h>
>   / {
> @@ -140,5 +142,16 @@
>   			clocks		= <&CLK_S_ICN_REG_0>;
>   		};
>
> +		miphy365x_phy: miphy365x@0 {
> +			compatible      = "st,miphy365x-phy";
> +			reg        	= <0xfe382000 0x100>,
> +					  <0xfe38a000 0x100>,
> +					  <0xfe394000 0x100>,
> +					  <0xfe804000 0x100>;
> +			reg-names  	= "sata0", "sata1", "pcie0", "pcie1";
> +
> +			#phy-cells 	= <2>;
> +			st,syscfg  	= <&syscfg_rear>;
> +		};
>   	};
>   };
>
