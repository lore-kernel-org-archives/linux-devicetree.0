From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ata: ahci_st: Provide DT bindings for ST's SATA implementation
Date: Wed, 12 Mar 2014 17:06:59 +0100
Message-ID: <7613177.7hd4IoKUr4@wuerfel>
References: <1393328481-7251-1-git-send-email-lee.jones@linaro.org> <20140312114257.GA17461@e106331-lin.cambridge.arm.com> <20140312124835.GA22450@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140312124835.GA22450@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "DCG_UPD_stlinux_kernel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org" <DCG_UPD_stlinux_kernel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 March 2014 12:48:35 Lee Jones wrote:
> > > +This binding describes a SATA device.
> > > +
> > > +Required properties:
> > > + - compatible         : Must be "st,ahci"
> > 
> > Is there not a more specific name? This is awfully generic.
> 
> There isn't one. ST only have one AHCI driver. The driver is named as
> generically.

If it is this generic, can't you use the completely generic
ahci-platform driver and add a "generic-ahci" compatible string
to that?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
