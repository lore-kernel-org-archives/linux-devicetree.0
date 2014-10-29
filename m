From: Santosh Shilimkar <santosh.shilimkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/4] ARM: dts: keystone: add DT bindings for PCI controller
 for port 0
Date: Wed, 29 Oct 2014 12:03:12 -0700
Message-ID: <545139F0.4060409@gmail.com>
References: <1414601134-31825-1-git-send-email-m-karicheri2@ti.com> <1414601134-31825-4-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414601134-31825-4-git-send-email-m-karicheri2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/29/2014 09:45 AM, Murali Karicheri wrote:
> Add common DT bindings to support PCI controller driver for port 0 on all of
> the K2 SoCs that has Synopsis Designware based pcie h/w.
>
> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
> CC: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> CC: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> CC: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> CC: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>   v1 - fixed email ID for Santosh and reworded the commit description a bit to
>        be consistent with the subject.
>   arch/arm/boot/dts/keystone.dtsi |   45 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
> index 5d3e83f..87b2daa 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -285,5 +285,50 @@
>   			#interrupt-cells = <1>;
>   			ti,syscon-dev = <&devctrl 0x2a0>;
>   		};
> +
> +		pcie@21800000 {
> +			compatible = "ti,keystone-pcie", "snps,dw-pcie";
> +			clocks = <&clkpcie>;
> +			clock-names = "pcie";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			reg =  <0x21801000 0x2000>, <0x21800000 0x1000>, <0x02620128 4>;
> +			ranges = <0x81000000 0 0 0x23250000 0 0x4000
> +				0x82000000 0 0x50000000 0x50000000 0 0x10000000>;
> +
> +			device_type = "pci";
> +			num-lanes = <2>;
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc0 0>, // INT A
> +					<0 0 0 2 &pcie_intc0 1>, // INT B
> +					<0 0 0 3 &pcie_intc0 2>, // INT C
> +					<0 0 0 4 &pcie_intc0 3>; // INT D
> +
Can you just keep the comments under /* ... * / just to be consistent
across file. Rest of the patch looks fine by me.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
