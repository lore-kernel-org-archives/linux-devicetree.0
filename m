From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 0/3] Overlay manager for predefined DT overlay
 fragments
Date: Fri, 13 Oct 2017 16:41:03 -0500
Message-ID: <20171013214103.mv6wcemzcl36nnvs@rob-hp-laptop>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507613660-27236-1-git-send-email-john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 09, 2017 at 10:34:17PM -0700, John Stultz wrote:
> In working with the HiKey and HiKey960 as targets for AOSP,
> Dmitry developed the following overlay manager driver, which
> allows a number of pre-determined DT overlay configurations to
> be defined, and the configurations to be enabled at boot time
> via a kernel boot argument.
> 
> This has been submitted before, but while the earlier discussion
> didn't really resolve to any sort of actionable direction, this
> issue cropped up again and was a major discussion topic at the
> Linux Plumbers Conference Android Microconference, so I suspect
> it is worth revisiting this solution again.

The Treble way to handle this is it is the bootloader's problem, right?


> The overall use case is being able to configure devboards that
> support a number of different mezzanine peripherals which
> unfortunately cannot be probed. Some example mezzanines are
> LCD panels or sensor hubs, as well as other options.

There's probably some usecases for putting the overlay into the base 
DT, but I don't think mezzanine boards is one of them especially for dev 
boards where we may want to share overlays.

I could see it in cases where you have 2nd source components for a 
product and want to select one.

> The new functionality this driver provides is a mechanism to
> specify multiple pre-determined dt overlay fragments in a
> dtb file, and providing a way to select which dt fragments
> should be applied via the kernel boot argument.
> 
> The desire to use a kernel boot-argument as the selection
> mechanism, comes from the Android Boot Image format not handling
> dtbs independently. Usually with Android, the dtb is appended
> to the kernel image, and modifying that is much more difficult
> then changing the boot argugments. There is also a usability
> argument that using a kernel command option to select
> pre-defined entries is simpler for users to navigate.

Doesn't Treble address the handling of overlays? Of course, none of what 
has been outlined for Treble has been reviewed upstream either... The 
concept seems fine, it's the vendor implementations that worry me.

As far as usability, a RPi user would probably say listing 
overlays in a text file is easiest as that's how the RPi firmware works.

> Also, since the mezzanines are unable to be probed, we cannot
> use other solutions, like having the bootloader specify
> additional dtb overlays to the kernel.

Not sure I follow.

Someone has to decide what to put on the kernel command line. If you are 
setting the overlay in the command line at bootimage build time or in 
the bootloader, then you could just apply the overlay at that point in 
time. Maybe it's slightly easier to change the kernel command line than 
change the dtb. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
