From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: aspeed: Adding Facebook TioagaPass BMC
Date: Thu, 13 Sep 2018 22:17:39 +0200
Message-ID: <20180913201739.GG23892@lunn.ch>
References: <20180913195751.1833227-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180913195751.1833227-1-vijaykhemka@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au, afaerber@suse.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

> +++ b/arch/arm/boot/dts/Makefile
> @@ -1206,4 +1206,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> +	aspeed-bmc-facebook-tiogapass.dtb \

Hi Vijay

These entries are normally kept in alphabetic order.

> +	leds {
> +		compatible = "gpio-leds";
> +		postcode0 {
> +			label="BMC_UP";

Documentation/leds/leds-class.txt

LED Device Naming
=================

Is currently of the form:

"devicename:colour:function"

	Andrew
