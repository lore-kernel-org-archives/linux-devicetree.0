From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8 3/4] ohci-platform: Add support for controllers with
 big-endian regs / descriptors
Date: Wed, 22 Jan 2014 23:46:11 +0300
Message-ID: <52E02E13.9070206@cogentembedded.com>
References: <1390419177-6481-1-git-send-email-hdegoede@redhat.com> <1390419177-6481-4-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390419177-6481-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 01/22/2014 10:32 PM, Hans de Goede wrote:

> Note this commit uses the same devicetree booleans for this as the ones
> already existing in the usb-ehci bindings, see:
> Documentation/devicetree/bindings/usb/usb-ehci.txt

> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
[...]

> diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
> index b2d0e1e..71e9d8e 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
[...]
> @@ -164,8 +165,34 @@ static int ohci_platform_probe(struct platform_device *dev)
[...]
> +#ifndef CONFIG_USB_OHCI_BIG_ENDIAN_MMIO
> +		if (ohci->flags & OHCI_QUIRK_BE_MMIO) {
> +			dev_err(&dev->dev,
> +				"Error big-endian-regs not compiled in\n");
> +			err = -EINVAL;
> +			goto err_put_hcd;
> +		}
> +#endif
> +#ifndef CONFIG_USB_OHCI_BIG_ENDIAN_DESC
> +		if (ohci->flags & OHCI_QUIRK_BE_DESC) {
> +			dev_err(&dev->dev,
> +				"Error big-endian-desc not compiled in\n");

    Small grammar nits (sorry): some punctuation like comma or semicolon 
wouldn't hurt after "Error" word here and above. The same for ehci-platfrom.c. 
Also, "support" word wouldn't hurt after the property names in the same message.

WBR, Sergei


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
