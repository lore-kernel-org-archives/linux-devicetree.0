From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC 0/7] ARM: vf610m4: Add Vybrid Cortex-M4 support
Date: Fri, 28 Nov 2014 15:17:59 +0100
Message-ID: <54788417.6020408@suse.de>
References: <cover.1413136383.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

Am 12.10.2014 um 20:13 schrieb Stefan Agner:
> One thing I noticed that when I move the xipImage below the DRAM base
> address, the kernel freezes:
> ...
> Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [freeze]
>=20
> I think it happens when the scheduler gets started. Any idea what cou=
ld
> go wrong here?

I ran into a similar issue on STM32F4 recently - hanging there, or:

Unhandled exception: IPSR =3D 00000006 LR =3D fffffff1
CPU: 0 PID: 1 Comm: swapper Not tainted 3.18.0-rc5-00003-g489983a-dirty=
 #25
task: 90432000 ti: 90434000 task.ti: 90434000

Unhandled exception: IPSR =3D 00000003 LR =3D fffffff1
CPU: 0 PID: 1 Comm: swapper Not tainted 3.18.0-rc5-00003-g489983a-dirty=
 #25
task: 90432000 ti: 90434000 task.ti: 90434000
-Boot 2010.03-00003-g934021a-dirty (Nov 26 2014 - 06:52:49)

My debugging indicated that %pF was not working, used among others in
checking for blacklisted initcalls. Disabling CONFIG_KALLSYMS worked
around this, so I assume something there is not compatible with XIP...

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
