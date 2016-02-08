From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] mwifiex: parse chip specific gpio from device tree
Date: Mon, 8 Feb 2016 15:47:07 -0600
Message-ID: <20160208214707.GA9036@rob-hp-laptop>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
 <1454926528-17480-2-git-send-email-akarwar@marvell.com>
 <4072066.xhEHjcRQWo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4072066.xhEHjcRQWo@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 08, 2016 at 01:11:03PM +0100, Arnd Bergmann wrote:
> On Monday 08 February 2016 02:15:27 Amitkumar Karwar wrote:
> >                 if (adapter->dt_node) {
> > +                       if (of_property_read_u32(adapter->dt_node,
> > +                                                "mwifiex,chip-gpio",
> > +                                                &data) == 0) {
> > +                               mwifiex_dbg(adapter, INFO,
> > +                                           "chip_gpio = 0x%x\n", data);
> > +                               adapter->hs_cfg.gpio = data;
> > +                       }
> > +
> > 
> 
> Please use the GPIO DT binding. Reading a number from DT is not a proper
> way to get a GPIO number, as you may have more than one GPIO controller
> in a system and it is not obvious to which controller this number belongs,
> or if you need to specify things like polarity.

My read of this is it is not the host SOC gpio, but the WiFi device's 
GPIO number. The host GPIO is defined in patch 3. We could still use the 
GPIO binding to describe it doing something like "marvell,<wifi gpio pin 
name>-gpios". Then the assignment is based on the property name.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
