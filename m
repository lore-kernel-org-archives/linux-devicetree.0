From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version
 3.
Date: Thu, 07 May 2015 11:51:48 -0400
Message-ID: <554B8A14.2080904@hurleysoftware.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com> <554B7D33.602@hurleysoftware.com> <9EF54D80-F634-4D59-BFD9-FC79FCFE06DE@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9EF54D80-F634-4D59-BFD9-FC79FCFE06DE@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/07/2015 11:34 AM, Dr. H. Nikolaus Schaller wrote:
> Am 07.05.2015 um 16:56 schrieb Peter Hurley <peter@hurleysoftware.com=
>:
>> On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:

>> Both devicetree and tty/serial can already represent independent con=
trol;
>> what is proposed is a way to express dependent control, and in all c=
ases,
>> that control stems directly from either the UART state itself or via
>> commands sent over that interface.
>=20
> Yes. This is why I propose that the tty/uart driver can send an inter=
nal notification
> to the device driver. And the device driver can register to be notifi=
ed by the UART
> that is identified by the phandle of the slave DT entry.

I've not seen any code with your proposal, so that makes it impossible =
to
compare competing solutions.


>> Any target not requiring UART involvement doesn't (and probably, sho=
uldn't)
>> be expressed as a slave device.
>=20
> IMHO it is not obligatory to represent the direction of control by a =
parent>child
> relation in DT. DT just needs to describe that there is a relation/co=
nnection.

Devicetree usage in the linux kernel is for representing the host view,=
 not an
abstract machine. I have yet to see an example of a proposed tty slave =
where the
host interface is not a UART.

> The driver code already must =E2=80=9Cknow=E2=80=9D the direction of =
notifications.
>=20
> BTW, there can even be control in reverse direction in some cases. E.=
g. the slave
> driver wants to automatically set the baud rate of the uart, i.e. the=
 slave controls
> the uart on /dev/tty side.
>=20
> If I have monitored some other discussion right, this is exactly done=
 by a Codec
> driver to tell its mcbsp counterpart about clock rates and data forma=
ts it should
> expect. Maybe this is the reason why McBSP use (or are just happy wit=
h) the
> phandle approach.

Parameters are not control.

Regards,
Peter Hurley
