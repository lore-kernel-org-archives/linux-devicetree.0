From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: k2l-mvm: add 1g ethernet phys nodes
Date: Tue, 21 Oct 2014 14:23:01 -0400
Message-ID: <5446A485.50109@ti.com>
References: <1413811244-4041-1-git-send-email-grygorii.strashko@ti.com> <1413811244-4041-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413811244-4041-2-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/20/2014 09:20 AM, Grygorii Strashko wrote:
> Keystone K2L-EVM has two 1G Marvell 88E1514 Ethernet PHYs
> installed, which are compatible with 88E1510.
> Hence, add corresponding child nodes for 1G MDIO bus.
>
> For more information see:
>    https://www.einfochips.com/index.php/partnerships/texas-instruments/k2l-evm.html
>
> Signed-off-by: Grygorii Strashko<grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
>   arch/arm/boot/dts/k2l-evm.dts | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/k2l-evm.dts b/arch/arm/boot/dts/k2l-evm.dts
> index fec4312..85cc7f2 100644
> --- a/arch/arm/boot/dts/k2l-evm.dts
> +++ b/arch/arm/boot/dts/k2l-evm.dts
> @@ -116,3 +116,15 @@
>   		};
>   	};
>   };
> +
> +&mdio {
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "marvell,88E1514", "marvell,88E1510", "ethernet-phy-ieee802.3-c22";
> +		reg =<0>;
> +	};
> +
> +	ethphy1: ethernet-phy@1 {
> +		compatible = "marvell,88E1514", "marvell,88E1510", "ethernet-phy-ieee802.3-c22";
> +		reg =<1>;
> +	};
> +};

In the subject do s/k2l-mvm/k2l-evm/

-- 
Murali Karicheri
Linux Kernel, Texas Instruments
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
