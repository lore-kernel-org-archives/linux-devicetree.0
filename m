From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version
 3.
Date: Thu, 07 May 2015 10:30:46 -0400
Message-ID: <554B7716.3080504@hurleysoftware.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:
> Am 06.05.2015 um 19:18 schrieb Mark Rutland <mark.rutland@arm.com>:
>> On Wed, May 06, 2015 at 05:09:20PM +0100, Dr. H. Nikolaus Schaller w=
rote:
>>> Am 06.05.2015 um 16:15 schrieb Mark Rutland <mark.rutland@arm.com>:
>>>
>>>>>>>>> No, I am not playing devil=E2=80=99s advocate (which would im=
ply that I am doing this
>>>>>>>>> for fun to tease the dog), but I feel I have to be the advoca=
te of future board
>>>>>>>>> designers who want to easily import an existing board DT and =
overwrite device
>>>>>>>>> tree nodes to describe design changes, i.e. what slave device=
 is connected to
>>>>>>>>> which uart.
>>>>
>>>> [...]
>>>>
>>>>>> If this happens, you can move the slave device into a fragment t=
hat you
>>>>>> can include under the correct node. That's trivial.
>>>>>
>>>>> But less readable. And that is important as well.
>>>>
>>>> I disagree. The manipulation you have to perform to override prope=
rties
>>>> is at least as bad as including a file.
>>>
>>> What about:
>>>
>>> #include "omap3-beagle-xm.dts"
>>>
>>> / {
>>> 	/* HS USB Port 2 Power enable was inverted with the xM C */
>>> 	hsusb2_power: hsusb2_power_reg {
>>> 		enable-active-high;
>>> 	};
>>> };
>>>
>>> compared to=20
>>>
>>> #include =E2=80=9Cboard1.dts=E2=80=9D
>>>
>>> / {
>>> 	/* slave was reconnected to uart4 */
>>> 	slave {
>>> 		uart =3D <&uart4>;
>>> 	};
>>> };
>>
>> As I mentioned, you can easily carve up your DTS to make that work w=
ith
>> includes if you really must:
>>
>> /* UART0 board variant */
>> #include "board.dtsi"
>> &uart0 {
>> 	#include "some-uart-slave.dtsi"
>> };
>>
>> /* UART1 board variant */
>> #include "board.dtsi"
>> &uart1 {
>> 	#include "some-uart-slave.dtsi"
>> };
>>
>> If you happen to find includes ugly then you can say it's ugly, but =
it's
>> functionally equivalent, and also means you can avoid having
>> disabled/partial nodes all over the place.
>=20
> Functionally equivalent would also be to copy the whole source file a=
nd
> s/&uart0/&uart1/.
>=20
> But this is not the best solution for the DT programmer since there i=
s no
> automatic *reuse* of common parts.
>=20
> And your proposal requires 3 source files instead of 2 which deterior=
ates
> readibility and understanding what is really going on. And if you nee=
d to
> change the some-uart-slave, you have to touch a different file than f=
or
> changing some other slave.
>=20
> Yes, it works, but IMHO other factors for a good design are also impo=
rtant.
>=20
> Maybe our main difference in PoV is that I specifically want to avoid=
 that
> we force future DT programmers into =E2=80=9Cugly=E2=80=9D solutions =
(even if they work).
>=20
> If you think that DT programmers have to live with what they are
> given and do the best with it, we can end the discussion.

The question of syntax is orthogonal to the discussion of the proper
devicetree representation.

The awkwardness of expressing variants has nothing to do with the
appropriate device hierarchy (or whether there should be a hierarchy).
Describing variants is just as awkward when the parent-child relationsh=
ip
is indisputable.

There was a recent discussion on devicetree ML regarding how best to
express and represent variance. Feel free to revive that discussion.

Regards,
Peter Hurley
