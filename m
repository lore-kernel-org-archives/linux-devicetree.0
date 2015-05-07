From: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Thu, 7 May 2015 17:34:14 +0200
Message-ID: <9EF54D80-F634-4D59-BFD9-FC79FCFE06DE@goldelico.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com> <554B7D33.602@hurleysoftware.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <554B7D33.602-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Am 07.05.2015 um 16:56 schrieb Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>:

> On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:
>=20
>> So I don=92t think that being able to control the slave is a common =
property
>> of all UART-slave connections.
>>=20
>> BTW: the GPS chip we use is doing something without any instructions=
=2E It starts
>> to send NMEA records right after power on. It would even be useful w=
ith a unidirectional
>> connection from GPS to UART. Hence there are no commands that need t=
o be
>> sent through UART. Rather it just needs some GPIO to be activated or=
 powered down
>> when /dev/tty is opened/closed.
>=20
> In this example, the GPIO is a workaround for the lack of DTR.

Yes.

Our long ago proposal was to use DTR - but this did lead to make the GP=
S driver
present a =93virtual gpio=94, that could have been plumbed to a dtr-gpi=
o phandle of the uart
driver. The only reason is that some piece of code must pulse-shape the=
 DTR
to be fed into the real GPS control pin.0

But I agree that we should not have such =93virtual gpios=94, since the=
y are not needed
(in either approach we discuss now).

>=20
>=20
>> So one could argue that in this real case (which we try to solve in =
an acceptable way
>> since 2 years) the fundamental/main interface (control command inter=
face) of this chip
>> is the power on/off line. And UART isn=92t involved at all. Or just =
as an =93activity detector=94.
>=20
> The indirect nature of control in this case only reflects the workaro=
und,
> not the underlying concept. Control is still derived from the UART st=
atus.

>=20
> Both devicetree and tty/serial can already represent independent cont=
rol;
> what is proposed is a way to express dependent control, and in all ca=
ses,
> that control stems directly from either the UART state itself or via
> commands sent over that interface.

Yes. This is why I propose that the tty/uart driver can send an interna=
l notification
to the device driver. And the device driver can register to be notified=
 by the UART
that is identified by the phandle of the slave DT entry.

>=20
> Any target not requiring UART involvement doesn't (and probably, shou=
ldn't)
> be expressed as a slave device.

IMHO it is not obligatory to represent the direction of control by a pa=
rent>child
relation in DT. DT just needs to describe that there is a relation/conn=
ection.

The driver code already must =93know=94 the direction of notifications.

BTW, there can even be control in reverse direction in some cases. E.g.=
 the slave
driver wants to automatically set the baud rate of the uart, i.e. the s=
lave controls
the uart on /dev/tty side.

If I have monitored some other discussion right, this is exactly done b=
y a Codec
driver to tell its mcbsp counterpart about clock rates and data formats=
 it should
expect. Maybe this is the reason why McBSP use (or are just happy with)=
 the
phandle approach.

BR,
Nikolaus

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
