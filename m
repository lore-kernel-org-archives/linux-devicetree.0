From: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] dtc: Sort unit addresses by number
Date: Fri, 24 Jan 2014 23:21:10 +1100
Message-ID: <20140124232110.51de5adc@kryten>
References: <20140121134935.1f9cebcc@kryten>
	<20140121100221.GJ28747@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140121100221.GJ28747-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Mark,

> Minor issue, but when #address-cells == 2, some unit addresses are
> split in the middle by a ',' to separate the value of each cell, e.g.
> "flash@2,0". For those, is_hex will return false and we'll compare
> unit-addresses as strings.
> 
> I took a quick look over the dts in the Linux kernel tree (with `git
> grep "@.\+," -- arch/*/boot/dts` and I think every instance there
> would sort correctly as a string, but it would be nice to fix the
> issue regardless of how large the unit-address is.
> 
> Perhaps we could have a helper function for reading the unit-address
> that would take this into account?

I was already getting nervous at the complexity of the sort function,
so I added the is_hex() check to ignore any complex unit addresses. 

A helper function to read a unit address sounds like a simple enough
solution though.

Anton
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
