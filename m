From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/6] powerpc/corenet: Create the dts components for the
 DPAA FMan
Date: Mon, 21 Apr 2014 17:11:02 -0500
Message-ID: <1398118262.1694.188.camel@snotra.buserror.net>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com>
	 <1397823693-27977-4-git-send-email-Shruti@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397823693-27977-4-git-send-email-Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-04-18 at 07:21 -0500, Shruti Kanetkar wrote:
> +fman@400000 {
> +	mdio@f1000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "fsl,fman-xmdio";
> +		reg = <0xf1000 0x1000>;
> +	};
> +};

I'd like to see a complete fman binding before we start adding pieces.

> +fman@400000 {
> +	mdio0: mdio@e1120 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "fsl,fman-mdio";
> +		reg = <0xe1120 0xee0>;
> +	};
> +};

What is the difference between "fsl,fman-mdio" and "fsl,fman-xmdio"?  I
don't see the latter on the list of compatibles in patch 3/6.

Within each category, is the exact fman version discoverable from the
mdio registers?

> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi
> new file mode 100644
> index 0000000..ced5786
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi
> @@ -0,0 +1,52 @@
> +/*
> + * QorIQ FMan v3 device tree stub [ controller @ offset 0x500000 ]
> + *
> + * Copyright 2012 Freescale Semiconductor Inc.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions are met:
> + *     * Redistributions of source code must retain the above copyright
> + *       notice, this list of conditions and the following disclaimer.
> + *     * Redistributions in binary form must reproduce the above copyright
> + *       notice, this list of conditions and the following disclaimer in the
> + *       documentation and/or other materials provided with the distribution.
> + *     * Neither the name of Freescale Semiconductor nor the
> + *       names of its contributors may be used to endorse or promote products
> + *       derived from this software without specific prior written permission.
> + *
> + *
> + * ALTERNATIVELY, this software may be distributed under the terms of the
> + * GNU General Public License ("GPL") as published by the Free Software
> + * Foundation, either version 2 of that License or (at your option) any
> + * later version.
> + *
> + * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
> + * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> + * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> + * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
> + * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> + * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> + * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> + * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> + * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +*/
> +
> +fman@500000 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "simple-bus";

Why is this simple-bus?

> +
> +	/* mdio nodes for fman v3 @ 0x500000 */
> +	mdio@fc000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0xfc000 0x1000>;
> +	};
> +
> +	mdio@fd000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0xfd000 0x1000>;
> +	};
> +};

Where's the compatible?  Why is this file different from all the others?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
