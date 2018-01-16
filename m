From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM: bcm2835: sync firmware properties with
 downstream
Date: Tue, 16 Jan 2018 12:49:04 +0200
Message-ID: <20180116104904.fsebsozoa4xysbz7@tarshish>
References: <cover.1515698418.git.baruch@tkos.co.il>
 <e68675d54955c754ebe8ffc2491585fde5b396bc.1515698418.git.baruch@tkos.co.il>
 <1991337128.42939.1515837465503@email.1und1.de>
 <CACRpkdZ_g3-jR-7pOnS9MwpHprfEz8acB9SWcMLyoOVcB0iLvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_g3-jR-7pOnS9MwpHprfEz8acB9SWcMLyoOVcB0iLvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>, linux-rpi-kernel <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Tue, Jan 16, 2018 at 10:57:32AM +0100, Linus Walleij wrote:
> On Sat, Jan 13, 2018 at 10:57 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> >> Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 11. Januar 2018 um 20:44 geschrieben:
> >>
> >> Add latest firmware property tags from the latest Raspberry Pi downstream
> >> kernel. This is needed for the GPIO tags, so we can control the GPIO
> >> multiplexor lines.
> >>
> >> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> >
> > Acked-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> >
> > Maybe this is obvious, but patch #3 depends on this change so no cherry-picking allowed.
> 
> I will save this for after the merge window as it feels now.
> 
> But as far as I have the right ACKs I can put it in the GPIO tree.
> 
> Baruch: can you resend the series with all ACKs and push me
> to apply it all in the GPIO tree if you're fine with this approach?

I plan to send another revision of this series later today to address Stefan's 
comments on this one. Once Stefan and/or Eric ack the entire series, I'm fine 
with you taking it through the GPIO tree if it is OK with the BCM2835 
maintainers.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
