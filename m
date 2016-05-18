From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/3] auxdisplay: ht16k33: Driver for LED controller
Date: Wed, 18 May 2016 18:23:00 -0500
Message-ID: <20160518232300.GA4243@rob-hp-laptop>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
 <1463574199-21077-3-git-send-email-robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463574199-21077-3-git-send-email-robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin van der Gracht <robin@protonic.nl>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Matt Ranostay <mranostay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 02:23:18PM +0200, Robin van der Gracht wrote:
> Added a driver for the Holtek HT16K33 LED controller with keyscan.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
> Changes in v6:
>     - Fixed minor typo in documentation 'KEY_F0' -> 'KEY_F10'
> 
>  .../devicetree/bindings/display/ht16k33.txt        |  42 ++
>  drivers/auxdisplay/Kconfig                         |   9 +
>  drivers/auxdisplay/Makefile                        |   1 +
>  drivers/auxdisplay/ht16k33.c                       | 563 +++++++++++++++++++++
>  4 files changed, 615 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
>  create mode 100644 drivers/auxdisplay/ht16k33.c
> 
> diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt b/Documentation/devicetree/bindings/display/ht16k33.txt
> new file mode 100644
> index 0000000..5c11320
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ht16k33.txt
> @@ -0,0 +1,42 @@
> +Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
> +-------------------------------------------------------------------------------
> +
> +Required properties:
> +- compatible:		"holtek,ht16k33"
> +- reg:			I2C slave address of the chip.
> +- interrupt-parent:	A phandle pointing to the interrupt controller
> +			serving the interrupt for this chip.
> +- interrupts:		Interrupt specification for the key pressed interrupt.
> +- refresh-rate-hz:	Display update interval in HZ.
> +- debounce-delay-ms:	Debouncing interval time in microseconds.

The units and description still don't match.

I acked the last one. Please add acks when sending new versions (unless 
of course you don't fix any trivial things noted).

Rob
