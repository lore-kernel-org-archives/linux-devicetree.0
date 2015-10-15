From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 08/13] clk: add ARM syscon ICST device tree bindings
Date: Thu, 15 Oct 2015 12:23:25 -0700
Message-ID: <20151015192325.GN4558@codeaurora.org>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
 <1444916813-31024-9-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444916813-31024-9-git-send-email-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/15, Linus Walleij wrote:
> diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
> new file mode 100644
> index 000000000000..19eb3aa765c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
> @@ -0,0 +1,40 @@
> +ARM System Controller ICST clocks
> +
> +The ICS525 and ICS307 oscillators are produced by Integrated Devices
> +Technology (IDT). ARM integrated these oscillators deeply into their
> +reference designs by adding special control registers that manage such
> +oscillators to their system controllers.
> +
> +The ARM system controller contains logic to serialized and initialize

serialize ?

> +an ICST clock request after a write to the 32 bit register at an offset
> +into the system controller. Further, to even be able to alter one of

Furthermore?

> +these frequencies, the system controller must first be unlocked by
> +writing a special token to another offset in the system controller.

Sounds like a great design!

> +
> +The ICST oscillator must be provided inside a system controller node.
> +
> +Required properties:
> +- lock-offset: the offset address into the system controller where the
> +  unlocking register is located
> +- vco-offset: the offset address into the system controller where the
> +  ICST control register is located (even 32 bit address)

Is there any reason why we don't use a reg property for this?

> +- compatible: must be one of "arm,syscon-icst525" or "arm,syscon-icst307"
> +- #clock-cells: must be <0>
> +- clocks: parent clock, since the ICST needs a parent clock to derive its
> +  frequency from, this attribute is compulsory.
> +
> +Example:
> +
> +syscon: syscon@10000000 {
> +	compatible = "syscon";
> +	reg = <0x10000000 0x1000>;
> +
> +	oscclk0: osc0@0c {
> +		compatible = "arm,syscon-icst307";
> +		#clock-cells = <0>;
> +		lock-offset = <0x20>;
> +		vco-offset = <0x0C>;

lowercase the C?

> +		clocks = <&xtal24mhz>;
> +	};
> +	(...)
> +};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
