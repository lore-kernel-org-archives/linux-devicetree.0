From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/4] UART slave device support - version 4
Date: Fri, 28 Aug 2015 11:43:33 +0200
Message-ID: <0579762D-51C2-45F0-A362-EE31215A40E8@goldelico.com>
References: <20150511013540.5709.93626.stgit@notabene.brown> <CACRpkdZf2AM_7Od1kVcBxokK5CJfhnsfZ_oNSF5w7rmZmcenCg@mail.gmail.com> <20150812092059.361e09bc@home.neil.brown.name> <CD86D8CD-20D8-44EF-8245-A3E49C2D3EA7@goldelico.com> <20150828070201.GA23975@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150828070201.GA23975@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, Marek Belisko <marek@goldelico.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

Am 28.08.2015 um 09:02 schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
>=20
>> we (the developers of the hardware) have proposed an alternative
>> approach to Neil=92s implementation - for the same device and solvin=
g
>> the same problem (notifying tty open/close and uart activity to the
>> slave device driver), but differently.
>>=20
>> See:
>> https://lkml.org/lkml/2015/6/28/91
>>=20
>> Discussion has not yet settled on which approach is better. So your
>> opinion of comparing both is welcome.
>=20
> Actually, yes, discussion has settled, agreeing that phandle referenc=
e
> for the uart is a bad idea, Nikolaus just refuses to listen to anyone=
,

no, I only refuse to listen to you.

You are neither maintainer for any subsystem that is involved nor have
you contributed technical arguments pro/con and it appears to me that
you refuse to listen to my argumentation.

> asking "device tree maintainer opinion", and then just simply ignorin=
g
> it when he does not like it, and then making promises he did not keep=
=2E


Which promises did I not keep? Please be specific, instead of insulting=
=2E

I bring up this alternative again, since I get the impression that most=
 readers
are simply not aware of *both* alternative proposals.

> Please don't stall patches just because of that.

Please provide better arguments and don=92t spread FUD.

Please have a look into our RFC implementation and study it carefully
to learn why it is the better (IMHO more flexible, easier to maintain, =
more
modular) approach. Even if you don=92t like phandles.

>=20
> Best regards,
> 									Pavel
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/hors=
es/blog.html


BR,
Nikolaus
