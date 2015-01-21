From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Wed, 21 Jan 2015 18:08:34 +0000
Message-ID: <1421863714.14076.103.camel@arm.com>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
	 <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-01-21 at 16:21 +0000, Rob Herring wrote:
> > * Not possible to identify whether a device is shared or not between
> > the secure and non-secure worlds.
> 
> Typically, sharing requires a peripheral to be designed to be shared
> like PL330 or MMU-400. I have seen some h/w with locking registers so
> 2 different cores/OSs can share an i2c bus. You could do something
> like that for Trustzone as well I suppose. That's not really secure,
> but allows shared access. I think it is generally a limited number of
> peripherals which are shared.

Interestingly enough, the most common case for a shared peripheral is a
keypad/keyboard for secure PIN entry. A secure-programmable-only filter
like TZC-400 can be used to change the "designation" of a AXI master
connected to it.

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
