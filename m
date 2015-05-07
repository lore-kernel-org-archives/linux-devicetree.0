From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version
 3.
Date: Thu, 07 May 2015 10:56:51 -0400
Message-ID: <554B7D33.602@hurleysoftware.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B4D487C5-C260-497B-A441-6C381D53616C-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:

> So I don=E2=80=99t think that being able to control the slave is a co=
mmon property
> of all UART-slave connections.
>=20
> BTW: the GPS chip we use is doing something without any instructions.=
 It starts
> to send NMEA records right after power on. It would even be useful wi=
th a unidirectional
> connection from GPS to UART. Hence there are no commands that need to=
 be
> sent through UART. Rather it just needs some GPIO to be activated or =
powered down
> when /dev/tty is opened/closed.

In this example, the GPIO is a workaround for the lack of DTR.


> So one could argue that in this real case (which we try to solve in a=
n acceptable way
> since 2 years) the fundamental/main interface (control command interf=
ace) of this chip
> is the power on/off line. And UART isn=E2=80=99t involved at all. Or =
just as an =E2=80=9Cactivity detector=E2=80=9D.

The indirect nature of control in this case only reflects the workaroun=
d,
not the underlying concept. Control is still derived from the UART stat=
us.

Both devicetree and tty/serial can already represent independent contro=
l;
what is proposed is a way to express dependent control, and in all case=
s,
that control stems directly from either the UART state itself or via
commands sent over that interface.

Any target not requiring UART involvement doesn't (and probably, should=
n't)
be expressed as a slave device.

Regards,
Peter Hurley
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
