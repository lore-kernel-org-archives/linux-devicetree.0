From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 6/7] net: phy: icplus: implement .did_interrupt for
 IP101A/G
Date: Sun, 18 Nov 2018 18:09:24 +0100
Message-ID: <20181118170924.GF5591@lunn.ch>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
 <20181117182007.14791-7-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181117182007.14791-7-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 17, 2018 at 07:20:06PM +0100, Martin Blumenstingl wrote:
> The IP101A_G_IRQ_CONF_STATUS register has bits to detect which
> interrupts have fired. Implement the .did_interrupt callback to let the
> PHY core know whether the interrupt was for this specific PHY.
> 
> This is useful for debugging interrupt problems with 32-pin IP101GR PHYs
> where the interrupt line is shared with the RX_ERR (receive error
> status) signal. The default values are:
> - RX_ERR is enabled by default (LOW means that there is no receive
>   error)
> - the PHY's interrupt line is configured "active low" by default
> 
> Without any additional changes there is a flood of interrupts if the
> RX_ERR/INTR32 signal is configured in RX_ERR mode (which is the
> default). Having a did_interrupt ensures that the PHY core returns
> IRQ_NONE instead of endlessly triggering the PHY state machine.
> Additionally the kernel will report this after a while:
>   irq 28: nobody cared (try booting with the "irqpoll" option)

That is a useful hint.

> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
