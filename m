From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/11] drivers: clk: st: Add clock propagation for audio
 clocks
Date: Wed, 25 May 2016 12:24:09 -0500
Message-ID: <20160525172409.GA27913@rob-hp-laptop>
References: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
 <1463560892-7209-3-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463560892-7209-3-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 10:41:23AM +0200, Gabriel Fernandez wrote:
> This patch allows fine tuning of the quads FS for audio clocks
> accuracy.
> 
> Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  .../devicetree/bindings/clock/st/st,flexgen.txt    |  1 +
>  drivers/clk/st/clk-flexgen.c                       | 24 ++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> index b7ee5c7..15b33c7 100644
> --- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> +++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> @@ -60,6 +60,7 @@ This binding uses the common clock binding[2].
>  Required properties:
>  - compatible : shall be:
>    "st,flexgen"
> +  "st,stih407-clkgend0", "st,flexgen" (enable clock propagation on parent)

What do "d0" and "d2" refer to?

This seems to indicate you have too much clock detail in the DT (with 
individual clocks described) or not enough with genericish compatible 
strings. What happens for the mext clock you need to adjust the flags 
on? You should be able to make these adjustments without DT updates. 
Perhaps you need a wider fixing of clock compatible strings.

Rob
