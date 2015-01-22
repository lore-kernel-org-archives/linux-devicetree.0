From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Thu, 22 Jan 2015 11:09:02 +0000
Message-ID: <CAFEAcA_2tVB6655aio52BL9OUrp=zostYq0wx4MYytSX4uHovg@mail.gmail.com>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
 <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 January 2015 at 16:21, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 20, 2015 at 1:15 PM, Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> The addition of ARM security extension (TrustZone) support to QEMU has
>> exposed the issue of how secure resources are communicated to secure
>> software responsible for booting the HLOS.  The natural choice for
>> communicating these details is the device tree.
>
> You could also have a secure OS use DT and the HLOS use something else
> (ACPI). Or the secure OS and non-secure firmware (UEFI) use DT and the
> OS uses ACPI.
>
>> In the case of real hardware, the device tree supplied to the HLOS
>> only needs to describe non-secure resources as secure software can
>> rely on static knowledge about the hardware.  This also holds true for
>> QEMU machines modeled after actual fixed hardware configurations.
>> However, this is not the case with QEMU's virtual machine models, such
>> as machvirt, where the hardware configuration can change over time.
>> In this case, secure software is dependent on QEMU's dynamically
>> constructed device tree to describe the hardware, making it impossible
>> for secure software to know ahead of time what is secure, non-secure,
>> or both.
>
> For purposes of this discussion, what works better for QEMU is irrelevant IMO.

Given that this discussion is "how can QEMU do this thing in a
way that works with device tree", what works better for QEMU
is worth considering (though not the deciding factor).

>> Two possible approaches for handling this particular case are:
>>
>> 1) Create two device tree blobs; one describing the non-secure
>> configuration and the other the full configuration.  This would allow
>> secure software to see the full hardware picture including secure
>> resources while the non-secure world would only see the non-secure
>> device tree configuration.  The QEMU virt machine would be responsible
>> for producing the device tree blobs.
>
> I've thought about this some in the past and leaned toward this
> direction mainly because I'd expect you are partitioning most nodes to
> one side. You could do some crazy partitioning with secure and
> non-secure world. It was suggested on highbank to use the secure bit
> as a 33rd address bit to get 8GB of address space for example. You
> could have entirely different view of the system.
>
>> The drawbacks to this approach are:
>> * There are 2 device trees to manage
>
> You already have 2 bootloaders and 2 OS's to manage.

No, QEMU doesn't have multiple numbers of any of those to
manage. It wants to tell the (single) thing it's booting what
the config of the (virtual) hardware is, that's all.

>> * The two DTBs will typically be almost identical.
>
> I don't really agree. If the secure dtb has all non-secure peripherals
> too, then yes. But if you only include peripherals allocated to secure
> world and secure view of peripherals, then I don't think there would
> be much overlap. You pretty much have to statically allocate each
> peripheral to one side or the other.

As Pawel notes, the trustzone address space controller lets
the secure side dynamically choose to allocate some subnodes
to S or NS as it pleases. (That's not a situation I care about
at the moment, as it happens, though.)

>> * Not possible to identify whether a device is shared or not between
>> the secure and non-secure worlds.
>
> Typically, sharing requires a peripheral to be designed to be shared
> like PL330 or MMU-400.

Only if you care about actually dynamically letting both sides
use it at once. What Greg means by "shared" here is "appears in
both the S and NS address spaces", as opposed to "appears in only
one and is physically inaccessible from the other".

>> * Identifying device available only to the secure world require
>> cumbersome comparison of the two device trees.
>
> But that is pretty static. It doesn't seem like a big deal to me.

Static in what sense? The firmware being handed the DTB(s)
by QEMU by definition doesn't know what is secure and what
is not without looking at and comparing the DTBs (since the
DTBs are what tells the firmware what hardware exists and
whether it is S or NS).

> You could also do this w/o dts changes. You could start with a full
> description and the knowledge of what to filter out resides in the
> secure OS or bootloader. It depends where you want to put the
> partitioning decisions.

The firmware (secure OS, bootloader) can make partitioning
decisions, but it can't change what the hardware physically
is. It has to be told whether devices are visible in the S, NS or
both address spaces (via DTB).

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
