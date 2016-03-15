From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/17] dt-bindings: Add PLX Technology OXNAS pinctrl and
 gpio bindings
Date: Tue, 15 Mar 2016 15:30:06 +0100
Message-ID: <CACRpkdYZ5Lm5FkuLmL2ZWTF1jc027d_Jm9AzK3xGS89dostzqw@mail.gmail.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
	<1457005210-18485-12-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457005210-18485-12-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2016 at 12:40 PM, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:

This is a vert terse zero-line commit message. Atleast describe what you are
trying to do.

> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> +optional properties:
> +- #gpio-lines: Number of gpio if absent 32.

NACK, use ngpio from the gpio.txt document like
everyone else.

> +Required properties for iomux controller:
> +- compatible: "plxtech,nas782x-pinctrl" or "plxtech,ox810se-pinctrl"
> +- plxtech,mux-mask: array of mask (periph per bank) to describe if a pin can be
> +  configured in this periph mode. All the periph and bank need to be describe.

Why? Encode this into the driver and select muxmask from
the compatible string if it is a hardware limitation.

> +Each column will represent the possible peripheral of the pinctrl
> +Each line will represent a pio bank
> +
> +For example :
> +Peripheral: 2 ( A and B)
> +Bank: 2 (A, B and C)
> +=>
> +
> +  /*    A         B     */
> +  0xffffffff 0xffc00c3b  /* pioA */
> +  0xffffffff 0x7fff3ccf  /* pioB */
> +
> +For each peripheral/bank we will descibe in a u32 if a pin can be
> +configured in it by putting 1 to the pin bit (1 << pin)

That's just completely hopeless to understand for a DT author.
Put it into the driver.

> +Required properties for pin configuration node:
> +- plxtech,pins: 4 integers array, represents a group of pins mux and config
> +  setting. The format is plxtech,pins = <PIN_BANK PIN_BANK_NUM PERIPH CONFIG>.
> +  The PERIPH 0 means gpio, PERIPH 1 is periph A, PERIPH 2 is periph B...
> +  PIN_BANK 0 is pioA, PIN_BANK 1 is pioB...

NACK, use the standard binding for "pins" from pinctrl-bindings.txt

Also make the driver use the existing helpers for this property.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
