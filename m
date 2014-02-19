From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 13:37:13 -0800
Message-ID: <53052409.5060402@gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com> <CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com> <CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com> <20140219090854.GW17250@pengutronix.de> <53051102.8060801@gmail.com> <CACxGe6uhA6FMR76WJGVEt44x6bQOC=woCkDr6ZUH30hTd8f2wA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6uhA6FMR76WJGVEt44x6bQOC=woCkDr6ZUH30hTd8f2wA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/19/2014 1:15 PM, Grant Likely wrote:
> On Wed, Feb 19, 2014 at 8:16 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 2/19/2014 1:08 AM, Sascha Hauer wrote:
>>> On Tue, Feb 18, 2014 at 02:44:15PM -0800, Tim Bird wrote:
>>>> I'm not in favor of separating the device tree information from the kernel.
>>>>
>>>> If we switch, then whatever synchronization issues other projects
>>>> are having now with synching with the device tree info from the kernel will
>>>> just then become the problem of the kernel developers, who will then
>>>> have to sync with the device tree info from another repository.  If the
>>>> sync issues can't be solved now for them, why or how would it be solved
>>>> post-separation for us?  (It sounds like a zero-sum game of pain transfer
>>>> to me.)
>>>>
>>>> I'm relatively unfamiliar with the arguments.  Can someone provide
>>>> a brief list of reasons this is needed, and how the inconvenience to Linux
>>>> kernel developers will be minimized, should it proceed?
>>>
>>
>>
>>> One of the reasons for doing devicetrees is to separate the hardware
>>> description from the code so that:
>>> - Other OSes (and bootloaders) can use the same description to start on
>>>   a given hardware
>>> - A generic Kernel can be started on any hardware
>>> - A hardware describes itself, makes itself more introspecitve so we can
>>>   go away from very specialized kernels
>>
>> Tim knows this ^^^^.  He was asking for the arguments for moving dts files
>> out of the linux kernel source tree.
> 
> We've made the decision that devicetree bindings need to be treated as
> ABI, but as long as the .dts files live in the kernel there will
> always be the temptation to just tweak things in lock-step and nobody
> will notice. Splitting the files out gives that extra push to think
> about whether changes to a binding will backwards compatible with a
> tree that doesn't have those changes because the chances are a lot
> higher that someone will hit that combination.

We have other ABI in the kernel.  The maintainers have to develop a
spine if they are letting the supposed ABI changes occur they way
you suggest.

I thought that the actions flowing out of Edinburgh were supposed to
move us in the direction of developing the ABI mentality, and the
process to allow development and experimentation to occur (with a
clear label that they were not yet ABI) then a way to decide that
the development of a devicetree binding was complete enough to be
ABI.

> 
> The other argument is shared source between
> BSD/U-Boot/Barebox/Linux/etc. Until we have a separate .dts repo there
> is no good way to share the database of hardware descriptions.
> 
> g.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
