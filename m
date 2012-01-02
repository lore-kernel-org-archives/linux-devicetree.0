From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCHv3 1/3] gpio: add a driver for the Synopsys DesignWare
 APB GPIO block
Date: Mon, 2 Jan 2012 13:25:00 +0000
Message-ID: <20120102132500.GB18443@sirena.org.uk>
References: <1325508798-25439-1-git-send-email-jamie@jamieiles.com>
 <1325508798-25439-2-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1325508798-25439-2-git-send-email-jamie@jamieiles.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2012 at 12:53:16PM +0000, Jamie Iles wrote:
> The Synopsys DesignWare block is used in some ARM devices (picoxcell)
> and can be configured to provide multiple banks of GPIO pins.
> 
> v3:	- depend on rather than select IRQ_DOMAIN
> 	- split IRQ support into a separate patch
> v2:	- use Rob Herring's irqdomain in generic irq chip patches
> 	- use reg property to indicate bank index
> 	- support irqs on both edges based on LinusW's u300 driver

Put stuff like this after the ---, it shouldn't end up in git history.

> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +interrupt.  Shall be set to 2.  The first cell defines the interrupt number,
> +the second encodes the triger flags encoded as:

> +	bits[3:0] trigger type and level flags.
> +		1 = low-to-high edge triggered
> +		2 = high-to-low edge triggered
> +		4 = active high level-sensitive
> +		8 = active low level-sensitive

This looks like a straight mapping of the Linux constants to device
tree.  This seems sensible and reasonable and since we're forced to use
magic numbers by the binding it'd be really good if we could standardise
on using this for new drivers to reduce the pain for people writing and
reading device tree bindings.  To help with that could you factor this
out into a separate document that other drivers can reference?
