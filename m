From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] power: reset: Add UART-based MCU poweroff DT bindings
Date: Mon, 12 Aug 2019 17:50:32 -0600
Message-ID: <20190812235032.GA8575@bogus>
References: <cover.1563822216.git.evgenyz@gmail.com>
 <cda16032dc5679a557230cbdb63702b105782b3b.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cda16032dc5679a557230cbdb63702b105782b3b.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evgeny Kolesnikov <evgenyz@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 09:53:01PM +0200, Evgeny Kolesnikov wrote:
> This adds device tree bindings of the poweroff driver
> for power managing micro controller units that are connected
> to a board via the UART interface.
> 
> Signed-off-by: Evgeny Kolesnikov <evgenyz@gmail.com>
> ---
>  .../bindings/power/reset/uart-poweroff.txt    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/uart-poweroff.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/uart-poweroff.txt b/Documentation/devicetree/bindings/power/reset/uart-poweroff.txt
> new file mode 100644
> index 000000000000..86d036271b51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/uart-poweroff.txt
> @@ -0,0 +1,38 @@
> +* UART-based PM MCU power off driver
> +
> +Some devices have a microcontroller controlling the main power
> +supply. This microcontroller is connected to UART of the SoC.
> +Sending a sequence of characters tells the MCU to turn
> +the power off.

IMO, you should have a node representing the specific microcontroller. 
Generic binding attempts like this generally don't work well because you 
need a never ending addition of properties to deal with h/w (and f/w in 
this case) differences. The properties you already have are evidence of 
this.

Now, if you want a common driver, then that is a separate issue. You can 
have multiple, specific bindings map to a common driver (or not, it's up 
to the OS).

Rob
