From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Wed, 13 Jun 2018 09:00:17 -0600
Message-ID: <CAL_JsqJtL0HMPxv5vMv2+LOyvyVtYusu3Ja-NikCy2RQSo7f0Q@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
 <CAL_Jsq+dHVN+Y7xczf_Oxcn=BiJ6N9WzovRbSujgLLTYHMEh0g@mail.gmail.com> <f5e71bac1bc23f96b7dae64bbdad8e2154c339aa.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f5e71bac1bc23f96b7dae64bbdad8e2154c339aa.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 4:53 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2018-06-12 at 11:42 -0600, Rob Herring wrote:
>> On Mon, Jun 11, 2018 at 6:01 PM, Benjamin Herrenschmidt
>> <benh@kernel.crashing.org> wrote:
>> > There are still quite a few cases where a device might want to get to a
>> > different node of the device-tree, obtain the resources and map them.
>> >
>> > Drivers doing that currently open code the whole thing, which is error
>> > proe.
>> >
>> > We have of_iomap() and of_io_request_and_map() but they both have shortcomings,
>> > such as not returning the size of the resource found (which can be necessary)
>> > and not being "managed".
>> >
>> > This adds a devm_of_iomap() that provides all of these and should probably
>> > replace uses of the above in most drivers.
>> >
>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> > ---
>> >
>> > I'm cooking a driver that uses this, if there's no objection I'd like
>> > to carry it in my pull request for that driver (it can also exist in
>> > the DT tree of course). Just let me know.
>>
>> We generally only use of_iomap when there is no struct device for any
>> new driver. Why can't you use devm_ioremap_resource? Is this a
>> non-platform bus device?
>
> This is just a wrapper on devm_ioremap_resource :-) Basically it's a
> "fixed" version of of_iomap, that has the devm* management and will
> mark the resource busy.
>
> My thinking was to then replace most of_iomap users with this.
>
> As for the specific case of the driver I'm cooking, it's a case where
> the SoC contains a little coprocessor (a ColdFire even !) alongside the

Wow. Must be the 1 licensee.

> main ARM core. I have a driver that offloads the bitbanging of some
> GPIOs to it (to implement the FSI bus). I use devm_of_iomap() to map
> the registers of the interrupt controller of the coprocessor, it's not
> really part of the interrupt tree, it doesn't distribute interrupts to
> the ARM or to Linux, it's just a device-node pointed to by a handle.

Accessing another processor's interrupt controller. What could go
wrong with that.

I guess this is fine. There's another problem though. This doesn't
work on Sparc because address.c is not built. I'd suggest moving to
of/device.c or a new file.


> BTW. Another thing that I find a bit annoying is "allocated" reserved-
> memory, there's no API to get to it other than via the DMA APIs or a
> CMA, which is overkill in a few circumstances (such as the one here
> where I just want to dedicate a bit of memory to the coprocessor).
> Right now I'm using a fixed reservation (with a reg property) and go to
> it "manually" but that somewhat sucks.

But that's not really a DT problem. It's a kernel problem if you can't
reserve a contiguous range of unmapped pages. But why not just get
coherent allocation and ignore that it is mapped. That seems better to
me than working around it in DT.

Rob
