From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/11] dt-bindings: clock: add NXP LPC32xx clock list for
 consumers
Date: Fri, 20 Nov 2015 14:56:26 +0100
Message-ID: <4268221.QhjAE5RLYk@wuerfel>
References: <1447981511-29653-1-git-send-email-vz@mleia.com>
 <1447981511-29653-4-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1447981511-29653-4-git-send-email-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 20 November 2015 03:05:03 Vladimir Zapolskiy wrote:
> +
> +/* LPC32XX System Control Block clocks */
> +#define LPC32XX_CLK_RTC                0
> +#define LPC32XX_CLK_DMA                1
> +#define LPC32XX_CLK_MLC                2
> +#define LPC32XX_CLK_SLC                3
> +#define LPC32XX_CLK_LCD                4
> +#define LPC32XX_CLK_MAC                5
> +#define LPC32XX_CLK_SD         6
> +#define LPC32XX_CLK_DDRAM      7
> +#define LPC32XX_CLK_SSP0       8
> +#define LPC32XX_CLK_SSP1       9
> +#define LPC32XX_CLK_UART3      10
> +#define LPC32XX_CLK_UART4      11
> +#define LPC32XX_CLK_UART5      12
> +#define LPC32XX_CLK_UART6      13
> +#define LPC32XX_CLK_IRDA       14
> +#define LPC32XX_CLK_I2C1       15
> 

Any chance we can avoid the include file? This is going to make it really
hard to merge everything in one merge window with the dependencies between
the driver, the bindings and the platform code.

If there is a way to describe the clocks based on numbers from the
data sheet instead of making up your own, that makes life much
easier for us.

	Arnd
