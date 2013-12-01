From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 2/2] rtc: add hym8563 rtc-driver
Date: Sun, 1 Dec 2013 18:19:25 +0100
Message-ID: <201312011819.26005.heiko@sntech.de>
References: <201312011437.47432.heiko@sntech.de> <201312011439.45417.heiko@sntech.de> <CAFLxGvz6ZYHaDJqc6LPwtPsLUaLuEwSEQaJLZ-hV1m8PxruOow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFLxGvz6ZYHaDJqc6LPwtPsLUaLuEwSEQaJLZ-hV1m8PxruOow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, LKML <linux-kernel@vger.kernel.org>, rtc-linux@googlegroups.com, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 1. Dezember 2013, 15:38:40 schrieb Richard Weinberger:
> On Sun, Dec 1, 2013 at 2:39 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:
> > +static int hym8563_probe(struct i2c_client *client,
> > +                        const struct i2c_device_id *id)
> > +{
> > +       struct hym8563 *hym8563;
> > +       int ret, gpio_int;
> > +
> > +       hym8563 =3D devm_kzalloc(&client->dev, sizeof(hym8563),
> > GFP_KERNEL);
>=20
> Shouldn't this be sizeof(*hym8563)?

you're right of course, thanks for catching the missing "*", I'll send =
a v3=20
shortly.


Heiko
