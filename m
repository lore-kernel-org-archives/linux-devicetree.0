From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [3/3] MIPS: jz4780: DTS: Probe the jz4740-watchdog driver from
 devicetree
Date: Sun, 22 Oct 2017 08:26:53 -0700
Message-ID: <20171022152653.GA11714@roeck-us.net>
References: <20170908183558.1537-3-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <20170908183558.1537-3-malat@debian.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mathieu Malaterre <malat@debian.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Wim Van Sebroeck <wim@iguana.be>, Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 08, 2017 at 08:35:55PM +0200, Mathieu Malaterre wrote:
> The jz4740-watchdog driver supports both jz4740 & jz4780.
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 4853ef67b3ab..33d7f49186d6 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -207,6 +207,11 @@
>  		status = "disabled";
>  	};
>  
> +	watchdog: jz4780-watchdog@10002000 {
> +		compatible = "ingenic,jz4740-watchdog";
> +		reg = <0x10002000 0x100>;
> +	};
> +
>  	nemc: nemc@13410000 {
>  		compatible = "ingenic,jz4780-nemc";
>  		reg = <0x13410000 0x10000>;
