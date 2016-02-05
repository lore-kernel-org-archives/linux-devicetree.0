From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v4 1/1] USB: core: let USB device know device node
Date: Fri, 5 Feb 2016 09:06:44 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1602050904300.20600-100000@netrider.rowland.org>
References: <CAL411-oOgSYJy_cLVkGWkLbzBewKtj1jgfQqxCsjE_-3NLYcTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL411-oOgSYJy_cLVkGWkLbzBewKtj1jgfQqxCsjE_-3NLYcTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 5 Feb 2016, Peter Chen wrote:

> >> > @@ -508,11 +509,20 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
> >> >     dev->connect_time = jiffies;
> >> >     dev->active_duration = -jiffies;
> >> >  #endif
> >> > -   if (root_hub)   /* Root hub always ok [and always wired] */
> >> > +   if (root_hub) { /* Root hub always ok [and always wired] */
> >> >             dev->authorized = 1;
> >> > -   else {
> >> > +           dev->dev.of_node = bus->controller->of_node;
> >> > +   } else {
> >> >             dev->authorized = !!HCD_DEV_AUTHORIZED(usb_hcd);
> >> >             dev->wusb = usb_bus_is_wusb(bus) ? 1 : 0;
> >> > +
> >> > +           if (dev->dev.parent->parent == bus->controller)
> >> > +                   /* device under root hub's port */
> >> > +                   port1 = usb_hcd_find_raw_port_number(usb_hcd,
> >> > +                           port1);
> >
> > I would change the test to "if (!parent->parent)" and add {} around the
> > body (since it's 3 lines long).  Also, although this doesn't really
> > matter, you could consider putting the new code inside the previous big
> > "if" statement instead of down here at the end of the function.
> >
> 
> Sorry, Alan, I can understand using (!parent->parent) to stands for
> the device connects to the root hub port, others I can't understand.

Change it to

+		if (!parent->parent) {
+			/* device under root hub's port */
+			port1 = usb_hcd_find_raw_port_number(usb_hcd,
+				port1);
+		}

That is, add braces { }.
          
If you look at the whole usb_alloc_dev() function, you'll see it has
one big "if" statement and then a small "if" statement near the end.  
You added your new code to the small "if" statement; I'm suggesting you
add it into the big "if" statement instead.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
