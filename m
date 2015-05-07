From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Thu, 7 May 2015 18:46:51 +0200
Message-ID: <21C337B3-D612-4931-BA23-6B7518E6E4DD@goldelico.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com> <554B7D33.602@hurleysoftware.com> <9EF54D80-F634-4D59-BFD9-FC79FCFE06DE@goldelico.com> <554B8A14.2080904@hurleysoftware.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554B8A14.2080904@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

Am 07.05.2015 um 17:51 schrieb Peter Hurley <peter@hurleysoftware.com>:

> On 05/07/2015 11:34 AM, Dr. H. Nikolaus Schaller wrote:
>> Am 07.05.2015 um 16:56 schrieb Peter Hurley <peter@hurleysoftware.co=
m>:
>>> On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:
>=20
>>> Both devicetree and tty/serial can already represent independent co=
ntrol;
>>> what is proposed is a way to express dependent control, and in all =
cases,
>>> that control stems directly from either the UART state itself or vi=
a
>>> commands sent over that interface.
>>=20
>> Yes. This is why I propose that the tty/uart driver can send an inte=
rnal notification
>> to the device driver. And the device driver can register to be notif=
ied by the UART
>> that is identified by the phandle of the slave DT entry.
>=20
> I've not seen any code with your proposal, so that makes it impossibl=
e to
> compare competing solutions.

If you can give me some (unspecified) time to do it, I can write (simpl=
ified) patches
to demonstrate the idea.

I just hesitate to work out and submit a counter proposal to what Neil =
has submitted,
because it will become wasted effort if it is rejected before I am fini=
shed.

>=20
>=20
>>> Any target not requiring UART involvement doesn't (and probably, sh=
ouldn't)
>>> be expressed as a slave device.
>>=20
>> IMHO it is not obligatory to represent the direction of control by a=
 parent>child
>> relation in DT. DT just needs to describe that there is a relation/c=
onnection.
>=20
> Devicetree usage in the linux kernel is for representing the host vie=
w, not an
> abstract machine. I have yet to see an example of a proposed tty slav=
e where the
> host interface is not a UART.

So far, I am only aware of two devices proposed to be tty power control=
led slaves:
* our GPS chip and
* several Bluetooth modules (using HCI).

It is difficult to predict future use cases and systems.

With some phantasy there could be some I2C controlled serial level shif=
ter that
translates uart RX/TX/RTS/CTS to RS232 levels but allows for pin swappi=
ng (null modem).
Power control of that chip is done through I2C. Similar chips exist for=
 headset pinout
detection ans automatic swapping, e.g. TS3A225E.

Or some Infrared (IrDA) transceiver with mode and power control over I2=
C.

Such a device should probably be described as a child node of the I2C b=
us it is
connected to. And the driver must become an i2c device driver. So this =
would be
in conflict with tty slave child nodes - but no problem with a phandle =
to the uart.

>=20
>> The driver code already must =93know=94 the direction of notificatio=
ns.
>>=20
>> BTW, there can even be control in reverse direction in some cases. E=
=2Eg. the slave
>> driver wants to automatically set the baud rate of the uart, i.e. th=
e slave controls
>> the uart on /dev/tty side.
>>=20
>> If I have monitored some other discussion right, this is exactly don=
e by a Codec
>> driver to tell its mcbsp counterpart about clock rates and data form=
ats it should
>> expect. Maybe this is the reason why McBSP use (or are just happy wi=
th) the
>> phandle approach.
>=20
> Parameters are not control.

Agreed. Especially if you mean power control.

But does it change the necessity to describe the control direction in t=
he DT as parent>child?

In many other situations power control is described by regulator phandl=
es and the regulators
are not children of the controlling DT node.

BR,
Nikolaus
