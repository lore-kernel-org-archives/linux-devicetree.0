From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/2] usb: gadget: pxa27x_udc: add devicetree support
Date: Thu, 25 Sep 2014 10:45:35 +0200
Message-ID: <CACRpkdaEQpMvtFhoazwKWt_yJoddW0OKm+2VvtwZ0Zwv6LgBGw@mail.gmail.com>
References: <1411587673-31156-1-git-send-email-robert.jarzmik@free.fr>
	<1411587673-31156-3-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411587673-31156-3-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 9:41 PM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:

> Add support for device-tree device discovery. If devicetree is not
> provided, fallback to legacy platform data "discovery".
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
(...)
> @@ -2417,6 +2425,8 @@ static int pxa_udc_probe(struct platform_device *pdev)
>         if (mach) {
>                 udc->gpiod = gpio_to_desc(mach->gpio_pullup);
>                 udc->udc_command = mach->udc_command;
> +       } else {
> +               udc->gpiod = devm_gpiod_get(&pdev->dev, NULL);
>         }

Aha OK there it is.

devm_gpiod_get() actually uses three arguments now, you're using
a deprecated version of the interface:

struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
                                              const char *con_id,
                                              enum gpiod_flags flags);

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
