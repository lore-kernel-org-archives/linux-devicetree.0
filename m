From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: How-to: Uniquely identify a DT node in the driver?
Date: Wed, 29 Jul 2015 10:44:01 +0100
Message-ID: <55B8A061.6060306@arm.com>
References: <20150728193833.GC51847@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150728193833.GC51847-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 28/07/15 20:38, Lina Iyer wrote:
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
>
>
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
>
> What would be the best way to associate the power-controller devices 'big'
> and 'little' with 'a' and 'b' respectively? A string comparison would be
> ideal but possibly can work with other ways.
>

Why do you want to distinguish them within the driver ? IIUC each of
these power controller will get instantiated as separate devices with
unique properties.

Assuming the big and little above are related to CPUs, if each of the
CPUs have phandles to their respective power controller, IMO you need
not distinguish between the big and the little power controllers.

I may be missing something here, one possible reason I can think of for
distinguishing them is both power controllers have same set of
properties in DT, but they differ in the way you access them or program
them(e.g. sequence). In that case have different compatible makes sense.

> I could think of adding compatibles to achieve this, but was hoping to
> find something more elegant and appropriate. Or, is compatible the
> recommended way to uniquely identify devices by the driver?
>

If you provide the exact reason for distinguishing them within the
driver, that would help to come up with the solution.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
