From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: base: upgrade initcall level of of_init from core to pure
Date: Wed, 13 May 2015 08:46:47 -0500
Message-ID: <CAL_JsqL_pEZ0qMgk3j7fwuWLTVZEm2UpPR=e4jAMN4shHAtNnA@mail.gmail.com>
References: <1431452282-10207-1-git-send-email-sudeep.holla@arm.com>
 <CAL_JsqJ19OfTJjtrZ9vs_9VYRHzOyF=GZdz4ftHT=nonEVWWgw@mail.gmail.com> <55532186.5060803@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55532186.5060803@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 5:03 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 12/05/15 23:55, Rob Herring wrote:
>>
>> On Tue, May 12, 2015 at 12:38 PM, Sudeep Holla <sudeep.holla@arm.com>
>> wrote:
>>>
>>> Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
>>> devices with an OF node") adds the symlink `of_node` for each device
>>> pointing to it's device tree node while creating/initialising it.
>>>
>>> However the devicetree sysfs is created and setup in of_init which is
>>> executed at core_initcall level. For all the devices created at the core
>>> initcall before of_init, the following error is thrown:
>>>          "Error -2(-ENOENT) creating of_node link"
>>
>>
>> What devices have you seen the problem with? I'd rather see if those
>> devices could now be moved later.
>>
>
> Yes that's exactly what I attempted first after seeing the issue, but
> failed miserably due to the dependency mentioned below.
>
> It's on vexpress platforms with the following initcall sequence:
> 1. core - vexpress system control registers block(sysreg)
> 2. postcore - vexpress configuration controllers(config-bridge)
> 3. arch - customize_machine->of_platform_populate

I'd argue we should move this later, but that's a big hammer.

> of_platform_populate creates amba_devices which need clocks and
> depend on the vexpress-config and clocks which in turn depends on
> vexpress-sysreg

Personally, I think all this stuff is overly complicated and perhaps
too much stuff in DT. vexpress-config and vexpress-sysreq are tightly
coupled and perhaps should be handled with 1 driver. Also, calling
vexpress-config a bus is a bit of an abuse.

> I would like to know if with commit 5590f3196b29 are we mandating
> all the device creation to be done only after core_initcall or
> is it OK get the errors mentioned above and ignore them as harmless
> as the comment in the code states:
> "An error here doesn't warrant bringing down the device"

I don't think it really changed with that commit, but there has to be
some mechanism for core/infrastructure to initialize before
drivers/devices.

>>> Since the core_initcall is the earliest point where devices get
>>> registered, push initcall level of of_init from core to pure so that
>>> the devicetree sysfs is ready before any devices are registered.
>>
>>
>> Read the definition of pure:
>>
>>   * A "pure" initcall has no dependencies on anything else, and purely
>>   * initializes variables that couldn't be statically initialized.
>>
>
> Yes I read and was bit hesitant initially to do this change, but found
> no better way. I posted mainly to discuss other possibilities to solve
> the issue.

Perhaps of_init should not be an initcall at all and it should go into
driver_init().

Rob
