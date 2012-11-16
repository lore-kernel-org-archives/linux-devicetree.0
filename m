From: Simon Baatz <gmbnomis@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: Kirkwood: Convert IB62x0 to use gpio-poweroff.
Date: Fri, 16 Nov 2012 20:32:50 +0100
Message-ID: <20121116193250.GB25838@schnuecks.de>
References: <1352821485-10032-1-git-send-email-andrew@lunn.ch>
 <1352821485-10032-4-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1352821485-10032-4-git-send-email-andrew@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, anton.vorontsov@linaro.org, jm@lentin.co.uk, Linus Walleij <linus.walleij@linaro.org>, linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Tue, Nov 13, 2012 at 04:44:45PM +0100, Andrew Lunn wrote:
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  arch/arm/boot/dts/kirkwood-ib62x0.dts |    6 ++++++
>  arch/arm/mach-kirkwood/board-ib62x0.c |   13 -------------
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-ib62x0.dts b/arch/arm/boot/dts/kirkwood-ib62x0.dts
> index 66794ed..9b0e2e3 100644
> --- a/arch/arm/boot/dts/kirkwood-ib62x0.dts
> +++ b/arch/arm/boot/dts/kirkwood-ib62x0.dts
> @@ -79,4 +79,10 @@
>  			gpios = <&gpio0 27 0>;
>  		};
>  	};
> +	gpio_poweroff {
> +		compatible = "gpio-poweroff";
> +		gpios = <&gpio0 24 1>;

This needs to be:
		gpios = <&gpio0 24 0>;

If the GPIO is configured as an input, the box shuts down when
initializing the driver.

With this change:

Tested-by: Simon Baatz <gmbnomis@gmail.com>

Btw., I also tested it on top of your pinctrl changes, which works
like a charm as well.

- Simon
