From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] hwmon: (adm1031) Add device tree support
Date: Tue, 29 Mar 2016 20:04:15 +1030
Message-ID: <CACPK8XdyB2mwswJu8=EVjf9519fwBxhrrkkMSn3=JGSqiAY_Dw@mail.gmail.com>
References: <1459241443-28392-1-git-send-email-joel@jms.id.au> <56FA477C.8030607@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56FA477C.8030607-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Guenter,

On Tue, Mar 29, 2016 at 7:44 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 03/29/2016 01:50 AM, Joel Stanley wrote:
>>
>> This adds a of_device_id table so we can probe the driver using the
>> device tree.
>>
> The subject line does not match the driver being modified; it suggests
> adm1031
> while in reality the adm1275 driver is being modified.

Apologies, that's what I get for writing a patch as I'm walking out the door.

> Besides, this should already work, through trivial bindings.
> Is there a reason to believe that it does not already work ?

I wasn't aware that we had such a mechanism, thank you. I assume you
referring to bindings/i2c/trival-devices.txt?

As background for why I added the bindings; originally this code was
patch one of two. The second added a device tree property to inform
the kernel of the external sense resistor so we could perform scaling
in the kernel.

I read the hwmon documentation on why this is not currently done.
However, as the device tree is specific to a board - things like i2c
addresses and which bus they are on - I was wondering if you would
take patches to add such a feature?

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
