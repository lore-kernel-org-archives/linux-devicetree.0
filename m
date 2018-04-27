From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 24/27] dt-bindings: timer: new bindings for TI DaVinci
 timer
Date: Fri, 27 Apr 2018 09:05:22 -0500
Message-ID: <20180427140522.npmhjamhwxgp7y73@rob-hp-laptop>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-25-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180427001745.4116-25-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 07:17:42PM -0500, David Lechner wrote:
> This adds new device tree bindings for the timer IP block of TI
> DaVinci-like SoCs.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v9 changes:
> - new patch in v9
> 
> 
>  .../bindings/timer/ti,davinci-timer.txt       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt b/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> new file mode 100644
> index 000000000000..2091eca46981
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> @@ -0,0 +1,24 @@
> +* Device tree bindings for Texas Instruments DaVinci timer
> +
> +This document provides bindings for the 64-bit timer in the DaVinci
> +architecture devices. The timer can be configured as a general-purpose 64-bit
> +timer, dual general-purpose 32-bit timers. When configured as dual 32-bit
> +timers, each half can operate in conjunction (chain mode) or independently
> +(unchained mode) of each other.
> +
> +It is global timer is a free running up-counter and can generate interrupt

Doesn't make sense, too many 'is'.

There's no interrupt property listed.

> +when the counter reaches preset counter values.
> +
> +Required properties:
> +
> +- compatible : should be "ti,davinci-timer".
> +- reg : specifies base physical address and count of the registers.
> +- clocks : the clock feeding the timer clock.
> +
> +Example:
> +
> +	clocksource: timer@20000 {
> +		compatible = "ti,davinci-timer";
> +		reg = <0x20000 0x1000>;
> +		clocks = <&pll0_auxclk>;
> +	};
> -- 
> 2.17.0
> 
