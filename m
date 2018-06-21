From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/5] arm64: dts: ti: Add Support for AM654 SoC
Date: Wed, 20 Jun 2018 22:37:54 -0700
Message-ID: <20180621053754.GD112168@atomide.com>
References: <20180619194253.27288-1-nm@ti.com>
 <20180619194253.27288-4-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619194253.27288-4-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

* Nishanth Menon <nm@ti.com> [180619 19:46]:
> +	cbass_main: cbass@100000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x00100000 0x00 0x00100000 0x00020000>, /* ctrl mmr */
> +			 <0x00600000 0x00 0x00600000 0x00001100>, /* GPIO */
> +			 <0x00900000 0x00 0x00900000 0x00012000>, /* serdes */
> +			 <0x01000000 0x00 0x01000000 0x0af02400>, /* Most peripherals */
> +			 <0x30800000 0x00 0x30800000 0x0bc00000>, /* MAIN NAVSS */
> +			 /* MCUSS Range */
> +			 <0x28380000 0x00 0x28380000 0x03880000>,
> +			 <0x40200000 0x00 0x40200000 0x00900100>,
> +			 <0x42040000 0x00 0x42040000 0x03ac2400>,
> +			 <0x45100000 0x00 0x45100000 0x00c24000>,
> +			 <0x46000000 0x00 0x46000000 0x00200000>,
> +			 <0x47000000 0x00 0x47000000 0x00068400>;
> +
> +		cbass_mcu: cbass@28380000 {
> +			compatible = "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x28380000 0x28380000 0x03880000>, /* MCU NAVSS*/
> +				 <0x40200000 0x40200000 0x00900100>, /* First peripheral window */
> +				 <0x42040000 0x42040000 0x03ac2400>, /* WKUP */
> +				 <0x45100000 0x45100000 0x00c24000>, /* MMRs, remaining NAVSS */
> +				 <0x46000000 0x46000000 0x00200000>, /* CPSW */
> +				 <0x47000000 0x47000000 0x00068400>; /* OSPI space 1 */
> +
> +			cbass_wakeup: cbass@42040000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				/* WKUP  Basic peripherals */
> +				ranges = <0x42040000 0x42040000 0x03ac2400>;
> +			};
> +		};
> +	};
> +};

You should use cbass_main: interconnect@1000000 and so on here.
Other than that looks good to me, thanks for updating it.

Regards,

Tony
