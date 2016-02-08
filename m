From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: add the Alpine v2 EVP
Date: Mon, 08 Feb 2016 13:20:40 +0100
Message-ID: <2530828.WgKqLzsO0l@wuerfel>
References: <1454922699-16785-1-git-send-email-antoine.tenart@free-electrons.com> <1454922699-16785-3-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454922699-16785-3-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rshitrit-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Barak Wasserstrom <barak-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 08 February 2016 10:11:38 Antoine Tenart wrote:
> index 000000000000..3e3080fa45e4
> --- /dev/null
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "Annapurna Labs Alpine v2";
> +	compatible = "al,alpine-v2";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};

Move the aliases to the .dts files and drop the ones that are disabled.

> +
> +		pcie-internal@0xfbc00000 {

make this

		pci@fbc00000 {

> +			compatible = "pci-host-ecam-generic";
> +			device_type = "pci";
> +			#size-cells = <2>;
> +			#address-cells = <3>;
> +			#interrupt-cells = <1>;
> +			reg = <0x0 0xfbc00000 0x0 0x100000>;
> +			interrupt-map-mask = <0xf800 0 0 7>;
> +			/* add legacy interrupts for SATA only */
> +			interrupt-map = <0x4000 0 0 1 &gic 0 53 4>,
> +					<0x4800 0 0 1 &gic 0 54 4>;

What's wrong with the other IRQs? Not connected?

> +
> +		uart0: uart@fd883000 {

			serial@fd883000


Almost all devices are in the 0xfd000000 range. Could this be a bus in the
SoC that has all the devices attached to it? Maybe use a "ranges" property
to reflect that. In doubt, use the register numbers from the data sheet if you
have one.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
