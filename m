From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 RFT 3/5] ARM64: dts: bcm283x: Use dtsi for USB host
 mode
Date: Wed, 07 Sep 2016 12:59:16 +0200
Message-ID: <1473245956.28663.50.camel@redhat.com>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com>
         <1471792204-21908-4-git-send-email-stefan.wahren@i2se.com>
         <bb073ea3-2f89-4fc5-e3af-2e27c54f221e@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bb073ea3-2f89-4fc5-e3af-2e27c54f221e-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mi, 2016-08-31 at 09:59 +0200, Stefan Wahren wrote:
> Hi Gerd,
> 
> Am 21.08.2016 um 17:10 schrieb Stefan Wahren:
> > In case dr_mode isn't passed via DT, the dwc2 driver defaults
> > to OTG mode. But the Raspberry Pi 3 is designed only for host mode.
> > So fix this issue by linking to the dtsi file which set the dr_mode
> > to host.
> 
> this patch is pending and the rest has been merged. Since i don't have a
> RPi 3 it's only compile tested.
> 
> Could you please test it (requires patch 1 and 2 of this series) on your
> RPi 3?

Have a git tree to test?  Patch doesn't apply cleanly (using 4.8-rc5
with eric's for-next branch which already has 1+2), seems to depend on
more device tree changes.

Also usb is working fine for me on the rpi3 even without this, so why is
this needed?  Is dwc2 defaulting to otg mode a recent change?

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
