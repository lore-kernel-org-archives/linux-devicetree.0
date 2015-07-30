From: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: How-to: Uniquely identify a DT node in the driver?
Date: Thu, 30 Jul 2015 09:33:25 -0600
Message-ID: <20150730153325.GI51847@linaro.org>
References: <20150728193833.GC51847@linaro.org>
 <20150729163958.GC5093@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150729163958.GC5093@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey Mark,

On Wed, Jul 29 2015 at 10:40 -0600, Mark Rutland wrote:
>On Tue, Jul 28, 2015 at 08:38:33PM +0100, Lina Iyer wrote:
>> Hello,
>>
>> I am looking to find a way to uniquely identify a device in the driver.
>> Here is an example -
>>
>> 	big: power-controller@1 {
>> 		compatible = "soc,foo";
>> 		...
>> 	};
>>
>> 	little: power-controller@2 {
>> 		compatible = "soc,foo";
>> 		...
>> 	};
>
>Ok, so these are two instances of the same block...
>
>> In the driver for the power-controller foo.c, would like to do -
>>
>> 	struct xyz {
>> 		const char *name;
>> 		...
>> 	};
>>
>> 	static struct xyz a = {
>> 		.name = "big"; // To be associated with big device
>> 		...
>> 	};
>>
>> 	static struct xyz b = {
>> 		.name = "little"; // To be associated with little device
>> 		...
>> 	};
>
>... which we're magically assuming things about.
>
>> What would be the best way to associate the power-controller devices 'big'
>> and 'little' with 'a' and 'b' respectively? A string comparison would be
>> ideal but possibly can work with other ways.
>>
>> I could think of adding compatibles to achieve this, but was hoping to
>> find something more elegant and appropriate. Or, is compatible the
>> recommended way to uniquely identify devices by the driver?
>
>There's no recommended way to uniquely idetnify a device, because in
>general it doesn't make sense to do so. Doing so implies intimate
>knowledge of a particular board and a lack of hardware description in
>the DT (otherwise you wouldn't need to associate additional information
>with the instance).
>
Fair enough.

>Either you need to describe some characteristic of the device with some
>properties on each instance, or you need to derive that form the linkage
>to other devices.
>
>It looks like you're trying to give different behviours to "big" and
>"little" clusters, which doesn't really fit either case. What do you
>want to differ? e.g. is it just the set of OPPs?
>
I explained the context in my response to Sudeep. Guess our mails
crossed at the same time.

You are right. The differenciation is based on the intimate knowledge of
the hardware characteristics of these individual power-controllers. So,
in a way, compatibles are a better way to describe these devices
uniquely instead of a property.

Thank you for your time.

-- Lina


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
