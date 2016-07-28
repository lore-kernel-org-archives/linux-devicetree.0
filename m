From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 17/18] ARM: mvebu: a390-db: add support for the Armada 390 DB board
Date: Thu, 28 Jul 2016 15:01:12 +0200
Message-ID: <87lh0lkjc7.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-19-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469105055-25181-19-git-send-email-jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:14 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:

Change the prefix to "ARM: dts: mvebu: armada-390-db:"

> This commit adds description for following features for this board:
>
> - Serial port
> - I2C buses
> - 16MB SPI-NOR
> - USB2.0
> - USB3.0
> - PCIe interfaces
>
> Signed-off-by: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-390-db.dts | 164 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-390-db.dts
>
[...]

> +
> +			i2c@11000 {

It would be interesting to know if there is something connected on this
bus.

> +				status = "okay";
> +				clock-frequency = <100000>;
> +			};
> +
> +			serial@12000 {

It would be nice to indicate the name of the connector on the board.

> +				status = "okay";
> +			};
> +
> +			usb@58000 {
Here to

> +				status = "okay";
> +			};
> +
> +			flash@d0000 {
> +				status = "okay";
> +				pinctrl-0 = <&nand_pins>;
> +				pinctrl-names = "default";
> +				num-cs = <1>;
> +				marvell,nand-keep-config;
> +				marvell,nand-enable-arbiter;
> +				nand-on-flash-bbt;
> +				nand-ecc-strength = <8>;
> +				nand-ecc-step-size = <512>;
> +
> +				partitions {
> +					compatible = "fixed-partitions";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					partition@0 {
> +						label = "U-Boot";
> +						reg = <0 0x800000>;
> +					};
> +					partition@800000 {
> +						label = "Linux";
> +						reg = <0x800000 0x800000>;
> +					};
> +					partition@1000000 {
> +						label = "Filesystem";
> +						reg = <0x1000000 0x3f000000>;
> +					};
> +				};
> +			};
> +
> +			usb3@f8000 {

Ditto

> +				status = "okay";
> +			};
> +		};
> +
> +		pcie-controller {
> +			status = "okay";
> +
And the same for the following PCIe ports.

> +			pcie@1,0 {
> +				status = "okay";
> +			};
> +
> +			pcie@2,0 {
> +				status = "okay";
> +			};
> +
> +			pcie@3,0 {
> +				status = "okay";
> +			};
> +		};
> +	};
> +};

Then you can add my

Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,

Gregory


> -- 
> 1.8.3.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
