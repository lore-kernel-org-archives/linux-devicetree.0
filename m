From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ehci-platform: Add support for controllers with
 multiple reset lines
Date: Wed, 24 Feb 2016 13:47:44 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1602241345350.3812-100000@iolanthe.rowland.org>
References: <56CD960D.3000900@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CD960D.3000900-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 24 Feb 2016, Roger Quadros wrote:

> Hi,
> 
> On 24/02/16 13:15, Hans de Goede wrote:
> > From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> > 
> > At least the EHCI/OHCI found on the Allwinnner H3 SoC needs multiple
> > reset lines, the controller will not initialize while the reset for
> > its companion is still asserted, which means we need to de-assert
> > 2 resets for the controller to work.
> > 
> > Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> > -	} else {
> > -		err = reset_control_deassert(priv->rst);
> > -		if (err)
> > -			goto err_put_clks;
> > +		for (rst = 0; rst < EHCI_MAX_RESETS; rst++) {
> > +			priv->resets[rst] =
> > +				devm_reset_control_get_shared_by_index(
> > +								&dev->dev, rst);

Ugly continuation line.  The convention in these files is to indent 
continuation lines by two tab stops beyond the original source line.
Same comment applies to the 2/2 patch.

Once that is changed, you can add:

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

to both.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
