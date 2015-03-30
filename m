From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: BCM5301X: Add /device_id property including
 device ID string
Date: Mon, 30 Mar 2015 11:58:29 +0100
Message-ID: <20150330105828.GE17971@leverpostej>
References: <1427667288-23903-1-git-send-email-zajec5@gmail.com>
 <20150330103659.GD17971@leverpostej>
 <CACna6rykQq6AVSWzJh3qnHVNzPXbTD9TMGQf9D9p50pcbQkmng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6rykQq6AVSWzJh3qnHVNzPXbTD9TMGQf9D9p50pcbQkmng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > On Sun, Mar 29, 2015 at 11:14:48PM +0100, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> >> Device vendors often assign IDs to their devices to allow comparin=
g
> >> firmware image with device model. This is required to prevent user=
s
> >> from flashing incompatible image and soft-bricking device.
> >> Add device_id property to DTs to allow user space (and optionally
> >> bootloader) verifying firmware images.
> >
> > This sounds like exactly what the "model" property is meant to be (=
per
> > ePAPR) -- a string that specifices the manufacturer's model number =
of
> > the device, ideally in "manufacturer,model" format.
>=20
> What if manufacturer decided to use some totally unfriendly ID for
> their low-level (firmware upgrade) model identification? I can't
> really see us using
> model =3D "U12H245T00_NETGEAR"
> which would mean nothing compared to the current friendly:
> model =3D "Netgear R6250 V1 (BCM4708)"

If it uniquely identifies the model, it's fit to be a model string. If
being "friendly" means that we lose that, then the property is useless
anyway.

Note that both examples above deviate from the recommended format, and
something like: "netgear,U12H245T00" would better align with the
recommendation.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
