From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: at91: nattis: initialize the BLON pin as
 output-low early
Date: Wed, 21 Nov 2018 12:25:21 +0100
Message-ID: <20181121112521.GL8367@piout.net>
References: <20181120212036.22497-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120212036.22497-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20/11/2018 21:20:43+0000, Peter Rosin wrote:
> The pwm-backlight driver initializes BLON (the enable gpio) to
> output-high if the gpio is input on probe. Initializing the gpio
> to output-low before the driver probes prevents this action by
> the pwm-backlight driver and gets rid of a nasty blink of full
> backlight with an uninitialized panel.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
