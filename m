From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add Raspberry Pi Zero
Date: Wed, 20 Jul 2016 23:12:17 +0200 (CEST)
Message-ID: <182687649.301236.37df541a-c292-4f81-b3d7-fcea47416b49.open-xchange@email.1und1.de>
References: <1454571546-25481-1-git-send-email-lkundrak@v3.sk>
 <27632472.326220.2e5ba31c-16b8-46a6-a38b-8aa5236ec996.open-xchange@email.1und1.de>
 <878tww6r0v.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878tww6r0v.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> hat am 20. Juli 2016 um 21:36 geschrieben:
> 
> 
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> 
> > Hi Lubomir,
> >
> >> Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> hat am 4. Februar 2016 um 08:39
> >> geschrieben:
> >> 
> >> 
> >> Notable difference from the other Raspberry Pi boards is the lack of PWR
> >> LED.
> >> 
> >> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> >
> > do you have any plans to submit a V2 of this patch or should i take over?
> 
> It's been a while, so I'd love if you picked it up and resubmitted with
> the LED changes.

i also want to take care of those dwc2 warnings, which might need some
additional DT settings:

dwc2 20980000.usb: 256 invalid for host_nperio_tx_fifo_size. Check HW
configuration.
dwc2 20980000.usb: 512 invalid for host_perio_tx_fifo_size. Check HW
configuration.
dwc2 20980000.usb: Specified GNPTXFDEP=1024 > 32

What LED change do you expect?

Lubomir's suggestion is HIGH_ACTIVE which is more userfriendly because of the
missing PWR LED.
Changing to LOW_ACTIVE would be more stringent according to all the other RPis.

Btw the DTS for the RPi Zero has been dropped in downstream.

Regards
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
