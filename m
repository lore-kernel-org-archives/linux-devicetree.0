From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Thu, 7 May 2015 18:57:46 +0200
Message-ID: <160D57E1-D25F-4382-80E7-195C1921DABC@goldelico.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com> <554B7716.3080504@hurleysoftware.com> <05A9A4F3-79E8-48B1-B7EC-2C43E9643620@goldelico.com> <554B9056.4090904@hurleysoftware.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554B9056.4090904@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 07.05.2015 um 18:18 schrieb Peter Hurley <peter@hurleysoftware.com>:

> On 05/07/2015 11:11 AM, Dr. H. Nikolaus Schaller wrote:
>>=20
>> Am 07.05.2015 um 16:30 schrieb Peter Hurley <peter@hurleysoftware.co=
m>:
>>=20
>>> On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:
>>>> Am 06.05.2015 um 19:18 schrieb Mark Rutland <mark.rutland@arm.com>=
:
>>>>> On Wed, May 06, 2015 at 05:09:20PM +0100, Dr. H. Nikolaus Schalle=
r wrote:
>>>>>> Am 06.05.2015 um 16:15 schrieb Mark Rutland <mark.rutland@arm.co=
m>:
>>>>>>=20
>>>>>>>>>>>> No, I am not playing devil=92s advocate (which would imply=
 that I am doing this
>>>>>>>>>>>> for fun to tease the dog), but I feel I have to be the adv=
ocate of future board
>>>>>>>>>>>> designers who want to easily import an existing board DT a=
nd overwrite device
>>>>>>>>>>>> tree nodes to describe design changes, i.e. what slave dev=
ice is connected to
>>>>>>>>>>>> which uart.
>>>>>>>=20
>>>>>>> [...]
>>>>>>>=20
>>>>>>>>> If this happens, you can move the slave device into a fragmen=
t that you
>>>>>>>>> can include under the correct node. That's trivial.
>>>>>>>>=20
>>>>>>>> But less readable. And that is important as well.
>>>>>>>=20
>>>>>>> I disagree. The manipulation you have to perform to override pr=
operties
>>>>>>> is at least as bad as including a file.
>>>>>>=20
>>>>>> What about:
>>>>>>=20
>>>>>> #include "omap3-beagle-xm.dts"
>>>>>>=20
>>>>>> / {
>>>>>> 	/* HS USB Port 2 Power enable was inverted with the xM C */
>>>>>> 	hsusb2_power: hsusb2_power_reg {
>>>>>> 		enable-active-high;
>>>>>> 	};
>>>>>> };
>>>>>>=20
>>>>>> compared to=20
>>>>>>=20
>>>>>> #include =93board1.dts=94
>>>>>>=20
>>>>>> / {
>>>>>> 	/* slave was reconnected to uart4 */
>>>>>> 	slave {
>>>>>> 		uart =3D <&uart4>;
>>>>>> 	};
>>>>>> };
>>>>>=20
>>>>> As I mentioned, you can easily carve up your DTS to make that wor=
k with
>>>>> includes if you really must:
>>>>>=20
>>>>> /* UART0 board variant */
>>>>> #include "board.dtsi"
>>>>> &uart0 {
>>>>> 	#include "some-uart-slave.dtsi"
>>>>> };
>>>>>=20
>>>>> /* UART1 board variant */
>>>>> #include "board.dtsi"
>>>>> &uart1 {
>>>>> 	#include "some-uart-slave.dtsi"
>>>>> };
>>>>>=20
>>>>> If you happen to find includes ugly then you can say it's ugly, b=
ut it's
>>>>> functionally equivalent, and also means you can avoid having
>>>>> disabled/partial nodes all over the place.
>>>>=20
>>>> Functionally equivalent would also be to copy the whole source fil=
e and
>>>> s/&uart0/&uart1/.
>>>>=20
>>>> But this is not the best solution for the DT programmer since ther=
e is no
>>>> automatic *reuse* of common parts.
>>>>=20
>>>> And your proposal requires 3 source files instead of 2 which deter=
iorates
>>>> readibility and understanding what is really going on. And if you =
need to
>>>> change the some-uart-slave, you have to touch a different file tha=
n for
>>>> changing some other slave.
>>>>=20
>>>> Yes, it works, but IMHO other factors for a good design are also i=
mportant.
>>>>=20
>>>> Maybe our main difference in PoV is that I specifically want to av=
oid that
>>>> we force future DT programmers into =93ugly=94 solutions (even if =
they work).
>>>>=20
>>>> If you think that DT programmers have to live with what they are
>>>> given and do the best with it, we can end the discussion.
>>>=20
>>> The question of syntax is orthogonal to the discussion of the prope=
r
>>> devicetree representation.
>>>=20
>>> The awkwardness of expressing variants has nothing to do with the
>>> appropriate device hierarchy (or whether there should be a hierarch=
y).
>>> Describing variants is just as awkward when the parent-child relati=
onship
>>> is indisputable.
>>=20
>> That is ok. But I still have not found the key rule when a parent-ch=
ild relationship
>> is indisputable. Candidates so far are =93main interface=94 (which i=
s still disputable)
>> or =93bus=94 (where we can dispute if a point-to-point connection is=
 a =93bus=94).
>=20
> Actually, at this point there is only one candidate, and that is the =
code
> under review.

I meant two different candiates for DT bindings [PATCH 3/3]. Yes, the c=
ode
exists only for Neil=92s proposal.

>=20
>> But if both options are equally valid (maybe because there is no rul=
e
>> making either indisputable), I would chose the one with easier synta=
x.
>=20
> There are many important criteria here.
>=20
> 1. Code complexity
> 2. Ease of adoption
> 3. Quality of abstraction
> 4. Extensibility

Yes. That is why I insist on discussing alternatives to show how good t=
hey
are wrt to such criteria and so far the discussion wasn=92t that well s=
tructured
to have clear criteria in the beginning. Thanks.

>=20
>>> There was a recent discussion on devicetree ML regarding how best t=
o
>>> express and represent variance. Feel free to revive that discussion=
=2E
>>=20
>> Does it help? Our core issue is not the syntax and variance per se. =
This are
>> just examples to demonstrate differences in syntax of parent-child v=
s. phandle.
>>=20
>> If we decide for either one, we have to live with syntactical and ot=
her
>> implcationd.
>=20
> The future implications of both the design and implementation need
> careful consideration. That's why I'd like to see a v4.

Yes, I appreciate that!

And if I find time, I will propose a v4-alternative.

BR and thanks,
Nikolaus
