From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: Re: [PATCH 4/7] ECHI Platform: Merge ppc-of EHCI driver into the
 ehci-platform driver
Date: Sat, 22 Feb 2014 15:32:53 +1300
Message-ID: <53080C55.3070001@prisktech.co.nz>
References: <20140221114803.GB8783@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140221114803.GB8783-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 22/02/14 00:48, Mark Rutland wrote:
> [Adding Tony Prisk to Cc]
>
> On Fri, Feb 21, 2014 at 06:31:30AM +0000, Alistair Popple wrote:
>> Currently the ppc-of driver uses the compatibility string
>> "usb-ehci". This means platforms that use device-tree and implement an
>> EHCI compatible interface have to either use the ppc-of driver or add
>> a compatible line to the ehci-platform driver. It would be more
>> appropriate for the platform driver to be compatible with "usb-ehci"
>> as non-powerpc platforms are also beginning to utilise device-tree.
>>
>> This patch merges the device tree property parsing from ehci-ppc-of
>> into the platform driver and adds a "usb-ehci" compatibility
>> string. The existing ehci-ppc-of driver is removed and the 440EPX
>> specific quirks are added to the ehci-platform driver.
>>
>> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
>> ---
>>   drivers/usb/host/Kconfig         |    7 +-
>>   drivers/usb/host/ehci-hcd.c      |    5 -
>>   drivers/usb/host/ehci-platform.c |   87 +++++++++++++-
>>   drivers/usb/host/ehci-ppc-of.c   |  238 --------------------------------------
>>   4 files changed, 89 insertions(+), 248 deletions(-)
>>   delete mode 100644 drivers/usb/host/ehci-ppc-of.c
> Please use of_property_read_bool for these.
>
> This driver already handles "via,vt8500-ehci" and "wm,prizm-ehci" which
> aren't documented to handle these properties, but now gain support for
> them. It might be worth unifying the binding documents if there's
> nothing special about those two host controllers.
>
> We seem to have two binding documents for "via,vt8500-ehci", so some
> cleanup is definitely in order.
>
> Tony, you seem to have written both documents judging by 95e9fd10f06c
> and 8ad551d150e3. Do you have any issue with merging both of these into
> a common usb-ehci document?
......
> Cheers,
> Mark.

I'm not sure how we ended up with two bindings for the driver anyway. I 
think this was an error on my part somewhere.

None of the in-tree dts files use "wm,prizm-ehci".

I have no issue with merging all the documentation into a single 
usb-ehci binding.

Regards
Tony Prisk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
