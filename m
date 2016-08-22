From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH V3 2/5] ARM: dts: bcm283x: Add dtsi for USB host mode
Date: Mon, 22 Aug 2016 22:18:15 +0200 (CEST)
Message-ID: <533983163.19485.709cd5b7-97dd-4dda-9392-7c46ec5e192c.open-xchange@email.1und1.de>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com>
 <1471792204-21908-3-git-send-email-stefan.wahren@i2se.com>
 <87fupw4rgm.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fupw4rgm.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> hat am 22. August 2016 um 19:57 geschrieben:
> 
> 
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> 
> > In case dr_mode isn't passed via DT, the dwc2 defaults to OTG mode.
> > But all Raspberry Pi boards here are designed only for host mode.
> > So fix this issue by providing a dtsi file which set the dr_mode
> > to host.
> 
> Can you explain what change this should cause for these boards?  Is it
> just going to drop this message from dmesg:
> 
> dwc2 3f980000.usb: Configuration mismatch. dr_mode forced to host

IMO it isn't a message which could be ignored. The dwc2 tries to detected the
USB role from compile configuration and hardware capabilities, but according to
the decision table [1] we should provide the correct dr_mode which is import for
FIFO configuration and so on.

Another problem that i see is that the USB behavior is influenced by compile
settings in a unexpected way. With arm/configs/bcm2835_defconfig the driver is
forced to host, but in a multiplatform config like arm64/configs/defconfig not.
I would expect a more stable dr_mode.

At the end the dwc2 can't reliable detect the dr_mode because it depends on the
board design.

Any concerns?

Stefan

[1] -
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=5268ed9d2e3b52f703f3661eef14cecbb2b572d4

> 
> or something else?
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
