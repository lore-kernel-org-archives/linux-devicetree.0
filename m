From: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/4] libfdt: Add support for device tree overlays
Date: Thu, 6 Oct 2016 16:11:33 +0100
Message-ID: <CAPhXvM4RbmX0tQyM9HdOozdGQG4rvtdKX06DiVGcg--con7h2g@mail.gmail.com>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
 <20161006094756.GR18733@umbus.fritz.box> <20161006112439.GB4684@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006112439.GB4684@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 6, 2016 at 12:24 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi David,
>
> On Thu, Oct 06, 2016 at 08:47:56PM +1100, David Gibson wrote:
>> On Fri, Sep 30, 2016 at 03:57:13PM +0200, Maxime Ripard wrote:
>> > Hi,
>> >
>> > The device tree overlays are a great solution to the issue raised by
>> > the bunch expandable boards we find everywhere these days, like the
>> > Beaglebone, Raspberry Pi or CHIP.
>> >
>> > Although for now Linux is the only available tool that can deal with
>> > overlays, some other components like bootloaders or user-space tools
>> > might need to apply these overlays on top of a base device tree.
>> >
>> > To address these use cases, we introduce a new function to the libfdt,
>> > fdt_overlay_apply, that does just that.
>> >
>> > You can find a test program here: http://code.bulix.org/792zum-99476?raw
>> >
>> > This is the last patches sent to U-boot, with the modifications
>> > suggested by David, and the additional test cases.
>> >
>> > Let me know what you think!
>> > Maxime
>>
>> Looking pretty good.  There's a minor error in 3/4 which I've pointed
>> out, it can be fixed in a followup.
>>
>> An error in the conditionals means it's trying to run some of the
>> tests which require an overlay-aware dtc on even when that's not
>> available - I adjusted 4/4 to correct that.
>
> While chasing that, I found that it was actually a bug in a condition
> that was stricter than it should, I'll send follow-up with that and
> the fix you asked.
>
>> It also hit build failures on Travis, because the compiler version
>> there complains about local variables named 'index' shadowing the
>> standard library function.  I've corrected that with a followup patch.
>>
>> With that done, the whole lot has been committed to master.
>
> Thanks a lot,
> Maxime

Now that upstream libfdt can resolve and apply overlays we need a way
of generating them. I have a set of three patches from Pantelis that
add "plugin" support to dtc, together with two downstream Raspberry Pi
patches that fix an uninitialised memory reference and restrict
__local_fixups__  generation to overlays.

Is there already a plan to get these upstreamed? If so, can we get the
downstream fixes included?

Phil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
