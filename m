From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 12:16:02 -0800
Message-ID: <53051102.8060801@gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com> <CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com> <CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com> <20140219090854.GW17250@pengutronix.de>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140219090854.GW17250-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/19/2014 1:08 AM, Sascha Hauer wrote:
> On Tue, Feb 18, 2014 at 02:44:15PM -0800, Tim Bird wrote:
>> I'm not in favor of separating the device tree information from the kernel.
>>
>> If we switch, then whatever synchronization issues other projects
>> are having now with synching with the device tree info from the kernel will
>> just then become the problem of the kernel developers, who will then
>> have to sync with the device tree info from another repository.  If the
>> sync issues can't be solved now for them, why or how would it be solved
>> post-separation for us?  (It sounds like a zero-sum game of pain transfer
>> to me.)
>>
>> I'm relatively unfamiliar with the arguments.  Can someone provide
>> a brief list of reasons this is needed, and how the inconvenience to Linux
>> kernel developers will be minimized, should it proceed?
> 


> One of the reasons for doing devicetrees is to separate the hardware
> description from the code so that:
> - Other OSes (and bootloaders) can use the same description to start on
>   a given hardware
> - A generic Kernel can be started on any hardware
> - A hardware describes itself, makes itself more introspecitve so we can
>   go away from very specialized kernels

Tim knows this ^^^^.  He was asking for the arguments for moving dts files
out of the linux kernel source tree.

Can you answer his question?

> 
> This can't be archieved when the devicetrees are constantly changing. So
> we should separate the devicetrees from the kernel to make them usable
> for other projects, but also to make the kernel more universally usable.
> Compatibility issues will be far more obvious when kernel and
> devicetrees are separated, but this will make people behave more
> carefully and helps making the devicetree interface more stable and
> usable.

So come up with a way of making dts files more stable while still in
the linux kernel source tree.  Moving the files to another repository
is not going to magically make them more stable.

> 
> Just to make that sure: It's an illusion that future kernels will be
> 100% compatible with old devicetrees, but we should at least follow a
> best effort approach. If they are compatible enough to at least bring up
> the hardware then this is at least enough to install a better
> devicetree.
> 
> Sascha
> 

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
