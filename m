From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] New of_io_release_and_unmap()
Date: Wed, 25 Feb 2015 12:00:45 -0800
Message-ID: <CAMB+bfKOX5y5hgGwDzg+=SfYO+MRgr815J-teV=xxAR8uS4TFQ@mail.gmail.com>
References: <cover.1424889345.git.stillcompiling@gmail.com>
	<7444779.882rMgOx5D@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7444779.882rMgOx5D@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 25, 2015 at 11:23 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 25 February 2015 11:20:41 Joshua Clayton wrote:
>> Hello folks,
>> I notice that io_request_and_map has no inverse.
>> I would like to add a new function to undo what it does.
>>
>
> What do you want to use this for? So far all users are in essential drivers
> (clk and clocksource) that result in a boot failure if this goes wrong.
>
That explains a lot. It looks (to my n00b eye) like this function leaks some
references, which is more ok if  the ref counters should never be
decremented to 0.

> Normal drivers can probably always use devm_ioremap_resource(), which
> has an automatic cleanup.
>
Hmmm.
My use case is indeed a normal driver, which could definitely
use devm_ioremap_resource()

>         Arnd

That would leave only "completeness" as a reason. Probably not needed.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
