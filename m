From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version
 3.
Date: Wed, 06 May 2015 08:05:59 -0400
Message-ID: <554A03A7.2000504@hurleysoftware.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>
Cc: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/06/2015 07:50 AM, Dr. H. Nikolaus Schaller wrote:
> No, I am not playing devil=E2=80=99s advocate (which would imply that=
 I am doing this
> for fun to tease the dog), but I feel I have to be the advocate of fu=
ture board
> designers who want to easily import an existing board DT and overwrit=
e device
> tree nodes to describe design changes, i.e. what slave device is conn=
ected to
> which uart.

I dont' see a big distinction at the DTS source level, so your concern =
is wrt
binary dtbs?

> At least in this regard, the alternatives are really differently easy=
 to handle.
>=20
> And, the alternatives have some influence how a tty driver and a slav=
e device
> driver is designed. So that is for me the root question, before discu=
ssing (some)
> implementation details.

I would expect _no_ impact on the tty driver; have I overlooked somethi=
ng?

Regards,
Peter Hurley
