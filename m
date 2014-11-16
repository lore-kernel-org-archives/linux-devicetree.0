From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2 5/8] arm: mvebu: add common uart0 and spi0 pintcrl
 entries for Armada 370
Date: Sun, 16 Nov 2014 22:10:34 +0100
Message-ID: <20141116211034.GJ15870@lunn.ch>
References: <cover.1416158990.git.arno@natisbad.org>
 <d550094896837ac921e5d2a69fc5aae9b287a98a.1416158990.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d550094896837ac921e5d2a69fc5aae9b287a98a.1416158990.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 16, 2014 at 06:37:33PM +0100, Arnaud Ebalard wrote:
> 
> pinctrl entries for uart0 using MPP0-1 and spi0 using MPP33-36 are
> common configurations. Instead of replicating them in each .dts file,
> put those in armada-370.dtsi file so that they can be referenced.
> 
> Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-370.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
> index 6b3c23b1e138..d9f5d59e463e 100644
> --- a/arch/arm/boot/dts/armada-370.dtsi
> +++ b/arch/arm/boot/dts/armada-370.dtsi
> @@ -115,6 +115,17 @@
>  				compatible = "marvell,mv88f6710-pinctrl";
>  				reg = <0x18000 0x38>;
>  
> +				uart0_pins: uart0-pins {
> +					marvell,pins = "mpp0", "mpp1";
> +					marvell,function = "uart0";
> +				};

Thanks for these.

We can go one stage further. kirkwood.dts has:

                uart0: serial@12000 {
                        compatible = "ns16550a";
                        reg = <0x12000 0x100>;
                        reg-shift = <2>;
                        interrupts = <33>;
                        clocks = <&gate_clk 7>;
                        pinctrl-0 = <&pmx_uart0>;
                        pinctrl-names = "default";
                        status = "disabled";
                };

i.e actually references them. This is safe because a board .dts file
can override the pins if needed.

We should do the same here, both for 370 and XP.

   Andrew

> +
> +				spi0_pins: spi0-pins {
> +					marvell,pins = "mpp33", "mpp34",
> +						       "mpp35", "mpp36";
> +					marvell,function = "spi0";
> +				};
> +
>  				sdio_pins1: sdio-pins1 {
>  					marvell,pins = "mpp9",  "mpp11", "mpp12",
>  							"mpp13", "mpp14", "mpp15";
> -- 
> 2.1.1
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
