From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/5] clk: berlin: add berlin clocks DT bindings documentation
Date: Fri, 21 Mar 2014 13:16:29 +0100
Message-ID: <532C2D9D.4050901@gmail.com>
References: <1395402220-23503-1-git-send-email-alexandre.belloni@free-electrons.com> <1395402220-23503-3-git-send-email-alexandre.belloni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395402220-23503-3-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?ISO-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/21/2014 12:43 PM, Alexandre Belloni wrote:
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>   .../devicetree/bindings/clock/berlin-clock.txt     | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/berlin-clock.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/berlin-clock.txt b/Documentation/devicetree/bindings/clock/berlin-clock.txt
> new file mode 100644
> index 000000000000..ebc78f9b93a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/berlin-clock.txt
> @@ -0,0 +1,29 @@
> +Device Tree Clock bindings for Marvell Berlin clocks
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : shall be one of the following:
> +	"marvell,berlin2-pll" or

nit: just use a comma instead of "or" otherwise that "or" will
be pushed to the new last compatible every time we add a compatible.

> +	"marvell,berlin2q-pll":
> +		CPU PLL and System PLL
> +- reg : Address and length of the clock register set.
> +- #clock-cells : from common clock binding; shall be set to 0.
> +- clocks : shall be the input parent clock phandle for the clock.
> +
> +smclk: sysmgr-clock {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <25000000>;
> +};
> +
> +cpupll: cpupll {

Reminder: Should receive an update when you change the corresponding
nodes to cpupll: pll@foo

> +	compatible = "marvell,berlin2-pll";
> +	clocks = <&smclk>;
> +	#clock-cells = <0>;
> +	reg = <0xf7ea003c 8>;
> +};
> +
> +
>
