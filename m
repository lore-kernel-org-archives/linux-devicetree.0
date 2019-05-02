From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: perf: stm32: ddrperfm support
Date: Thu, 2 May 2019 15:51:24 -0500
Message-ID: <20190502205124.GA17384@bogus>
References: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
 <1556532194-27904-3-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556532194-27904-3-git-send-email-gerald.baeza@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerald BAEZA <gerald.baeza@st.com>
Cc: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 29, 2019 at 10:03:37AM +0000, Gerald BAEZA wrote:
> The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.
> 
> This documentation indicates how to enable stm32-ddr-pmu driver on
> DDRPERFM peripheral, via the device tree.
> 
> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
> ---
>  .../devicetree/bindings/perf/stm32-ddr-pmu.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> 
> diff --git a/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt b/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> new file mode 100644
> index 0000000..dabc4c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> @@ -0,0 +1,18 @@
> +* STM32 DDR Performance Monitor (DDRPERFM)
> +
> +Required properties:
> +- compatible: must be "st,stm32-ddr-pmu".
> +- reg: physical address and length of the registers set.
> +- clocks: list of phandles and specifiers to all input clocks listed in
> +	  clock-names property.
> +- clock-names: "bus" corresponds to the DDRPERFM bus clock and "ddr" to
> +	       the DDR frequency.

You have 'resets' in the dts.

> +
> +Example:
> +	ddrperfm: perf@5a007000 {
> +		compatible = "st,stm32-ddr-pmu";
> +		reg = <0x5a007000 0x400>;
> +		clocks = <&rcc DDRPERFM>, <&rcc PLL2_R>;
> +		clock-names = "bus", "ddr";
> +	};
> +
> -- 
> 2.7.4
