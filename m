From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix fifo size for EP 6,7
Date: Thu, 16 Nov 2017 23:33:52 +0100 (CET)
Message-ID: <2056429546.196128.1510871632211@email.1und1.de>
References: <1507371414-21688-1-git-send-email-stefan.wahren@i2se.com>
 <160210128.18582.1509137904239@email.1und1.de> <871slkw3ms.fsf@anholt.net>
 <1506055926.93787.1509439381859@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506055926.93787.1509439381859-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Minas Harutyunyan <Minas.Harutyunyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 31. Oktober 2017 um 09:43 geschrieben:
> 
> 
> Hi Eric,
> 
> > Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> hat am 31. Oktober 2017 um 01:40 geschrieben:
> > 
> > 
> > Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> > 
> > >> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 7. Oktober 2017 um 12:16 geschrieben:
> > >> 
> > >> 
> > >> In case the RPi Zero has at least a device connected to the OTG port
> > >> at boot time, the upper limit of tx fifo size for endpoint 6 and 7 is
> > >> also reduced to 512 bytes. So fix this accordingly.
> > >> 
> > >> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> > >> Fixes: 1aa1d858f582 ("ARM: dts: bcm283x: Add dtsi for OTG mode")
> > >
> > > gentle ping ...
> > 
> > I've tried to make sense of this a couple of times, but I don't get it:
> > why does EP 6/7 get reduced to 512 bytes in this case?
> 
> i cannot give you an answer for this specific case.
> 
> Since the dwc2 databook isn't public, i started a thread on linux-usb [1] about proper fifo size configuration. But i didn't get any reply.
> 
> The problem here is there different contraints:
> * the sum of all fifo values must not exceed 3776 bytes
> * each slot have its individual upper limit (available in the BCM2835 datasheet)
> 
> During my tests for OTG mode i missed the specific case above. Now my determined limits of 512 for EP 6 and 7 are contrary to the BCM2835 datasheet. Maybe the Synopsys guys have an answer?
> 
> Btw the values in the downstream tree also violate the contraints. 
> 
> [1] - https://www.spinics.net/lists/linux-usb/msg157200.html

still concerns about this patch, because it's not included in dt-fixes?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
