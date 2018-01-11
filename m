From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [linux, dev-4.10, 6/6] drivers/hwmon: Add a driver for a generic
 PECI hwmon
Date: Thu, 11 Jan 2018 23:18:45 +0100
Message-ID: <20180111221845.GA9278@lunn.ch>
References: <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
 <20180110214747.GA25248@roeck-us.net>
 <261ac28e-813c-a058-c81f-ad4e718d0233@linux.intel.com>
 <20180111214035.GA14748@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180111214035.GA14748-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > >>+static const struct of_device_id peci_of_table[] = {
> > >>+	{ .compatible = "peci-hwmon", },
> > >
> > >This does not look like a reference to some piece of hardware.
> > >
> > 
> > This driver provides generic PECI hwmon function to which controller has
> > PECI HW such as Aspeed or Nuvoton BMC chip so it's not dependant on a
> > specific hardware. Should I remove this or any suggestion?

PECI seems to be an Intel thing. So at least it should be

 { .compatible = "intel,peci-hwmon", }

assuming it is actually compatible with the Intel specification.

	 Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
