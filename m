From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Wed, 3 Jan 2018 21:17:28 +0100 (CET)
Message-ID: <804535329.243555.1515010649018@email.1und1.de>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <a29df633ee568e150c150debde66c0783a57c70a.1514898134.git.baruch@tkos.co.il>
 <1524381852.182115.1514919793281@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1524381852.182115.1514919793281-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 2. Januar 2018 um 20:03 geschrieben:
> 
> 
> Hi Baruch,
> 
> > Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 2. Januar 2018 um 14:19 geschrieben:
> 
> > +		expgpio: expgpio {
> > +			compatible = "brcm,bcm2835-expgpio";
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			firmware = <&firmware>;
> 
> Please add the gpio-line-names from Eric's patch [1].
> 
> Thanks
> Stefan
> 
> [1] - https://patchwork.kernel.org/patch/9339857/
> 

sorry i missed the fact that the same GPIO expander is on the CM3. So please move the exgpio node to bcm2837.dtsi and only define the gpio-line-names in this file.

Thanks
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
