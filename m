From: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: Re: [PATCH 1/2] misc: Add Wi2Wi w2sc0004 gps driver
Date: Sun, 19 Oct 2014 22:29:27 +0200
Message-ID: <849A3D5F-6A8A-4DA3-9D33-3357E3447B7F@goldelico.com>
References: <1413491183-15018-1-git-send-email-marek@goldelico.com> <9266107.dnSTmzxRsf@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9266107.dnSTmzxRsf@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 19.10.2014 um 21:51 schrieb Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:

> On Thursday 16 October 2014 22:26:22 Marek Belisko wrote:
>> This is a driver for the Wi2Wi GPS modules connected through an UART=
=2E
>> The tricky part is that the module is turned on or off by an impulse
>> on the control line - but it is only possible to get the real state =
by monitoring
>> the UART RX input. Since the kernel can't know in which status the m=
odule
>> is brought e.g. by a boot loader or after suspend, we need some logi=
c to handle
>> this.
>>=20
>> The driver allows two different methods to enable (and power up) GPS=
:
>> a) through rfkill
>> b) as a GPIO
>>=20
>> The GPIO enable can be plumbed to other drivers that expect to be ab=
le to control
>> a GPIO. On the GTA04 board this is the DTR-gpio of the connected UAR=
T so that
>> opening the UART device enables the receiver and closing it shuts th=
e receiver down.
>>=20
>> Original implementation by Neil Brown, fixes + DT bindings by H. Nik=
olaus Schaller
>=20
> I=92m not sure if this is a good way to model the device.

It is the easiest way we have found after ca. 2 years of working on it =
:)

> You say that it's
> connected to a UART, but the code itself has no reference to the tty =
layer
> at all.

Yes.

> I assume the actual driver is in user space and it would open the
> UART and this control device as separate instances handles and then t=
ry
> to coordinate them. Is that right?

Yes, it is called gpsd.

>=20
> What is the protocol for the GPS driver itself? Is it standardized?

Yes, NMEA records. Like most GPS receivers provide them.

> Would it help to have a TTY line discipline for the GPS mode instead
> so the power management and startup could be integrated into the seri=
al
> port management instead?

I don=92t think line disciplines (as far as I understand them) are help=
ful and
this chip is not special at all regarding the serial interface data. So=
 it needs no
=93GPS mode=94.

It is very similar to connecting some external handheld GPS receiver by=
 a
RS232 cable or RS232-USB adapter. Or GPS =93mouse=94 receivers through
bluetooth.

They all create/show some /dev/tty that you simply open/read/close. And
there is no special processing of the serial data involved.

The only thing this driver needs to solve is to properly power up/down
the chip on demand.

The DTR line of the tty can enable/disable power of a connected device
(being an external modem or this GPS chip). This is what we have made
the driver compatible to by providing a virtual GPIO to enable/disable.

This is done by a patch to the tty driver that already was in the kerne=
l
but removed in 3.15 because the w2sg driver wasn=92t submitted at that
time.

Commit: 985bfd54c826c0ba873ca0adfd5589263e0c6ee2

Basically, if our CPU would have a real RS232 interface and we would
put the chip into an external device, it should look exactly the same i=
f
we look at the serial interface part. Since soldering it on the same PC=
B
or connecting through a connector should not need different serial driv=
ers.
Just different device tree files.

Therefore we have decided not to touch any serial driver code at all,
because it is not needed (except allowing DTR to control some GPIO)
and keeps it simple and manageable.

BR,
Nikolaus


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
