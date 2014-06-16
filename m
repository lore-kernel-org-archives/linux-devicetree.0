From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] firmware: Add device tree binding for coreboot
Date: Mon, 16 Jun 2014 13:13:37 -0700
Message-ID: <CAODwPW9w0sKme=QSthJN7QACGcwpR6NmxufFtirkm6d3XYZ1_g@mail.gmail.com>
References: <1402689965-19397-1-git-send-email-jwerner@chromium.org>
	<CAL_JsqL-K4i54ysugCKSw-aO-9pvnYgZfJ=NdBAot=mwffxmyA@mail.gmail.com>
	<CAODwPW9tRM8kxBVg3apkec2K1rahuENk_b_BD_0jvXON7JzeaA@mail.gmail.com>
	<CALiw-2GWHKPbXuMFXUHY_pgpUJNdqQbyPEV1UjEep3zD2sSRPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALiw-2GWHKPbXuMFXUHY_pgpUJNdqQbyPEV1UjEep3zD2sSRPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <stephen.r.warren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Hendrix <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 16, 2014 at 6:30 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jun 13, 2014 at 4:58 PM, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> This is just to export a fixed log to userspace (like a DMI table) or
>>> the kernel will actually use the data in some way? Based on the link,
>>> it looks like the former to me.
>>
>> I could imagine both. The link is an in-kernel driver that exposes a
>> log through a sysfs node (in a way that has already been established
>> on x86 systems, which find the location through EBDA or ACPI entries
>> instead). We are also using a user-space tool that reads the address
>> from /proc/device-tree and accesses it through /dev/mem. The areas can
>> contain many interesting entries (like the location of an early
>> framebuffer set up by the firmware), so I could also imagine use cases
>> where the kernel makes use of it directly.
>
> I can be argued that the boot interface is DT and any configuration
> data should be put there in a common way. We don't really need yet
> another boot mechanism as we already have:
>
> UEFI + FDT
> UEFI + ACPI
> "standard" bootloaders (e.g. u-boot, grub, barebox, etc.) + FDT
>
> Allowing every bootloader to define its own boot interfaces would only
> result in a mess for both code and testing. I don't want to get into a
> debate about this now as it is not too relevant to this patch, but
> just want to highlight the resistance you will face going down this
> path.
>
>>> Don't you need need to keep the kernel from allocating this memory by
>>> using one of the reserved memory mechanisms? The recently added one
>>> should be able to specific what the memory is reserved for IIRC.
>>
>> Our bootloader is carving the location out of the /memory node and
>> adding it to the device tree reserve map. As far as I know, that only
>> contains a list of raw start and size entries. At any rate, I think
>> it's useful (and in line with other bindings) to add a more explicit
>> node like this (if only to make it easier accessible through
>> /proc/device-tree).
>
> Understand there are 3 different memory reservation bindings. The
> original "/memreserve/" method is indeed limited. What I think you
> should use is the binding documented in
> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt.
> So you could do something like this:
>
>        reserved-memory {
>                #address-cells = <1>;
>                #size-cells = <1>;
>                ranges;
>
>                /* global autoconfigured region for contiguous allocations */
>                linux,cma {
>                        compatible = "shared-dma-pool";
>                        reusable;
>                        size = <0x4000000>;
>                        alignment = <0x2000>;
>                        linux,cma-default;
>                };
>
>                coreboot_reserved: coreboot@fdfea000 {
>                      compatible = "coreboot";
>                      reg = <0xfdfea000 0x264>,
>                          <0xfdfea000 0x16000>;
>                };
>
>

Okay, I see. But do you really think this is the best way to specify
that interface? Bindings for other firmware also seems to prefer some
form of /firmware, so I think putting it there or under there is more
consistent. Especially if we later find a need to add more properties
to the coreboot node (maybe a version number, feature availability, or
things like that), a reserved-memory node would feel like the wrong
place for it to me.

>>> /firmware is already used IIRC. What if you have other firmware such
>>> as Trustzone?
>>
>> I'm not quite sure how Trusted Foundations works and whether it would
>> even make sense to use it in parallel to coreboot, but it seems to be
>> using the /firmware/trusted-foundations subnode so that should be
>> fine. "firmware" seems to be used by other firmware implementations
>> (like "samsung,secure-firmware") which are similar in nature to and
>> mutually exclusive with coreboot, so I thought the node makes sense.
>> (The kernel should use the compatible string to find it anyway, so a
>> future name clash would not be world-ending.)
>
> They are not mutually exclusive. What runs in secure world or not is
> entirely independent of non-secure boot. You may not care about it,
> but other platforms could.

On Mon, Jun 16, 2014 at 9:39 AM, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> 2014-06-13 14:58 GMT-07:00 Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>:
>>> This is just to export a fixed log to userspace (like a DMI table) or
>>> the kernel will actually use the data in some way? Based on the link,
>>> it looks like the former to me.
>>
>> I could imagine both. The link is an in-kernel driver that exposes a
>> log through a sysfs node (in a way that has already been established
>> on x86 systems, which find the location through EBDA or ACPI entries
>> instead). We are also using a user-space tool that reads the address
>> from /proc/device-tree and accesses it through /dev/mem. The areas can
>> contain many interesting entries (like the location of an early
>> framebuffer set up by the firmware), so I could also imagine use cases
>> where the kernel makes use of it directly.
>
> Hmm. It'd be much better if the early framebuffer was communicated
> using the already existing methods (i.e. simplefb device tree node).
> That way we don't have to add custom code to grab it out of the
> coreboot memory structure.
>
> Adding a platform driver for coreboot to do it later in boot isn't so
> hard (and registering platform devices based on the contents), but we
> probably need to be more generic if it is to be used in actual early
> boot, which is the main use case for it.
>

The framebuffer was just a further example I could think of, I don't
have any plans to add kernel code using it for the moment. I agree
that it's better to define generic interfaces and have the firmware
support those... but these take some time to flesh out, and I think
there may always be cases of things that are too new or too specific
to a particular firmware to have a generic interface (e.g. debug tools
that could dump left-over firmware state to analyze a problem). I
think having direct access to data structures like these is still
useful, even if you also have support for generic interfaces.

>>> Don't you need need to keep the kernel from allocating this memory by
>>> using one of the reserved memory mechanisms? The recently added one
>>> should be able to specific what the memory is reserved for IIRC.
>>
>> Our bootloader is carving the location out of the /memory node and
>> adding it to the device tree reserve map. As far as I know, that only
>> contains a list of raw start and size entries. At any rate, I think
>> it's useful (and in line with other bindings) to add a more explicit
>> node like this (if only to make it easier accessible through
>> /proc/device-tree).
>>
>>> /firmware is already used IIRC. What if you have other firmware such
>>> as Trustzone?
>>
>> I'm not quite sure how Trusted Foundations works and whether it would
>> even make sense to use it in parallel to coreboot, but it seems to be
>> using the /firmware/trusted-foundations subnode so that should be
>> fine. "firmware" seems to be used by other firmware implementations
>> (like "samsung,secure-firmware") which are similar in nature to and
>> mutually exclusive with coreboot, so I thought the node makes sense.
>> (The kernel should use the compatible string to find it anyway, so a
>> future name clash would not be world-ending.)
>
> Right, coreboot really should go under /firmware/coreboot -- we
> already use /firmware/chromeos on chromebooks to specify
> chromeos-specific firmware properties, this follows that convention.
>
> The samsung,secure-firmware should probably also be moved to a
> subnode. The binding shouldn't require a specific location no matter
> what.

Okay, fair enough. I'll upload a new patch that suggests
/firmware/coreboot instead.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
