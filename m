From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 18:12:34 +0200
Message-ID: <C68A105A-7147-4143-9B91-1A239726A780@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <20150506142849.GA14839@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506142849.GA14839@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

Am 06.05.2015 um 16:28 schrieb Pavel Machek <pavel@ucw.cz>:

> On Wed 2015-05-06 13:50:29, Dr. H. Nikolaus Schaller wrote:
>> Hi Pavel,
>>=20
>> Am 06.05.2015 um 11:27 schrieb Pavel Machek <pavel@ucw.cz>:
>>=20
>>> On Wed 2015-05-06 07:19:31, Dr. H. Nikolaus Schaller wrote:
>>>> Hi Peter,
>>>>=20
>>>> Am 05.05.2015 um 21:54 schrieb Peter Hurley <peter@hurleysoftware.=
com>:
>>>>=20
>>>>> Hi Neil,
>>>>>=20
>>>>> On 03/18/2015 01:58 AM, NeilBrown wrote:
>>>>>> here is version 3 of support for tty-slaves.
>>>>>=20
>>>>> Is there a v4 of this that I missed?
>>>>=20
>>>> We did have a lengthy discussion about [PATCH 3/3] how to best (1)
>>>> represent the slave device in the device tree but as far as I am c=
oncerned,
>>>> I do not see that we have a consensus (2) and the device tree main=
tainers
>>>> have no comments or clear guidelines so far.
>>>=20
>>> Yes. Everyone and their dog disagrees
>>=20
>> What a wonderful argument=85
>> I still ask myself who the dog is.
>=20
> Ok, so now device tree maintainers spoke and told you, you are wrong,

did they already say that and have more convincing arguments? So far I =
have
always identified a flaw in the argumentation or a contradiction with p=
ractice
(e.g. busses are usually addressable, McBSP and PHY do uses phandle and
not subnodes).

> and you still argue?

And as long as I think the others are still wrong (focussed to see and =
model
UART like a =93bus=94), I tell them and explain my arguments where and =
why I
disagree with what they say or propose.

Especially if I feel that their arguments are not technically convincin=
g (me).

Although all this is less about technical solutions but design principl=
es:
what makes a good DT design.

Well, Linux will survive with any solution, but what are you interested=
 in?

Users/contributors who keep quiet and accept a bad solution or those
who argue for a (initially in their opinion) better one?

Or stop as soon as Pavel says to do so?


> You'll only attrack more "wonderful" arguments
> that way.

None was =93wonderful=94. They were valid concerns about my proposal
and I have replied to them how I see it.

Generally, if you are not interested in people dedicated and committed =
to
fight for the better solution with (technical) arguments and concrete p=
roposals
how it should be in their opinion, then please just tell and I will shu=
t up.
But only then.

Or if some DT maintainer makes a decision and says: I have listened and
understood all arguments pro and con and I decide this or that way (pre=
ferrably
with giving reasons of decision as a guidance for similar problems in t=
he future).

Then we all can go to implementation.

BR,
Nikolaus
