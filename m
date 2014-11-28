From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [RFC 0/7] ARM: vf610m4: Add Vybrid Cortex-M4 support
Date: Fri, 28 Nov 2014 17:00:00 +0100
Message-ID: <f176fb225d8679645fcfad4a98761f98@agner.ch>
References: <cover.1413136383.git.stefan@agner.ch>
 <54788417.6020408@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54788417.6020408-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On 2014-11-28 15:17, Andreas F=C3=A4rber wrote:
> Hi Stefan,
>=20
> Am 12.10.2014 um 20:13 schrieb Stefan Agner:
>> One thing I noticed that when I move the xipImage below the DRAM bas=
e
>> address, the kernel freezes:
>> ...
>> Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
>> Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
>> [freeze]
>>
>> I think it happens when the scheduler gets started. Any idea what co=
uld
>> go wrong here?
>=20
> I ran into a similar issue on STM32F4 recently - hanging there, or:
>=20
> Unhandled exception: IPSR =3D 00000006 LR =3D fffffff1
> CPU: 0 PID: 1 Comm: swapper Not tainted 3.18.0-rc5-00003-g489983a-dir=
ty #25
> task: 90432000 ti: 90434000 task.ti: 90434000
>=20
> Unhandled exception: IPSR =3D 00000003 LR =3D fffffff1
> CPU: 0 PID: 1 Comm: swapper Not tainted 3.18.0-rc5-00003-g489983a-dir=
ty #25
> task: 90432000 ti: 90434000 task.ti: 90434000
> -Boot 2010.03-00003-g934021a-dirty (Nov 26 2014 - 06:52:49)
>=20
> My debugging indicated that %pF was not working, used among others in
> checking for blacklisted initcalls. Disabling CONFIG_KALLSYMS worked
> around this, so I assume something there is not compatible with XIP..=
=2E

Hm, interesting! So it needs to be somewhere in lib/vsprintf.c or even
kernel/kallsyms.c. If XIP is incompatible with the KALLSYMS, we should
fix this dependency. Maybe it's easily fixable, however I did not look
into that symbolic stuff. I would be helpful to have symbols even on M4
thought :-) Will probably have a look into it this weekend.

--
Stefan


>=20
> Regards,
> Andreas

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
