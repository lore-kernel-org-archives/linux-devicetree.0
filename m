From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [rtc-linux] [PATCH v3 1/2] dt-bindings: add hym8563 binding
Date: Sat, 7 Dec 2013 14:46:11 +0100
Message-ID: <201312071446.11997.heiko@sntech.de>
References: <201312012047.02299.heiko@sntech.de> <201312012047.42669.heiko@sntech.de> <20131202134110.GH27568@sirena.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131202134110.GH27568@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Richard Weinberger <richard.weinberger@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am Montag, 2. Dezember 2013, 14:41:10 schrieb Mark Brown:
> On Sun, Dec 01, 2013 at 08:47:42PM +0100, Heiko St=FCbner wrote:
> > +Required properties:
> > +- compatible: should be: "haoyu,hym8563"
> > +- reg: i2c address
> > +- gpios: alarm interrupt gpio
>=20
> Why is this specified as a GPIO and not as an interrupt?

sorry for the late reply, but it seems I got somehow droppen from your=20
recipient list, so just found this mail on the mailinglist.

In v1 I specified the interrupt and the gpio. Apart from the resulting=20
duplication of information this also resulted in the gpio only being re=
quested=20
but never used itself, which Mark Rutland did not seem to like this muc=
h :-) .

As I'd like to keep the sanity check that really requesting the interru=
pt gpio=20
provides I did go this way, as the interrupt pin of the chip is of cour=
se=20
always provided thru a gpio. As there are other drivers going this rout=
e it=20
looked like an ok way to go.


So what would be the real way to go? Specify only the interrupt, only t=
he gpio=20
or both?


Heiko
