From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: add system-power-controller to  act8846
Date: Tue, 12 May 2015 22:44:09 +0200
Message-ID: <2003800.TXlUqeQVab@phil>
References: <64DE272A-FD25-406C-A51B-6C5B76DA5171@stud.hs-offenburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64DE272A-FD25-406C-A51B-6C5B76DA5171-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael =?ISO-8859-1?Q?Niew=F6hner?= <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 11. Mai 2015, 22:57:21 schrieb Michael Niew=F6hner:
> Add system-power-controller to act8846 in rk3188-radxarock.dts in add=
ition
> to the act8846 patch fixing the reboot kernel panic
>=20
> Signed-off-by: Michael Niewoehner <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>

As the act8846 is the system-power-controller in any case (for example =
to
powerdown the board) I've applied this patch to my dts branch for 4.2 [=
0],
after adapting the commit message slightly to make it a bit more generi=
c:
----
ARM: dts: rockchip: add system-power-controller to act8846 on radxarock
The act8846 is the main pmic and system-power-controller on radxarock b=
oards,
so add the necessary property.
----

Hope that is ok with you :-)

Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.g=
it/commit/?h=3Dv4.2-armsoc/dts&id=3D9ab79be0da98e371f1d2f9c01ac25745639=
718d1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
