From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/5] of: Automatic console registration cleanups
Date: Fri, 28 Mar 2014 14:19:23 -0500
Message-ID: <CAL_JsqKFO+OSz83f=XdyKgCqByUvHe7qLzgn5QLU1x1V1A5Fng@mail.gmail.com>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
	<20140328185653.GB26433@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140328185653.GB26433-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 1:56 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Fri, Mar 28, 2014 at 09:08:00AM -0700, Grant Likely wrote:
>> Hi all,
>>
>> This is a series that I've been playing with over the last few days to
>> clean up the selection of default console devices when using the device
>> tree. The device tree defines a way of specifying the console by using a
>> "stdout-path" property in the /chosen node, but very few drivers
>> actually attempt to use that data, and so for most platforms there needs
>> to be a "console=" line in the command line if a serial port is intended
>> to be used as the console.
>>
>> With this series, if there is a /chosen/stdout-path property, and if
>> that property points to a serial port node, then when the serial driver
>> registers the port, the core uart_add_one_port() function will notice
>> and if no console= argument was provided then add it as a preferred
>> console.
>>
>> I've not tested this very extensively yet, but I want to get some
>> feedback before I go further.
>>
>> The one downside with this approach is that it doesn't do anything for
>> early console setup. That still needs to be added on a per-driver basis,
>> but at least it shouldn't conflict with this approach.

I'm working on the early aspect. I've got things working with either
command line (which I sent out recently) and with parsing the FDT
(which I haven't sent out yet).

> Looks sane to me (as discussed in person). I gave it a run on PWRficient with
> and without console= line (8250-based uart), and it behaved as expected.
>
> A couple of nits on the series, replied to two of the patches.
>
> I'll give it a run through the board farm here too, but I'll keep console=
> bootargs there for those boots at this time, too much to change to take it out
> everywhere. :-)

It would be good to know if removing console= causes userspace any
issues. For example, if getty's were setup based on console params. I
know ubuntu does some detection of serial ports, but I don't recall
what it looks at. Hopefully it's just checking /dev nodes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
