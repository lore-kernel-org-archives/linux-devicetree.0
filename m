From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 02/13] drivers: clk: st: Simplify clock binding
 of STiH4xx platforms
Date: Sun, 19 Jun 2016 10:04:58 -0500
Message-ID: <20160619150458.GA26824@rob-hp-laptop>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
 <1466068833-5055-3-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1466068833-5055-3-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, kernel@stlinux.com, Geert Uytterhoeven <geert+renesas@glider.be>, arnaud.pouliquen@st.com, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, benjamin.gaignard@st.com, Olivier Bideau <olivier.bideau@st.com>, Russell King <linux@armlinux.org.uk>, Peter Griffin <peter.griffin@linaro.org>, Thierry Reding <treding@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, vincent.abriou@st.com, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <maxime.coquelin@st.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Patrice Chotard <patrice.chotard@st.com>Pa
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 11:20:22AM +0200, Gabriel Fernandez wrote:
> This patch reworks the clock binding to avoid too much detail in DT.
> Now we have only compatible string per type of clock
> (remark from Rob https://lkml.org/lkml/2016/5/25/492)
>

I have no idea what the clock trees and clock controller in these chips 
look like, so it's hard to say if the changes here are good. It still 
looks like things are somewhat fine grained clocks in DT. I'll leave 
it up to the platform maintainers to decide...
 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  .../devicetree/bindings/clock/st/st,clkgen-mux.txt |  2 +-
>  .../devicetree/bindings/clock/st/st,clkgen-pll.txt | 11 ++--
>  .../devicetree/bindings/clock/st/st,clkgen.txt     |  2 +-
>  .../devicetree/bindings/clock/st/st,quadfs.txt     |  6 +--
>  drivers/clk/st/clkgen-fsyn.c                       | 41 ++++++--------
>  drivers/clk/st/clkgen-mux.c                        | 28 ++++------
>  drivers/clk/st/clkgen-pll.c                        | 62 ++++++++++------------
>  7 files changed, 65 insertions(+), 87 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
> index 4d277d6..9a46cb1d7 100644
> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
> @@ -10,7 +10,7 @@ This binding uses the common clock binding[1].
>  Required properties:
>  
>  - compatible : shall be:
> -	"st,stih407-clkgen-a9-mux",	"st,clkgen-mux"
> +	"st,stih407-clkgen-a9-mux"
>  
>  - #clock-cells : from common clock binding; shall be set to 0.
>  
> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
> index c9fd674..be0b043 100644
> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
> @@ -9,11 +9,10 @@ Base address is located to the parent node. See clock binding[2]
>  Required properties:
>  
>  - compatible : shall be:
> -	"st,stih407-plls-c32-a0",	"st,clkgen-plls-c32"
> -	"st,stih407-plls-c32-a9",	"st,clkgen-plls-c32"
> -	"sst,plls-c32-cx_0",		"st,clkgen-plls-c32"
> -	"sst,plls-c32-cx_1",		"st,clkgen-plls-c32"
> -	"st,stih418-plls-c28-a9",	"st,clkgen-plls-c32"

> +	"st,clkgen-pll0"
> +	"st,clkgen-pll0"

Repeated. Supposed to be 0 and 1? This seems a bit generic, too.

> +	"st,stih407-clkgen-plla9"
> +	"st,stih418-clkgen-plla9"
