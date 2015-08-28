From: Christ van Willegen <cvwillegen@gmail.com>
Subject: Re: [Gta04-owner] [PATCH 0/4] UART slave device support - version 4
Date: Fri, 28 Aug 2015 22:04:23 +0200
Message-ID: <CA+Ot1Oys=NRi0Po2zNVwzJ=nUBEn6mWncZKLfuDKu4AymXsY-g@mail.gmail.com>
References: <20150511013540.5709.93626.stgit@notabene.brown>
 <CACRpkdZf2AM_7Od1kVcBxokK5CJfhnsfZ_oNSF5w7rmZmcenCg@mail.gmail.com>
 <20150812092059.361e09bc@home.neil.brown.name> <CD86D8CD-20D8-44EF-8245-A3E49C2D3EA7@goldelico.com>
 <20150828070201.GA23975@amd> <0579762D-51C2-45F0-A362-EE31215A40E8@goldelico.com>
 <20150828110436.GA6857@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150828110436.GA6857@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sre@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Marek Belisko <marek@goldelico.com>, Jiri Slaby <jslaby@suse.cz>
List-Id: devicetree@vger.kernel.org

Hi all,

I will reverse a part of this e-mail to make replying easier.

On Fri, Aug 28, 2015 at 1:04 PM, Pavel Machek <pavel@ucw.cz> wrote:
>> Please have a look into our RFC implementation and study it carefull=
y
>> to learn why it is the better (IMHO more flexible, easier to maintai=
n, more
>> modular) approach. Even if you don=E2=80=99t like phandles.
>
> It was also NAKed by device tree maintainers.

This may be true, I can't recall those specific mails...

> You promised to shut up.

But this is uncalled for.

IIRC there was, indeed, a long technical discussion about how to
connect the Bluetooth chip to the 'UART'.

I've seen Neil patches, and I've seen patches by Nikolaus.

Both appear to have their problems. I think it's fair to:

- Listen carefully to all arguments.
- Have a benevolent dictator, which we have, look into the problem
- Only 'shut up' after a thorough technical analysis has been made
about both approaches to the problem.

Both may have their merit in a number of ways. Don't just close your
eyes, put your fingers in your ears and say 'I can't hear you!'. We
are all adults, or at least, we should be in behaviour. The Linux
system has grown so much _beacuse_ of people working together. Calling
each other names and exiling them will _not_ solve the problem.

Christ van Willegen
--=20
09 F9 11 02 9D 74 E3 5B D8 41 56 C5 63 56 88 C0
