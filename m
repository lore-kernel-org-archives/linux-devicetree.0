From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: BCM2836: Add io map initialization for bcm2836.
Date: Tue, 21 Apr 2015 23:11:33 +0200
Message-ID: <60195891.q3RtUhgfkn@wuerfel>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <6559239.zHhRM8VZWD@wuerfel> <87oamh9q12.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87oamh9q12.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 21 April 2015 13:37:13 Eric Anholt wrote:
> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
> 
> > On Tuesday 21 April 2015 11:09:52 Eric Anholt wrote:
> >> +static struct map_desc bcm2836_io_map __initdata = {
> >> +       .virtual = BCM2835_PERIPH_VIRT,
> >> +       .pfn = __phys_to_pfn(BCM2836_PERIPH_PHYS),
> >> +       .length = BCM2835_PERIPH_SIZE,
> >> +       .type = MT_DEVICE
> >> +};
> >> +
> >>  static void __init bcm2835_map_io(void)
> >>  {
> >> -       iotable_init(&io_map, 1);
> >> +       iotable_init(&bcm2835_io_map, 1);
> >> +}
> >> +
> >> +static void __init bcm2836_map_io(void)
> >> +{
> >> +       iotable_init(&bcm2836_io_map, 1);
> >>  }
> >> 
> >
> > Can you explain what this is needed for? Most platform ports don't
> > do this any more.
> 
> Nope, I can't!  I'm not sure what the bcm2835 side of it does, and I was
> just replicating that for 2836.
> 
> Should it be removed from 2835, too?
> 

Hard to know. Does anything reference BCM2835_PERIPH_VIRT? Does it work
if you remove it?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
