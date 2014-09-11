From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Date: Thu, 11 Sep 2014 17:47:10 +0100
Message-ID: <20140911164710.GW6158@arm.com>
References: <1410452204-7277-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410452204-7277-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 11, 2014 at 05:16:44PM +0100, Doug Anderson wrote:
> Some 32-bit (ARMv7) systems are architected like this:
> 
> * The firmware doesn't know and doesn't care about hypervisor mode and
>   we don't want to add the complexity of hypervisor there.
> 
> * The firmware isn't involved in SMP bringup or resume.
> 
> * The ARCH timer come up with an uninitialized offset between the
>   virtual and physical counters.  Each core gets a different random
>   offset.
> 
> On systems like the above, it doesn't make sense to use the virtual
> counter.  There's nobody managing the offset and each time a core goes
> down and comes back up it will get reinitialized to some other random
> value.

You probably need to rephrase this slightly, as there *is* still a
requirement on the hypervisor/firmware (actually, two!). See below.

> Let's add a property to the device tree to say that we shouldn't use
> the virtual timer.  Firmware could potentially remove this property
> before passing the device tree to the kernel if it really wants the
> kernel to use a virtual timer.
> 
> Note that it's been said that ARM64 (ARMv8) systems the firmware and
> kernel really can't be architected as described above.  That means
> using the physical timer like this really only makes sense for ARMv7
> systems.

I'd go further: this only makes sense if you're booting in secure SVC
mode.

> In order for this patch to do anything useful, we also need Sonny's
> patch at <https://patchwork.kernel.org/patch/4790921/>
> 
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Add "#ifdef CONFIG_ARM" as per Will Deacon
> 
>  Documentation/devicetree/bindings/arm/arch_timer.txt | 6 ++++++
>  drivers/clocksource/arm_arch_timer.c                 | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
> index 37b2caf..876d32b 100644
> --- a/Documentation/devicetree/bindings/arm/arch_timer.txt
> +++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
> @@ -22,6 +22,12 @@ to deliver its interrupts via SPIs.
>  - always-on : a boolean property. If present, the timer is powered through an
>    always-on power domain, therefore it never loses context.
>  
> +** Optional properties:
> +
> +- arm,use-physical-timer : Don't ever use the virtual timer, just use the
> +  physical one.  Not supported for ARM64.

I'd say `Only supported for ARM' to better match what we've done. Probably
also worth mentioning that this relies on the hypervisor/firmware having set
CNTHCTL.PL1PCEN and CNTHCTL.EL1PCTEN (but assumedly made a mess of CNTVOFF
;) if you want to boot on the non-secure side (e.g. as a guest).

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
