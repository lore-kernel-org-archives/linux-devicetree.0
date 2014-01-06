From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for devicetree instantiation
Date: Mon, 6 Jan 2014 10:49:06 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401061043240.1282-100000@iolanthe.rowland.org>
References: <1388963080-12544-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388963080-12544-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 6 Jan 2014, Hans de Goede wrote:

> Add support for ohci-platform instantiation from devicetree, including
> optionally getting clks and a phy from devicetree, and enabling / disabling
> those on power_on / off.
> 
> This should allow using ohci-platform from devicetree in various cases.
> Specifically after this commit it can be used for the ohci controller found
> on Allwinner sunxi SoCs.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/platform-ohci.txt      |  25 ++++
>  drivers/usb/host/ohci-platform.c                   | 146 ++++++++++++++++++---
>  2 files changed, 151 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/platform-ohci.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/platform-ohci.txt b/Documentation/devicetree/bindings/usb/platform-ohci.txt
> new file mode 100644
> index 0000000..6846f1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/platform-ohci.txt
> @@ -0,0 +1,25 @@
> +Generic Platform OHCI controller
> +
> +Required properties:
> + - compatible: Should be "platform-ohci"
> + - reg: Address range of the ohci registers.
> + - interrupts: Should contain the ohci interrupt.
> +
> +Optional properties:
> + - clocks: array of clocks
> + - clock-names: clock names "ahb" and/or "ohci"

Where does "ahb" come from, what does it mean, and how is it relevant 
to generic platforms?

What about platforms that use 3 clocks?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
