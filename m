From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Wed, 21 Jan 2015 10:21:09 -0600
Message-ID: <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag@mail.gmail.com>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2015 at 1:15 PM, Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The addition of ARM security extension (TrustZone) support to QEMU has
> exposed the issue of how secure resources are communicated to secure
> software responsible for booting the HLOS.  The natural choice for
> communicating these details is the device tree.

You could also have a secure OS use DT and the HLOS use something else
(ACPI). Or the secure OS and non-secure firmware (UEFI) use DT and the
OS uses ACPI.

> In the case of real hardware, the device tree supplied to the HLOS
> only needs to describe non-secure resources as secure software can
> rely on static knowledge about the hardware.  This also holds true for
> QEMU machines modeled after actual fixed hardware configurations.
> However, this is not the case with QEMU's virtual machine models, such
> as machvirt, where the hardware configuration can change over time.
> In this case, secure software is dependent on QEMU's dynamically
> constructed device tree to describe the hardware, making it impossible
> for secure software to know ahead of time what is secure, non-secure,
> or both.

For purposes of this discussion, what works better for QEMU is irrelevant IMO.

> Two possible approaches for handling this particular case are:
>
> 1) Create two device tree blobs; one describing the non-secure
> configuration and the other the full configuration.  This would allow
> secure software to see the full hardware picture including secure
> resources while the non-secure world would only see the non-secure
> device tree configuration.  The QEMU virt machine would be responsible
> for producing the device tree blobs.

I've thought about this some in the past and leaned toward this
direction mainly because I'd expect you are partitioning most nodes to
one side. You could do some crazy partitioning with secure and
non-secure world. It was suggested on highbank to use the secure bit
as a 33rd address bit to get 8GB of address space for example. You
could have entirely different view of the system.

> The drawbacks to this approach are:
> * There are 2 device trees to manage

You already have 2 bootloaders and 2 OS's to manage.

> * The two DTBs will typically be almost identical.

I don't really agree. If the secure dtb has all non-secure peripherals
too, then yes. But if you only include peripherals allocated to secure
world and secure view of peripherals, then I don't think there would
be much overlap. You pretty much have to statically allocate each
peripheral to one side or the other.

> * Not possible to identify whether a device is shared or not between
> the secure and non-secure worlds.

Typically, sharing requires a peripheral to be designed to be shared
like PL330 or MMU-400. I have seen some h/w with locking registers so
2 different cores/OSs can share an i2c bus. You could do something
like that for Trustzone as well I suppose. That's not really secure,
but allows shared access. I think it is generally a limited number of
peripherals which are shared.

> * Identifying device available only to the secure world require
> cumbersome comparison of the two device trees.

But that is pretty static. It doesn't seem like a big deal to me.

> * A mechanism would be needed to pass an additional device tree.
>
> 2) Modify the standard device tree blob to include annotations or
> modifications to describe which resources are secure or not.  In this
> case, secure software would use the single device tree to identify the
> secure resources.  The added information could be used by secure
> software to trim the device tree before passing it.  Alternatively,
> the information could be passed on to non-secure software with the
> expectation that it would honor the device security.   It would be
> crucial that any data added to the device tree adhere to existing
> conventions or expectations.

You could also do this w/o dts changes. You could start with a full
description and the knowledge of what to filter out resides in the
secure OS or bootloader. It depends where you want to put the
partitioning decisions.

I think there's 2 main cases to consider. Full nodes that are assigned
to one side and Trustzone aware nodes. The first could potentially
re-use status property adding just a "secure" setting or we just add a
new "secure" property. This should probably be inherited by child
nodes. The secure firmware would then need to remove or set status to
disabled for those nodes. For the latter case, I don't think we can
avoid having the firmware having specific knowledge of the bindings.
We'll have to filter out the secure only details as I think so far we
have only been creating bindings which describe the non-secure view. I
don't think this is a big deal as the peripheral set would be pretty
limited AFAIK.

Rob

> The drawbacks to this approach are:
> * Additional secure state details. potentially unrecognized by current
> consumers,  would need to be added to the device tree.
> * Unless a mechanism already exists, the new secure property runs the
> risk of breaking backwards compatibility.
> * Secure firmware is responsible for understanding and possibly
> filtering the secure device tree data.
>
> Feedback welcomed.
>
> Greg
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
