From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6ul: add support for Ka-Ro electronics
 TXUL modules
Date: Wed, 13 Jan 2016 12:36:28 +0100
Message-ID: <20160113123628.303ef0d6@ipc1.ka-ro>
References: <1452621710-15336-1-git-send-email-LW@KARO-electronics.de>
	<1452621710-15336-2-git-send-email-LW@KARO-electronics.de>
	<1452621710-15336-3-git-send-email-LW@KARO-electronics.de>
	<CAOMZO5Dhho3whg8p0t6FARG8vyU158mFc7d8BHxThjojm-dcQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Dhho3whg8p0t6FARG8vyU158mFc7d8BHxThjojm-dcQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> On Tue, Jan 12, 2016 at 4:01 PM, Lothar Wa=C3=9Fmann <LW@karo-electro=
nics.de> wrote:
>=20
> > +               spi@0 {
> > +                       compatible =3D "spidev";
> > +                       reg =3D <0>;
> > +                       spi-max-frequency =3D <54000000>;
> > +               };
> > +
> > +               spi@1 {
> > +                       compatible =3D "spidev";
> > +                       reg =3D <1>;
> > +                       spi-max-frequency =3D <54000000>;
> > +               };
> > +       };
>=20
> If you leave the spidev node, the spi core will complain loudly about=
 it.
>
I know. But this gives the opportunity to test the SPI interface
without any bogus chip definitions.


Lothar Wa=C3=9Fmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
