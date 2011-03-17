From: Andy Green <andy@warmcat.com>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Thu, 17 Mar 2011 23:22:03 +0000
Message-ID: <4D82979B.2050003@linaro.org>
References: <20110311165642.GA9996@kroah.com> <20110317214042.GQ31411@opensource.wolfsonmicro.com> <20110317214736.GA29014@kroah.com> <201103172333.01474.arnd@arndb.de>
Reply-To: andy.green@linaro.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201103172333.01474.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg KH <greg@kroah.com>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Linux USB list <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/17/2011 10:33 PM, Somebody in the thread at some point said:
> On Thursday 17 March 2011 22:47:36 Greg KH wrote:
>>>> Patches to fix this, for this specific PandaBoard controller are gladly
>>>> accepted.  What's odd is this is explicitly a Linux development board,
>>>> so you would think that this could have been caught, and fixed, in the
>>>> hardware a long time ago, right?
>>>
>>> The way everyone resolves this stuff is by patching their kernel
>>> locally.
>>
>> Well, that means that the device tree work is going to be useful here,
>> right?  :)
>
> I like the idea. Let's make this the first use case where a lot of

You changed your first opinion about tagging "dynamically probed 
devices" with what is effectively platform_data, cool.

> people will want to have the device tree on ARM. The patch to the
> driver to check for a mac-address property is trivial, and we
> can probably come up with a decent way of parsing the device
> tree for USB devices, after all there is an existing spec for
> it (http://playground.sun.com/1275/bindings/usb/usb-1_0.ps).

It doesn't do it already then.

That spec you pointed to from 1998 is obviously going to be a whole 
subproject doing the binding, it seems to fingerprint devices by VID/PID 
if I understood it.

What's the plan for leveraging that level of generality on "dynamically 
probed devices"?  I mean I know what I want to use this for and the 
platform_data scheme covers all the soldered-on-the-board cases fine.

Is there actually a need for sort of not platform_data but universal 
vid_pid_specific_usb_device_option_data coming from the board definition 
file or bootloader for *pluggable* usb devices?  udev seems to be well 
established doing that already in a generic, not-platform-specific way 
that can go in all distros and so on nicely.  Maybe this is just my 
impoverished imagination and people do want, say, some kinds of USB mice 
to operate at higher DPI or whatever when plugged in a specific board 
because it is that board.

BTW the whole RFC patchset I sent was tested on real Panda, including 
the platform end which actually exists.

-Andy
