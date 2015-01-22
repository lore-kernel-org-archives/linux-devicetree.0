From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Thu, 22 Jan 2015 11:14:44 +0000
Message-ID: <CAFEAcA_J6GVyeiqj=9sfZFJ_KK2uGaRsgRXcg3C4KM13UcVmMQ@mail.gmail.com>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
 <20150121162938.GJ5044@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150121162938.GJ5044@leverpostej>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 January 2015 at 16:29, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Jan 20, 2015 at 07:15:51PM +0000, Greg Bellows wrote:
>> In the case of real hardware, the device tree supplied to the HLOS
>> only needs to describe non-secure resources as secure software can
>> rely on static knowledge about the hardware.  This also holds true for
>> QEMU machines modeled after actual fixed hardware configurations.
>> However, this is not the case with QEMU's virtual machine models, such
>> as machvirt, where the hardware configuration can change over time.
>
> When you say this changes over time, I assume you mean for the lifetime
> of the project, as opposed to the lifetime of a running instance? i.e.
> non-probeable devices are not dynamically injected to a running system.

We mean in the sense that any particular version of QEMU (or a
particular run of QEMU with different user supplied options) might
expose a different set of hardware to the firmware and OS. The
only thing the firmware can assume is the base address of RAM;
everything else it must determine via DTB.

For hotplug we're going to end up using PCIe I think, so not
a device tree issue at all.

>> The drawbacks to this approach are:
>> * There are 2 device trees to manage
>> * The two DTBs will typically be almost identical.
>> * Not possible to identify whether a device is shared or not between
>> the secure and non-secure worlds.
>> * Identifying device available only to the secure world require
>> cumbersome comparison of the two device trees.
>
> I'm not sure I follow why such identification is necessary?

If I'm the secure world firmware and I want to use a UART to
send some debug output to the world, I can look through the S
device tree blob and find a PL011. But I can't tell if it's the
PL011 that I should use, or the one that's shared with the NS
address space and which the nonsecure guest OS should use, unless
I go through both device tree blobs cross-checking for which
devices appear in both blobs (or unless the devices are marked
up for which address space they appear in, in which case why
have two blobs in the first place?).

>> * A mechanism would be needed to pass an additional device tree.
>>
>> 2) Modify the standard device tree blob to include annotations or
>> modifications to describe which resources are secure or not.  In this
>> case, secure software would use the single device tree to identify the
>> secure resources.  The added information could be used by secure
>> software to trim the device tree before passing it.  Alternatively,
>> the information could be passed on to non-secure software with the
>> expectation that it would honor the device security.   It would be
>> crucial that any data added to the device tree adhere to existing
>> conventions or expectations.
>
> This approach assumes assumes that the secure and non-secure physical
> address spaces are identical bar some portions being masked out on the
> non-secure side. This is not necessarily the case.
>
> Architecturally the secure and non-secure physical address spaces are
> entiorely separate, and do not necessarily mirror each other.
>
> It's entirely valid for some devices/RAM to only exist in one of the
> address spaces (we typically see secure-only devices, but
> non-secure-only devices are also possible). It's also entirely valid for
> the same device to be mapped at different addresses in each address
> space (e.g. the same UART could be mapped at both S:0xffff0000 and also
> at NS:0xcccc0000 and nowhere else in either address space).

This is all true, but the common case is "most things are shared
and a few devices are S-only". What I envisaged with this approach
was an easy way to describe the common case, with presumably syntax
that would permit the weird case to be described too.

> So approach (2) does not fit the architecture generally. From what I
> recall of previous discussions, we eventually figured out that you
> either need separate trees or a higher level container to address the
> secure vs nonsecure split.

I would definitely prefer some sort of single container or blob.
I only want to describe the hardware once and pass the DTB
consumer a single thing describing the hardware.

-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
