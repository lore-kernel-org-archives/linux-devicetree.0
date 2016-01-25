From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add a fall-back Raspberry Pi tree
Date: Mon, 25 Jan 2016 14:32:48 -0700
Message-ID: <56A69480.6050604@wwwdotorg.org>
References: <1453754394-3639-1-git-send-email-lkundrak@v3.sk>
 <56A68BBF.4060405@wwwdotorg.org> <1453756150.9375.18.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453756150.9375.18.camel-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/25/2016 02:09 PM, Lubomir Rintel wrote:
> On Mon, 2016-01-25 at 13:55 -0700, Stephen Warren wrote:
>> On 01/25/2016 01:39 PM, Lubomir Rintel wrote:
>>> U-Boot falls back to "bcm2835-rpi-other.dtb" for boards of unknown
>>> identification. Let's do a bare minimum for them so that they at leat
>>> boot.
>>>
>>> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>> ---
>>>    arch/arm/boot/dts/Makefile              | 1 +
>>>    arch/arm/boot/dts/bcm2835-rpi-other.dts | 7 +++++++
>>
>> This DT shouldn't ever be used, except when a new unidentified board
>> appears. In that case, I believe the correct solution is to add support
>> for that new board to U-Boot and the kernel, rather than add fall-backs.
>> Prior to that being done, a user can always copy whichever DT they want
>> into filename bcm2835-rpi-other.dts for temporary testing/development,
>> if they have reason to believe their new model is compatible with
>> something else. In general, I don't think we have any reason to believe
>> that even this new minimal DT is guaranteed to be compatible with any
>> possible future hardware, so it seems a little risky to ship this file
>> in anticipation.
>
> Fair enough. It just frustrates me a bit that the chance of mainline
> working on a new or even older RPi board is not as good as I'd like to.
> I guess I could perhaps get a bit better at quickly submitting the
> device tree instead of cheap hacks then.
>
> By the way, I've seen you add an entry for the Zero board to U-Boot and
> was thinking that you perhaps had a device tree for it? Do you plan to
> include that one into mainline Linux, or do you keep your dts
> elsewhere? Should I go ahead and submit one?

I'm not sure if I booted Linux on it. I probably did, and simply 
manually copied one of the other DTs (model A or A+ I would guess) to 
bcm2835-rpi-zero.dtb on my SD card to make it work.

> Also, the Model B entries in U-Boot version table seems incorrect to me
> (sent a separate message to U-Boot list, but it got caught in
> moderation now). I'm wondering what's the authoritative source for the
> version information? Did you get the version numbers from the actual
> hardware or is some documentation available?

The information was derived from the various web pages listed in 
comments in board/raspberrypi/rpi/rpi.c. There may have been one or two 
entries contributed by other people; I don't know where that information 
came from. Most model numbers (for entries I added at least) are 
verified on real HW (yes, I have about 8 Pis.). I think I assigned the 
model strings/names myself in general, using names that seemed 
reasonably descriptive.

It would be nice if the Pi Foundation published a single 
up-to-date/complete definitive list, but I haven't seen such a thing; 
everyone seems to be reverse-engineering it based on seeing models in 
the wild or cribbing from bits of other GPIO-related SW projects:-(
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
