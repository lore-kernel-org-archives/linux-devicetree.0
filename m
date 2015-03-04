From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 07/10] usb: Make sure that DWC2 initializes after the power channel mailbox driver.
Date: Wed, 04 Mar 2015 10:50:35 +0100
Message-ID: <2889752.U8cUum3Crf@wuerfel>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <20150303083250.GG6976@x1> <54F67944.1030501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F67944.1030501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 03 March 2015 20:17:24 Stephen Warren wrote:
> On 03/03/2015 01:32 AM, Lee Jones wrote:
> > On Mon, 02 Mar 2015, Eric Anholt wrote:
> >> This gets USB working on the Raspberry Pi without relying on U-Boot to
> >> send the power message for us.  Without it, you would get warnings
> >> about fifo sizes and "dwc2_core_reset() HANG! Soft Reset
> >> GRSTCTL=80000001" leading to a failed probe.
> 
> >> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> 
> >> +bool bcm2835_usb_power_enabled(void)
> >> +{
> >> +#ifdef CONFIG_BCM2835_MBOX
> > 
> > Please don't put #ifdeffery in *.c files.  If you have to match on
> > CONFIG_* options, please do so using inlines in a header file
> > somewhere.
> 
> I haven't heard of that restriction before. I'm sure there are many
> ifdefs in C files in the kernel. What benefit does moving the ifdefs
> into headers have?
> 

It's the common convention.

However, I don't think this should depend on the specific mailbox
implementation at all. The whole point of the mailbox abstraction is
to shield the drivers from the details, and you can rely on the
right mailbox driver being used based on the phandle that is used
in the dt.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
