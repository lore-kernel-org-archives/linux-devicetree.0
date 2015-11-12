From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 10:01:54 +0100
Message-ID: <20151112090154.GG24008@pengutronix.de>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
 <CAH6sp9OhB3y=0GazcL5Lj-C5z-pRerncQ_KQM0xpP3nmAqF_gw@mail.gmail.com>
 <20151112082617.GE24008@pengutronix.de>
 <CAH6sp9PyGqxn6gaes=SPinXmqK5ySLax-3KZ3uu=6Y4_Uc+d5A@mail.gmail.com>
 <20151112085312.GF24008@pengutronix.de>
 <CAH6sp9MX25TX2n6F7EcC1y=xmvffhkpO488xWHy6QXjsBM2VHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAH6sp9MX25TX2n6F7EcC1y=xmvffhkpO488xWHy6QXjsBM2VHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frans Klaver <fransklaver@gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, baruch@tkos.co.il, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>, Luis de Bethencourt <luis@debethencourt.com>, kernel@pengutronix.de, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 12, 2015 at 09:57:07AM +0100, Frans Klaver wrote:
> On Thu, Nov 12, 2015 at 9:53 AM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > CC +=3D devicetree@vger.kernel.org, gregkh
>=20
> You added linux@pengutronix instead of devicetree.

Well I substituted Sascha by kernel@pengutronix.de on purpose, but
considered that too unimportant for the outer world :-) But I really
forgot devicetree@vger.kernel.org. Added now.

> > On Thu, Nov 12, 2015 at 09:36:55AM +0100, Frans Klaver wrote:
> >> On Thu, Nov 12, 2015 at 9:26 AM, Uwe Kleine-K=F6nig
> >> <u.kleine-koenig@pengutronix.de> wrote:
> >> > On Thu, Nov 12, 2015 at 09:03:11AM +0100, Frans Klaver wrote:
> >> >> Hi,
> >> >>
> >> >> On Thu, Nov 12, 2015 at 8:46 AM, LABBE Corentin
> >> >> <clabbe.montjoie@gmail.com> wrote:
> >> >> > of_match_device could return NULL, and so cause a NULL pointe=
r
> >> >> > dereference later.
> >> >>
> >> >> Did you actually run into this? It seems to me that this driver=
 is
> >> >> only probed if and only if we have a match and that therefore
> >> >> of_match_device will always return a valid pointer (it is using=
 the
> >> >> same match table). Am I missing something?
> >> >
> >> > Yes, you're missing something. The driver would probe for a dt s=
nippet
> >> > like:
> >> >
> >> >         mxc_nand {
> >> >                 compatible =3D "foobar";
> >> >         }
> >> >
> >> > In this case dev->of_node is non-NULL but of_match_device(mxcnd_=
dt_ids,
> >> > dev) is.
> >> >
> >> > (I didn't actually test this, so there is a chance I'm wrong her=
e. And
> >> > if not I wonder if it is sensible at all to match the device nam=
e on
> >> > driver name for of-created platform devices.)
> >>
> >> Yea, looks like you're right. platform devices check a number of
> >> things to determine a match, among which is driver name if all els=
e
> >> fails (platform.c, platform_match()).
> >
> > Maybe something like this would help to reduce surprises:
> >
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index f80aaaf9f610..a9fc22c86552 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -840,8 +840,8 @@ static int platform_match(struct device *dev, s=
truct device_driver *drv)
> >                 return !strcmp(pdev->driver_override, drv->name);
> >
> >         /* Attempt an OF style match first */
> > -       if (of_driver_match_device(dev, drv))
> > -               return 1;
> > +       if (pdev->dev.of_node)
> > +               return of_driver_match_device(dev, drv);
> >
> >         /* Then try ACPI style match */
> >         if (acpi_driver_match_device(dev, drv))
>=20
> That looks sensible, yea. There is a chance that misbehaving DT nodes
> will fail after this change, of course.

Which is ok if this behaviour is considered a misbehave :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
