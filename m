From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/8] ARM: dts: iwg22d: Enable SDHI0 controller
Date: Fri, 15 Sep 2017 10:05:30 +0200
Message-ID: <20170915080530.GH3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-5-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505322341-9480-5-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 06:05:37PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Enable the SDHI0 controller on iWave RZ/G1E carrier board.

...

> @@ -63,3 +88,15 @@
>  		micrel,led-mode = <1>;
>  	};
>  };
> +
> +&sdhi0 {
> +	pinctrl-0 = <&sdhi0_pins>;
> +	pinctrl-1 = <&sdhi0_pins_uhs>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&vccq_sdhi0>;
> +	cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;

I take that the absence of a wp-gpio means that that this is a µSD slot.
Could you help me by documenting this correctly on
http://elinux.org/index.php?title=Renesas-MMC-Enabled-Speeds ?

For some reason I thought that SDHI0 wasn't exposed at all, so I guess
my reading of the documentation was incorrect.


I think you also want sd-uhs-sdr50 here too.
You can test it by removing the sd-uhs-sdr104 property.

> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> -- 
> 1.9.1
> 
