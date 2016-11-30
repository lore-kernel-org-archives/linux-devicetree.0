From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/9] clk: stm32f4: Add PLL_I2S & PLL_SAI for
 STM32F429/469 boards
Date: Wed, 30 Nov 2016 14:48:59 -0600
Message-ID: <20161130204859.gfqw6wdbq4repcje@rob-hp-laptop>
References: <1479998749-20358-1-git-send-email-gabriel.fernandez@st.com>
 <1479998749-20358-3-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1479998749-20358-3-git-send-email-gabriel.fernandez@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.thompson@linaro.org, radoslaw.pietrzyk@gmail.com, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, andrea.merello@gmail.com, Michael Turquette <mturquette@baylibre.com>, olivier.bideau@st.com, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, ludovic.barre@st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, amelie.delaunay@st.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 03:45:42PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch introduces PLL_I2S and PLL_SAI.
> Vco clock of these PLLs can be modify by DT (only n multiplicator,
> m divider is still fixed by the boot-loader).
> Each PLL has 3 dividers. PLL should be off when we modify the rate.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     |   2 +
>  drivers/clk/clk-stm32f4.c                          | 342 ++++++++++++++++++++-
>  include/dt-bindings/clock/stm32f4-clock.h          |   4 +-
>  3 files changed, 332 insertions(+), 16 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
