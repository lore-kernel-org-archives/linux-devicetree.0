From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv0] ARM: kirkwood: Add support for NETGEAR ReadyNAS NV+
 v2
Date: Sun, 1 Dec 2013 17:21:17 -0500
Message-ID: <20131201222117.GD2879@titan.lakedaemon.net>
References: <58e99356aad0daf90d28162eac6a4ecec70470f8.1385822676.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58e99356aad0daf90d28162eac6a4ecec70470f8.1385822676.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 30, 2013 at 04:13:44PM +0100, Arnaud Ebalard wrote:
>=20
> Almost all hardware parts of the NETGEAR ReadyNAS NV+ v2 ([1] for mor=
e
> details) are supported by mainline kernel. The only missing elements =
in
> provided .dts file are:
>=20
>  - the front LCD module (Winstar WINSTAR WH1602): driver development =
is
>    ongoing. This is the same LCD module as on ReadyNAS 104.
>  - the Macronix MX25L512 512Kbit SPI flash: no time to play with it y=
et.
>=20
> The device is the big brother (4 vs 2 bay) of the ReadyNAS Duo v2. Th=
e
> main differences are some additional LEDs for the disks, a Marvell
> 88SM4140 SATA Port multiplier (no driver required to access the disk)
> and previously described LCD module. Otherwise, it shares the same So=
C
> (kirkwood 88F6282), RAM (256MB), NAND (128MB), RTC chip (Ricoh rs5c37=
2a),
> fan controller (GMT G762), XHCI controller (NEC/Renesas =B5PD720200).
>=20
> [1]: http://natisbad.org/NAS5/
>=20
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
=2E..
>=20
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/kirkwood-netgear_readynas_nv+_v2.dts  | 270 +++++++++++=
++++++++++
>  2 files changed, 271 insertions(+)
>  create mode 100644 arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v=
2.dts

Applied to mvebu/dt

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
