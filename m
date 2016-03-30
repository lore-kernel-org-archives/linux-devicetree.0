From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [RFC 5/8] ARM: socfpga: dts: Add Devkit A10-SR fields for
 Arria10
Date: Wed, 30 Mar 2016 12:42:03 -0500
Message-ID: <alpine.DEB.2.02.1603301240250.21508@linux-builds1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com> <1459278791-3646-6-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459278791-3646-6-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawell.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Mar 2016, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:

> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add the Altera Arria10 System Resource node. This is a Multi-Function
> device with GPIO and HWMON support.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
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

I think you need to split this into 2 patches, 1 for adding the SPI nodes, and
the 2nd for adding the slave device.

BR,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
