From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFCv3 1/4] docs: dts: Added documentation for Xilinx Zynq
 Reset Controller bindings.
Date: Tue, 04 Aug 2015 10:09:32 +0200
Message-ID: <1438675772.3793.18.camel@pengutronix.de>
References: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
	 <1438305237-18497-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438305237-18497-2-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Moritz,

Am Donnerstag, den 30.07.2015, 18:13 -0700 schrieb Moritz Fischer:
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/reset/zynq-reset.txt       | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/zynq-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/zynq-reset.txt b/Documentation/devicetree/bindings/reset/zynq-reset.txt
> new file mode 100644
> index 0000000..498c037a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/zynq-reset.txt
> @@ -0,0 +1,68 @@
> +Xilinx Zynq Reset Manager
> +
> +The Zynq AP-SoC has several different resets.
> +
> +See Chapter 26 of the Zynq TRM (UG585) for more information about Zynq resets.
> +
> +Required properties:
> +- compatible: "xlnx,zynq-reset"
> +- reg: SLCR offset and size taken via syscon <0x200 0x48>
> +- syscon: <&slcr>
> +  This should be a phandle to the Zynq's SLCR register.

                                                 ^ register singular?

I still think the syscon phandle property is superfluous,
but I'm fine with keeping it for consistency.
It could always be made optional later.

> +- #reset-cells: Must be 1
> +
> +The Zynq Reset Manager needs to be a childnode of the SLCR.
> +
> +Example:
> +	rstc: rstc@200 {
> +		compatible = "xlnx,zynq-reset";
> +		reg = <0x200 0x48>;
> +		#reset-cells = <1>;
> +		syscon = <&slcr>;
> +	};
> +
> +Reset outputs:
> + 0  : soft reset
> + 32 : ddr reset
> + 64 : topsw reset
> + 96 : dmac reset
> + 128: usb0 reset
> + 129: usb1 reset
> + 160: gem0 reset
> + 161: gem1 reset
> + 164: gem0 rx reset
> + 165: gem1 rx reset
> + 166: gem0 ref reset
> + 167: gem1 ref reset
> + 192: sdio0 reset
> + 193: sdio1 reset
> + 196: sdio0 ref reset
> + 197: sdio1 ref reset
> + 224: spi0 reset
> + 225: spi1 reset
> + 226: spi0 ref reset
> + 227: spi1 ref reset
> + 256: can0 reset
> + 257: can1 reset
> + 258: can0 ref reset
> + 259: can1 ref reset
> + 288: i2c0 reset
> + 289: i2c1 reset
> + 320: uart0 reset
> + 321: uart1 reset
> + 322: uart0 ref reset
> + 323: uart1 ref reset
> + 352: gpio reset
> + 384: lqspi reset
> + 385: qspi ref reset
> + 416: smc reset
> + 417: smc ref reset
> + 448: ocm reset
> + 512: fpga0 out reset
> + 513: fpga1 out reset
> + 514: fpga2 out reset
> + 515: fpga3 out reset
> + 544: a9 reset 0
> + 545: a9 reset 1
> + 552: peri reset
> +

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
