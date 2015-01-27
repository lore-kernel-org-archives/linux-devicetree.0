From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] usb: phy-generic: Don't fail on missing gpio reset
Date: Tue, 27 Jan 2015 16:24:10 +0100
Message-ID: <1488241.JRB4nxvr9q@wuerfel>
References: <1422323129-20969-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1422323129-20969-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Ola Jeppson <ola@adapteva.com>, linux-usb@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 26 January 2015 17:45:29 Soren Brinkmann wrote:
> diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
> index dd05254241fb..a73d4c738f0b 100644
> --- a/drivers/usb/phy/phy-generic.c
> +++ b/drivers/usb/phy/phy-generic.c
> @@ -241,10 +241,8 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
>  
>         if (err == -EPROBE_DEFER)
>                 return -EPROBE_DEFER;
> -       if (err) {
> -               dev_err(dev, "Error requesting RESET GPIO\n");
> -               return err;
> -       }
> +       if (err)
> +               nop->gpiod_reset = NULL;

You might want to distinguish between a missing property and a
reset gpio that was specified but for some reason cannot be used.

	Arnd
