From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: How-to: Uniquely identify a DT node in the driver?
Date: Wed, 29 Jul 2015 17:39:58 +0100
Message-ID: <20150729163958.GC5093@leverpostej>
References: <20150728193833.GC51847@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150728193833.GC51847-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 28, 2015 at 08:38:33PM +0100, Lina Iyer wrote:
> Hello,
> 
> I am looking to find a way to uniquely identify a device in the driver.
> Here is an example -
> 
> 	big: power-controller@1 {
> 		compatible = "soc,foo";
> 		...
> 	};
> 
> 	little: power-controller@2 {
> 		compatible = "soc,foo";
> 		...
> 	};

Ok, so these are two instances of the same block...

> In the driver for the power-controller foo.c, would like to do -
> 
> 	struct xyz {
> 		const char *name;
> 		...
> 	};
> 
> 	static struct xyz a = {
> 		.name = "big"; // To be associated with big device
> 		...
> 	};
> 
> 	static struct xyz b = {
> 		.name = "little"; // To be associated with little device
> 		...
> 	};

... which we're magically assuming things about.

> What would be the best way to associate the power-controller devices 'big'
> and 'little' with 'a' and 'b' respectively? A string comparison would be
> ideal but possibly can work with other ways.
> 
> I could think of adding compatibles to achieve this, but was hoping to
> find something more elegant and appropriate. Or, is compatible the
> recommended way to uniquely identify devices by the driver?

There's no recommended way to uniquely idetnify a device, because in
general it doesn't make sense to do so. Doing so implies intimate
knowledge of a particular board and a lack of hardware description in
the DT (otherwise you wouldn't need to associate additional information
with the instance).

Either you need to describe some characteristic of the device with some
properties on each instance, or you need to derive that form the linkage
to other devices.

It looks like you're trying to give different behviours to "big" and
"little" clusters, which doesn't really fit either case. What do you
want to differ? e.g. is it just the set of OPPs?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
