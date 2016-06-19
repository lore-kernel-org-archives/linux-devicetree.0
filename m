From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 01/13] drivers: clk: st: Remove stih415-416
 clock support
Date: Sun, 19 Jun 2016 09:57:04 -0500
Message-ID: <20160619145704.GA25768@rob-hp-laptop>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
 <1466068833-5055-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466068833-5055-2-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 11:20:21AM +0200, Gabriel Fernandez wrote:
> STiH415 and STiH416 platforms are no longer used.
> these platforms will be deprecated for the next kernel.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  .../bindings/clock/st/st,clkgen-divmux.txt         |  49 --
>  .../devicetree/bindings/clock/st/st,clkgen-mux.txt |  18 +-
>  .../devicetree/bindings/clock/st/st,clkgen-pll.txt |  26 +-
>  .../bindings/clock/st/st,clkgen-prediv.txt         |  36 -
>  .../devicetree/bindings/clock/st/st,clkgen-vcc.txt |  61 --
>  .../devicetree/bindings/clock/st/st,clkgen.txt     |  54 +-
>  .../devicetree/bindings/clock/st/st,quadfs.txt     |  27 +-
>  drivers/clk/st/clkgen-fsyn.c                       | 260 --------
>  drivers/clk/st/clkgen-mux.c                        | 726 +--------------------
>  drivers/clk/st/clkgen-pll.c                        | 418 ------------
>  10 files changed, 37 insertions(+), 1638 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-divmux.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-prediv.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-vcc.txt

Acked-by: Rob Herring <robh@kernel.org>
