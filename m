From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] regulator: anatop: Add support for "anatop-enable-bit"
Date: Fri, 13 Jan 2017 11:07:42 -0600
Message-ID: <20170113170742.n4vacn373rmh6qqs@rob-hp-laptop>
References: <20170110163015.22444-1-andrew.smirnov@gmail.com>
 <20170110163015.22444-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170110163015.22444-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-kernel@vger.kernel.org, yurovsky@gmail.com, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2017 at 08:30:14AM -0800, Andrey Smirnov wrote:
> Add code to support support for "anatop-enable-bit" device-tree
> property. This property translates to LINREG_ENABLE bit in real hardware
> and is present on 1p1, 2p5 and 3p0 regulators on i.MX6 and 1p0d regulator
> on i.MX7.
> 
> Cc: yurovsky@gmail.com
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
> 
> Note: "anatop-enable-bit" has already found its way into upstream tree
> before this patch (probably not on purpose). See imx6ul.dtsi and
> imx7s.dtsi for concrete examples

But since the kernel is not using it, it doesn't really mean we have to 
keep it. Yes, other OSs could be, but that's unlikely.

>  .../devicetree/bindings/regulator/anatop-regulator.txt       |  1 +
>  drivers/regulator/anatop-regulator.c                         | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> index 37c4ea0..1d58c8c 100644
> --- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> @@ -14,6 +14,7 @@ Optional properties:
>  - anatop-delay-bit-shift: Bit shift for the step time register
>  - anatop-delay-bit-width: Number of bits used in the step time register
>  - vin-supply: The supply for this regulator
> +- anatop-enable-bit: Regulator enable bit offset

Looks like we have several properties describing the register layout. 
IMO, we should drop all of them and use the compatible strings to 
determine those instead.

Rob
