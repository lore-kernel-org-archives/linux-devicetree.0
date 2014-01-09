From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Thu, 09 Jan 2014 19:07:16 +0100
Message-ID: <4432391.5QkdBVBQQi@wuerfel>
References: <1389290226-6971-1-git-send-email-hdegoede@redhat.com> <1389290226-6971-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBXGKXOLAKGQEW3QF7RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1389290226-6971-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 09 January 2014 18:57:05 Hans de Goede wrote:
> +       if (pdata == &ohci_platform_defaults && dev->dev.of_node) {
> +               priv->phy = devm_phy_get(&dev->dev, "usb");
> +               if (IS_ERR(priv->phy)) {
> +                       err = PTR_ERR(priv->phy);
> +                       if (err == -EPROBE_DEFER)
> +                               goto err_put_hcd;
> +                       priv->phy = NULL;
> +               }
> +
> +               for (clk = 0; clk < OHCI_MAX_CLKS; clk++) {
> +                       priv->clks[clk] = of_clk_get(dev->dev.of_node, clk);
> +                       if (IS_ERR(priv->clks[clk])) {
> +                               err = PTR_ERR(priv->clks[clk]);
> +                               if (err == -EPROBE_DEFER)
> +                                       goto err_put_clks;
> +                               priv->clks[clk] = NULL;
> +                               break;
> +                       }
> +               }
> +       }

Ah, very nice! This way it will actually work to replace a number
of older drivers that require a specific clock name.

I still think we should change the phy subsystem to allow the
same, that would make it more consistent here, and avoid the
need for coming up with a number of bogus phy names for random
drivers that can only ever have one phy.

	Arnd
