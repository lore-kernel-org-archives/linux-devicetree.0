From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clk: stm32h7: fix clock-cell size
Date: Thu, 21 Sep 2017 18:39:34 -0500
Message-ID: <20170921233934.syq5onkdwtikvyso@rob-hp-laptop>
References: <1505821446-6847-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505821446-6847-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 19, 2017 at 01:44:06PM +0200, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> The clock-cell size is 1 on stm32h7 plaform.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Fixes: 3e4d618b0722 ("clk: stm32h7: Add stm32h743 clock driver")
> ---
>  Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Rob
