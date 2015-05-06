From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 13:50:29 +0200
Message-ID: <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506092738.GB4508@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

Am 06.05.2015 um 11:27 schrieb Pavel Machek <pavel@ucw.cz>:

> On Wed 2015-05-06 07:19:31, Dr. H. Nikolaus Schaller wrote:
>> Hi Peter,
>>=20
>> Am 05.05.2015 um 21:54 schrieb Peter Hurley <peter@hurleysoftware.co=
m>:
>>=20
>>> Hi Neil,
>>>=20
>>> On 03/18/2015 01:58 AM, NeilBrown wrote:
>>>> here is version 3 of support for tty-slaves.
>>>=20
>>> Is there a v4 of this that I missed?
>>=20
>> We did have a lengthy discussion about [PATCH 3/3] how to best (1)
>> represent the slave device in the device tree but as far as I am con=
cerned,
>> I do not see that we have a consensus (2) and the device tree mainta=
iners
>> have no comments or clear guidelines so far.
>=20
> Yes. Everyone and their dog disagrees

What a wonderful argument=85
I still ask myself who the dog is.

> with Nikolaus, who is playing
> devil's advocate

I hope you don't think that Linux users are devils=85

No, I am not playing devil=92s advocate (which would imply that I am do=
ing this
for fun to tease the dog), but I feel I have to be the advocate of futu=
re board
designers who want to easily import an existing board DT and overwrite =
device
tree nodes to describe design changes, i.e. what slave device is connec=
ted to
which uart.

At least in this regard, the alternatives are really differently easy t=
o handle.

And, the alternatives have some influence how a tty driver and a slave =
device
driver is designed. So that is for me the root question, before discuss=
ing (some)
implementation details.

Because it is not resolved in a way that convinces me (and future board=
 DT
designers), I bring it up again and again. Even if you and some dog app=
arently
disagree.

> here, so we clearly have to get confirmation from
> device tree maintainers. And when they disagree with him, we'll need
> to get concensus from Linus, too...
> 									Pavel

BR,
Nikolaus--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
