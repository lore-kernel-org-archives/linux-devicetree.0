From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] PCI: imx6: Add reset-gpio-active-high boolean
 property to DT
Date: Tue, 5 Apr 2016 12:46:53 -0300
Message-ID: <CAOMZO5AnN4_RrA4bksWNmioAP1PCBT1Ax4of_OnoCvG+VXgDUQ@mail.gmail.com>
References: <1459514508-8557-1-git-send-email-ynezz@true.cz>
	<1459514508-8557-3-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459514508-8557-3-git-send-email-ynezz-knWk7/PSn+s@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Zhu <Richard.Zhu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa-NlWvg49iv0c@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 1, 2016 at 9:41 AM, Petr =C5=A0tetiar <ynezz-knWk7/PSn+s@public.gmane.org> wrote=
:

>         /* Some boards don't have PCIe reset GPIO. */
>         if (gpio_is_valid(imx6_pcie->reset_gpio)) {
> -               gpio_set_value_cansleep(imx6_pcie->reset_gpio, 0);
> +               gpio_set_value_cansleep(imx6_pcie->reset_gpio,
> +                                       !!imx6_pcie->gpio_active_high=
);

gpio_set_value_cansleep(imx6_pcie->reset_gpio,
                                      imx6_pcie->gpio_active_high); is =
enough.

> @@ -546,9 +549,14 @@ static int __init imx6_pcie_probe(struct platfor=
m_device *pdev)
>
>         /* Fetch GPIOs */
>         imx6_pcie->reset_gpio =3D of_get_named_gpio(np, "reset-gpio",=
 0);
> +       imx6_pcie->gpio_active_high =3D of_property_read_bool(np,
> +                                               "reset-gpio-active-hi=
gh");

You need to document reset-gpio-active-high property in
Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
