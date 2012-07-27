From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] mfd: twl6040: Add twl6040-gpio child
Date: Sat, 28 Jul 2012 00:50:43 +0200
Message-ID: <CACRpkdZJcy5HOZkjMCVJW5beExoCHOBb=BiB4GOGR7sM+5Xsww@mail.gmail.com>
References: <1342603220-13287-1-git-send-email-peter.ujfalusi@ti.com>
	<1342603220-13287-3-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1342603220-13287-3-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree-discuss@lists.ozlabs.org
Cc: Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, Sergio Aguirre <saaguirre@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2012 at 11:20 AM, Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:

I think you need to CC DT bindings to devicetree-discuss.

> diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Documentation/devicetree/bindings/mfd/twl6040.txt
> index c855240..2a3d55c 100644
> --- a/Documentation/devicetree/bindings/mfd/twl6040.txt
> +++ b/Documentation/devicetree/bindings/mfd/twl6040.txt
> @@ -10,6 +10,8 @@ Required properties:
>  - reg: must be 0x4b for i2c address
>  - interrupts: twl6040 has one interrupt line connecteded to the main SoC
>  - interrupt-parent: The parent interrupt controller
> +- gpio-controller:
> +- #gpio-cells = <1>: twl6040 provides GPO lines.
>  - twl6040,audpwron-gpio: Power on GPIO line for the twl6040
>
>  - vio-supply: Regulator for the twl6040 VIO supply
> @@ -29,6 +31,8 @@ Required properties:
>  - ti,viblmotor-res: Resistance parameter for left motor
>  - ti,viblmotor-res: Resistance parameter for right motor
>
> +- ti,use-gpo: Set it to <1> if the GPO functionality is in use
> +

It's not like I'm sort of expert on bindings, but I've seen the
pattern status = "okay" used for this kind of boolean stuff,
and if that node is not there it's implicitly not OK.

Can someone shed some light on this convention?

Yours,
Linus Walleij
