From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2 5/8] ARM: socfpga: dts: Add SPI Master1 for Arria10 SR
 chip
Date: Mon, 10 Oct 2016 14:10:34 -0500
Message-ID: <9ed01d54-4c7e-1bfa-7f29-8feb309b9b50@opensource.altera.com>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
 <1464889948-28793-6-git-send-email-tthayer@opensource.altera.com>
Reply-To: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464889948-28793-6-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dihn,

On 06/02/2016 12:52 PM, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Add the Altera Arria10 SPI Master Node in preparation for
> the A10SR MFD node.
>
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2:  No change
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index 17e81dc..e7b6c4a 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -567,6 +567,21 @@
>  			status = "disabled";
>  		};
>
> +		spi1: spi@ffda5000 {
> +			compatible = "snps,dw-apb-ssi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xffda5000 0x100>;
> +			interrupts = <0 102 4>;
> +			num-chipselect = <4>;
> +			bus-num = <0>;
> +			/*32bit_access;*/
> +			tx-dma-channel = <&pdma 16>;
> +			rx-dma-channel = <&pdma 17>;
> +			clocks = <&spi_m_clk>;
> +			status = "disabled";
> +		};
> +
>  		sdr: sdr@ffc25000 {
>  			compatible = "syscon";
>  			reg = <0xffcfb100 0x80>;
>
I lost track of this patch. Any comments on this patch?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
