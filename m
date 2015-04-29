From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Wed, 29 Apr 2015 08:56:25 +0200
Message-ID: <24842662-A869-4A0E-B75F-ACC0AA6BAB51@goldelico.com>
References: <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325014543.GA967@earth> <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com> <20150325152110.GA7903@earth> <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com> <20150326180805.GA562@earth> <06BFF79C-F9FC-441D-BA41-7209219A912E@goldelico.com> <20150327163108.GA5089@earth> <983B007F-6DC4-4333-B383-E387E2E55AE2@goldelico.com> <20150427203542.GB29351@xo-6d-61-c0.localdomain>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150427203542.GB29351@xo-6d-61-c0.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>, NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

Am 27.04.2015 um 22:35 schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
>=20
>>> In my opinion making something a node in / is always the
>>> last resort and in my perspective it has been handled in such a way
>>> so far.
>>=20
>> But that contradicts some documents I have found and linked. Please
>> show me a document about DT that supports your view.
>>=20
>> I agree that both views can be valid, but in lack of some ?official?=
 guideline
>> we can?t decide ourselves.
>=20
> This is not how kernel development works.
>=20
> We can decide ourselves, and DT people will swear at us if we decide =
wrongly,
> and then Linus swears at them if they do too obvious mistakes.
>=20
> Lets KISS.

some time ago you also wrote in this thread:

> Device tree is not operating system specific.=20

In other words: this is a discussion about compatibility with the world=
 outside of Linux.
And compatibility can not be achieved by decisions about Linux implemen=
tation details,
even if Linus is deciding. He can just decide to stay incompatible (but=
 then it should
IMHO be a general decision and not case specific).

So I think we should follow some basic design principles, if they exist=
 (which I don=92t know),
to have this compatibility. And then adapt the Linux implementation (us=
ing the KISS principle).

Anyways I have not yet seen any comment from the DT people or did I mis=
s them?

BR,
Nikolaus
