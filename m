From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 0/4 v2] of/overlay: sysfs based ABI for dt overlays
Date: Tue, 3 Jan 2017 18:25:11 +0100
Message-ID: <bc8bfb52-087f-cfa5-97c2-d30f8767f2d2@gmx.de>
References: <20161220190455.25115-1-xypron.glpk@gmx.de>
 <585C22BB.3080403@gmail.com>
 <ADF59727-1808-4C9E-B763-FF1F493DAACE@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ADF59727-1808-4C9E-B763-FF1F493DAACE-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/03/2017 01:11 PM, Pantelis Antoniou wrote:
> Hi Frank, Heinrich,
> 
>> On Dec 22, 2016, at 21:00 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Hi Heinrich,
>>
>> On 12/20/16 11:04, Heinrich Schuchardt wrote:
>>> Currently the kernel only supplies an internal API for creating
>>> and destroying device tree overlays.
>>>
>>> For some boards vendor specific kernel modules exist for
>>> managing device tree overlays but they have not been
>>> upstreamed or upstreaming stalled.
>>> https://lkml.org/lkml/2015/6/12/624
>>> https://lkml.org/lkml/2013/1/7/366
>>>
>>> This patch series provides a sysfs based ABI for creation and
>>> destruction of dt overlays in /sys/firmware/devicetree/overlays.
>>>
>>> The following files are provided:
>>>
>>> load:   This is a write only file.
>>>        A string written to it is interpreted as the path to a
>>>        flattened device tree overlay file. It is used to create
>>>        and apply the contained overlays.
>>>
>>> loaded: This is a read only file.
>>>        It provides the count of loaded overlays as a decimal
>>>        number.
>>>
>>> unload: This is a write only file.
>>>        If a positive number n is wrtten to this file the n
>>>        most recent overlays are destroyed.
>>>        If a negative number is written to this file all
>>>        overlays are destroyed.
>>
>> This patch series follows a _somewhat_ similar approach to what
>> was first proposed two years ago, and does not address the
>> issues that were brought up at that time.  See:
>>
>>  From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>  Date: Wed,  3 Dec 2014 13:23:28 +0200
>>  Subject: [PATCH] OF: DT-Overlay configfs interface (v3)
>>
>> But just responding directly to the two year old issues would not
>> be a productive approach, since there has been a lot of subsequent
>> discussion on how to load overlays (you point to two of the many
>> threads above).  The latest discussions are based on the concept
>> of describing the overlay attachment points as connectors.
>>
>> Please join in pushing the connectors discussion along to make
>> sure that it meets your needs.
>>
> 
> I think it would be best if we focus on getting the configfs based loader
> to work. It is pretty similar to what Heinrich is proposing.
> 
>> -Frank
>>
> 
> Regards
> 
> — Pantelis
> 

Reading Documentation/filesystems/configfs/configfs.txt it is not
evident to me that using configfs would be more appropriate than using
sysfs.

But I think before going into implementation details it is necessary to
define the scope of the development.

Up to now I have seen the following possible usages of device tree overlays:

1) Manage virtual devices
e.g. hot plugging CPUs and memory of a virtual machine

2) Activating optional hardware without discovery mechanism,
e.g an RTC on the I2C bus, or an I2C Grove sensor. This may include
changing the GPIO multiplexing.

3) Activating optional hardware with a discovery mechanism,
e.g. Beaglebone Capes and Raspberry hats with an EEPROM that can be read
over the I2C bus.

For scenario 3 elaborate kernel plugins have been written that try to
handle the complete complexity in kernel code, e.g. the Beaglebone cape
manager.

The discussion about connectors is also putting a lot of complexity into
possible kernel code, cf.
https://lkml.org/lkml/2016/6/30/734

In my view the kernel ABI for loading and removing overlays should
follow the KISS principle.

In scenario 3 a possible alternative design would be to put most of the
complexity into the userland and only supply the reading of the EEPROMs
via I2C and the loading mechanism for overlays as kernel modules.

In my patch series I hence only provided three interface functions:
Push an overlay on the stack of overlays.
Pop an overlay from the stack.
Count the overlays.

I prefer pop to delete by id because it will always succeed. But of
cause delete by id could be added to the ABI.

When applying overlays to change the same property again and again the
overlay stack can be considered a memory leak. So we might want to add a
merge/commit function. That function would empty the overlay stack
without undoing the changes.

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
