From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 7 May 2014 10:24:46 -0700
Message-ID: <CAOesGMiHRQV+XngH4ABSeT8KDeP=iKn1ogvTA0j1BdyBwAaWSA@mail.gmail.com>
References: <536A697D.3020002@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536A697D.3020002-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 7, 2014 at 10:12 AM, Eric Nelson
<eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> Hi all,
>
> I suspect that this has been discussed previously, but I'm a
> N00b to DT and Google hasn't helped identify a discussion
> on the list.
>
> While getting my feet wet with DTS, I was quite surprised to
> see that there's no support for making parts of DTS files
> conditional on the kernel configuration.
>
> We often cost-optimize BOMs for our standard boards and omit
> bits and pieces not needed for a particular build, and
> it would be nice to surround optional components with
> conditionals:
>
>     #ifdef CONFIG_BLAH
>     #endif
>
> Please advise,

The DTS is independent on what drivers the kernel is actually
enabling. It should focus on what is actually there on hardware, and
not what is enabled in software.

I think I know where you're coming from on this -- on some board-file
setups people used to not register the platform_device if the driver
wasn't configured. That was also not really a good way to do it, but
it made a bit more sense there, since you'd save the few bytes used by
the platform_device/platform_data structures.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
