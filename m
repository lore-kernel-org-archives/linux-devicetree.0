From: Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [PATCH 0/2] This patch introduces a feature to force gpio-poweroff
 module
Date: Mon, 30 Sep 2019 20:42:53 +0100 (BST)
Message-ID: <alpine.DEB.2.21.1909301909360.6576@clifford.vandergast.wormnet.eu>
References: <20190930103531.13764-1-oleksandr.suvorov@toradex.com> <20190930121440.GC13301@lunn.ch> <CAGgjyvEx_F0C2XHDGxf3F0Z8iHF1vQZkoPft3_ZbTswVFv=SJA@mail.gmail.com> <20190930163203.GC15343@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930163203.GC15343@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 30 Sep 2019, Andrew Lunn wrote:

> On Mon, Sep 30, 2019 at 02:11:59PM +0000, Oleksandr Suvorov wrote:
>> Hi Andrew,
>>
>> On Mon, Sep 30, 2019 at 3:16 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>
>>> On Mon, Sep 30, 2019 at 10:35:36AM +0000, Oleksandr Suvorov wrote:
>>>> to register its own pm_power_off handler even if someone has registered
>>>> this handler earlier.
>>>> Useful to change a way to power off the system using DT files.
>>>
>>> Hi Oleksandr
>>>
>>> I'm not sure this is a good idea. What happens when there are two
>>> drivers using forced mode? You then get which ever is register last.
>>> Non deterministic behaviour.
>>
>> You're right, we have to handle a case when gpio-poweroff fails to
>> power the system off. Please look at the
>> 2nd version of the patchset.
>>
>> There are 3 only drivers that forcibly register its own pm_power_off
>> handler even if it has been registered before.
>>
>> drivers/firmware/efi/reboot.c - supports chained call of next
>> pm_power_off handler if its own handler fails.
>>
>> arch/x86/platform/iris/iris.c, drivers/char/ipmi/ipmi_poweroff.c -
>> don't support calling of next pm_power_off handler.
>> Looks like these drivers should be fixed too.
>>
>> All other drivers don't change already initialized pm_power_off handler.
>>
>>> What is the other driver which is causing you problems? How is it
>>> getting probed? DT?
>>
>> There are several PMUs, RTCs, watchdogs that register their own pm_power_off.
>> Most of them, probably not all, are probed from DT.
>
> And which specific one is causing you problems.
>
> I don't like this forced parameter. No other driver is using it.
>
> Maybe we should change this driver to support chained pm_power_off
> handlers?

There's still scope for non-deterministic behaviour though, as the 
chaining would take place depending on the probe ordering. Admittedly if 
the gpio-poweroff works it's unlikely to be a problem, but still seems 
messy.

Without knowing specifics, disabling the devices that can't turn the 
device off seems like a better bet. If they'd be otherwise useful, I see 
there's a of_device_is_system_power_controller(), see:

/Documentation/devicetree/bindings/power/power-controller.txt
https://elixir.bootlin.com/linux/latest/source/drivers/mfd/max77620.c#L566

...maybe that can be added to the devices getting in the way?

Cheers,

[0] https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/bcm2835_wdt.c#L152
(chosen at random)


>
>   Andrew
>

-- 
Jamie Lentin
