From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Date: Mon, 18 May 2015 08:42:07 -0600
Message-ID: <5559FA3F.3020106@wwwdotorg.org>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com> <5554DF5E.4020802@wwwdotorg.org> <CAMuHMdW6bDjEx+EkqLQmGCZTap-77w2wWiHpra+2pLPexwAWPw@mail.gmail.com> <20150515200253.GM11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150515200253.GM11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/15/2015 02:02 PM, Brian Norris wrote:
> On Thu, May 14, 2015 at 10:26:41PM +0200, Geert Uytterhoeven wrote:
>> On Thu, May 14, 2015 at 7:46 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>> On 05/14/2015 11:32 AM, Brian Norris wrote:
>>>> In commit 8ff16cf77ce3 ("Documentation: devicetree: m25p80: add
>>>> "nor-jedec"
>>>> binding"), we added a generic "nor-jedec" binding to catch all
>>>> mostly-compatible SPI NOR flash which can be detected via the READ ID
>>>> opcode (0x9F). This was discussed and reviewed at the time, however
>>>> objections have come up since then as part of this discussion:
>>>>
>>>>     http://lkml.kernel.org/g/20150511224646.GJ32500@ld-irv-0074
>>>>
>>>> It seems the parties involved agree that "jedec,spi-nor" does a better
>>>> job of capturing the fact that this is SPI-specific, not just any NOR
>>>> flash.
>>>>
>>>> This binding was only merged for v4.1-rc1, so it's still OK to change
>>>> the naming.
>>>>
>>>> At the same time, let's move the documentation to a better name.
>>>>
>>>> Next up: prune the m25p_ids[] table to the minimal necessary listing, so
>>>> we can stop referring to code (drivers/mtd/devices/m25p80.c) from the
>>>> documentation.
>>>
>>> There's no need to change the code to update the documentation. Simply paste
>>> the list of valid device IDs into the documentation. The binding
>>> documentation needs to be completely standalone anyway. Binding
>>> documentation should never refer to Linux driver code as part of their
>>> definition.
>
> Of course they shouldn't refer to the driver. That's the main point of
> my comment. But just because the ID made its way into the driver doesn't
> mean it's always a useful or necessary DT binding. More below.

Yes and no.

DT ABI requires that any old DT that worked with an old kernel must 
continue to work with a new kernel. Thus, any compatible value that was 
used in an old DT must be supported by any new kernel, and be documented 
in the binding so that any new driver (e.g. for a new OS) knows to 
support that same compatible values. Since it's quite possible that 
people have DTs that aren't checked into the kernel, we must use the set 
of compatible values that any old driver supports as the list of 
compatible values to keep supporting and documenting.

Of course, if the driver had separate lists of supported devices for the 
SPI-specific and DT-based instantiation methods, the set of supported 
compatible values could have been quite small. Unfortunately both I2C 
and SPI (at least) took shortcuts and allowed DT compatible values to be 
transformed to remove the vendor ID and match against the I2C/SPI device 
lists.

Hence we do in fact have to document and continue to support every 
single device type this driver supports.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
