From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 4/6] ARM: at91/dt: define sama5d3xek's main clk frequency
Date: Wed, 9 Oct 2013 15:12:20 +0200
Message-ID: <52555634.7020500@atmel.com>
References: <1375951572-10829-1-git-send-email-b.brezillon@overkiz.com> <1375954563-11343-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375954563-11343-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>, Russell King <linux@arm.linux.org.uk>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Ludovic Desroches <ludovic.desroches@atmel.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/08/2013 11:36, Boris BREZILLON :
> Define the main clock frequency for the new main clock node
> in sama5d3xcm.dtsi.
>
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>   arch/arm/boot/dts/sama5d3xcm.dtsi |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sama5d3xcm.dtsi b/arch/arm/boot/dts/sama5d3xcm.dtsi
> index 6a1871b..f19d5bf 100644
> --- a/arch/arm/boot/dts/sama5d3xcm.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xcm.dtsi
> @@ -38,6 +38,12 @@
>   			macb0: ethernet@f0028000 {
>   				phy-mode = "rgmii";
>   			};
> +
> +			pmc: pmc@fffffc00 {
> +				main: mainck {
> +					clock-frequency = <12000000>;
> +				};
> +			};
>   		};
>
>   		nand0: nand@60000000 {
>


-- 
Nicolas Ferre
