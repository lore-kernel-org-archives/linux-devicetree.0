From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add EHCI and OHCI drivers for STi SoC's
Date: Thu, 7 Aug 2014 15:47:10 +0100
Message-ID: <20140807144710.GD12137@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org>
 <201408062318.28958.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201408062318.28958.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for reviewing, see my comments below: -

> > Changes since v2:
> >  - Based on Arnd Berghman feedback, split out into 2 devices / drivers
> >  - Base drivers oh ehci-platform.c & ohci-platform.c with required extensions
> >    to allow possible re-merge in the furture.
> 
> Hi Peter,
> 
> This looks much better than the first version. I have some remaining comments for
> how it could be simplified a bit more.

Yes I think I've addressed these now in V4, which I will send in a moment.

> 
> The way that you deal with the 48mhz clock seems like it should fit in well
> with the generic driver, just like all the rest (once the usb-st-common
> stuff is moved into the ohci/ehci drivers), so the alternative would be
> to make it all generic now.

Yes I tried to do it in a way which would, however I would prefer not to merge into 
the generic one for now because: -

1) There are some other subtle changes versus the generic drivers. For example in power_on() and power_off()
I put the IP into reset and power down, which isn't done in the generic driver. Also with this IP it needs 
power signal asserted before reset, otherwise it can hang the chip.

2) I don't have any of the other hardware which uses ehci-platform / ohci-platform to test 
I haven't broken things.

regards,

Peter.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
