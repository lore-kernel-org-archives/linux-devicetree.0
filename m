From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Wed, 21 Jan 2015 11:43:09 -0600
Message-ID: <CAL_JsqJDNziqcX-8cq0PkSE61NVpmSBUM+fo3vmD3WrBG3=R7Q@mail.gmail.com>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
 <20150121162938.GJ5044@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150121162938.GJ5044@leverpostej>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 21, 2015 at 10:29 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Jan 20, 2015 at 07:15:51PM +0000, Greg Bellows wrote:
>> The addition of ARM security extension (TrustZone) support to QEMU has
>> exposed the issue of how secure resources are communicated to secure
>> software responsible for booting the HLOS.  The natural choice for
>> communicating these details is the device tree.
>>
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

The latter of course is exactly what PowerPC PSeries does with DT.

Which reminds me that this issue is also very similar to hypervisor
cases and Xen in particular. Xen uses DT, filters out what it uses and
passes on the modified DT to Dom0 kernel.

>> In this case, secure software is dependent on QEMU's dynamically
>> constructed device tree to describe the hardware, making it impossible
>> for secure software to know ahead of time what is secure, non-secure,
>> or both.
>>
>> Two possible approaches for handling this particular case are:
>>
>> 1) Create two device tree blobs; one describing the non-secure
>> configuration and the other the full configuration.  This would allow
>> secure software to see the full hardware picture including secure
>> resources while the non-secure world would only see the non-secure
>> device tree configuration.  The QEMU virt machine would be responsible
>> for producing the device tree blobs.
>>
>> The drawbacks to this approach are:
>> * There are 2 device trees to manage
>> * The two DTBs will typically be almost identical.
>> * Not possible to identify whether a device is shared or not between
>> the secure and non-secure worlds.
>> * Identifying device available only to the secure world require
>> cumbersome comparison of the two device trees.
>
> I'm not sure I follow why such identification is necessary?
>
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

True, but I would guess this is the common case.

> Architecturally the secure and non-secure physical address spaces are
> entiorely separate, and do not necessarily mirror each other.
>
> It's entirely valid for some devices/RAM to only exist in one of the
> address spaces (we typically see secure-only devices, but
> non-secure-only devices are also possible). It's also entirely valid for
> the same device to be mapped at different addresses in each address
> space (e.g. the same UART could be mapped at both S:0xffff0000 and also
> at NS:0xcccc0000 and nowhere else in either address space).
>
> So approach (2) does not fit the architecture generally. From what I
> recall of previous discussions, we eventually figured out that you
> either need separate trees or a higher level container to address the
> secure vs nonsecure split.

Though there's no reason both approaches can't be supported. If the 2
views are radically different, then use 2 DTs. If they are similar and
just a matter of partitioning, then you can fix up the DT before
passing to non-secure world (or even do this with a script offline
(i.e. 1 dts and 2 dtb's)).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
