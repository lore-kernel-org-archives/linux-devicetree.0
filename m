From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version
 3.
Date: Thu, 07 May 2015 11:37:57 -0400
Message-ID: <554B86D5.8080403@hurleysoftware.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/06/2015 09:28 AM, Dr. H. Nikolaus Schaller wrote:

> The key point appears to be how we want to see the serial connection.=
 Is the
> device connected to the uart or the uart to a device?
>=20
> In OO terminology: =E2=80=9Edevice connects to uart=E2=80=9C vs. =E2=80=
=9Euart has device connected=E2=80=9C.
> "d -> u=E2=80=9C vs. "u <- d=E2=80=9C.

This is not a very good analogy because both relationships need to be
represented.

The practical consideration is the lifetime of the target device.
If the target device should/must have a lifetime (as viewed from the ho=
st)
outside that of the uart, then the target device should not be a slave =
device.

Object lifetime is controlled by expressions of ownership or scope.
Since devicetree offers no expression of ownership, scope is the
obvious and natural way to control lifetime.

Regards,
Peter Hurley
