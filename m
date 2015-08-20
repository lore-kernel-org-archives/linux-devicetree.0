From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv2] arm64: dts: Add base stratix 10 dtsi
Date: Thu, 20 Aug 2015 18:23:08 +0100
Message-ID: <20150820172308.GA2711@svinekod>
References: <1439308127-7412-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439308127-7412-1-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "dinh.linux@gmail.com" <dinh.linux@gmail.com>, "jszhang@marvell.com" <jszhang@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> +/ {
> +	compatible = "altr,socfpga-stratix10";
> +	#address-cells = <1>;
> +	#size-cells = <1>;

I would recommend that you make your root #address-cells and #size-cells equal
to 2, as that will simplify matters later if/when you need to add anything
beyond the first 4GB for some particular board.

If everything in the SoC falls within the first 4GB you can have a ranges
property on your /soc node and have only one cell below that.

[...]

> +	intc: intc@ffff8000 {

The unit-address doesn't match the first address in the reg entry.

> +		compatible = "arm,gic-400", "arm,cortex-a15-gic";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x0 0xffff9000 0x1000>,
> +		      <0x0 0xffffa000 0x2000>,
> +		      <0x0 0xffffc000 0x1000>,
> +		      <0x0 0xffffd000 0x1000>;
> +	};

Shouldn't the virtual CPU interface also be 0x2000 long?

Mark.
