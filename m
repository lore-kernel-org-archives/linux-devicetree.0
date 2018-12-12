From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 12 Dec 2018 10:34:24 +0200
Message-ID: <871s6nm9db.fsf@linux.intel.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com> <1544445555-17325-3-git-send-email-pawell@cadence.com> <87h8fkmfar.fsf@linux.intel.com> <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com> <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com> <877egfmdxk.fsf@linux.intel.com> <VI1PR04MB5327B1CB6C6BC7D293701F1D8BA70@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB5327B1CB6C6BC7D293701F1D8BA70@VI1PR04MB5327.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, Peter Chen <hzpeterchen@gmail.com>, "pawell@cadence.com" <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Chen <peter.chen@nxp.com> writes:
>> >> >> +    irqreturn_t ret =3D IRQ_NONE;
>> >> >> +    unsigned long flags;
>> >> >> +    u32 reg;
>> >> >> +
>> >> >> +    priv_dev =3D cdns->gadget_dev;
>> >> >> +    spin_lock_irqsave(&priv_dev->lock, flags);
>> >> >
>> >> >you're already running in hardirq context. Why do you need this lock
>> >> >at all? I would be better to use the hardirq handler to mask your
>> >> >interrupts, so they don't fire again, then used the top-half
>> >> >(softirq) handler to actually handle the interrupts.
>> >>
>> >
>> > This controller may be ran at SMP environment, register and flag
>> > access needs to be protected among CPUs running.
>>=20
>> in hardirq context? When interrupts are already disabled?
>
> Interrupt handler (hardirq context) at CPU0, and process at CPU1, eg
> role switch, unload module, etc.

the process at CPU1 would need to disable interrupts (spin_lock_irq() or
spin_lock_irqsave()), not the hardirq on CPU0 as that already runs with
interrrupts disabled.

https://www.kernel.org/doc/html/latest/kernel-hacking/locking.html#table-of=
-minimum-requirements

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwQyBAACgkQzL64meEa
mQZ8CxAAvjH18/fOPM8pCR/Wu8JM3pC2RH0ACJcypp+6QdyCQrRBCrDHetCXgIBH
INpwQzkJGW8+d4zkFAUgVtuWkKCkNyoMFw9jR1cQSVGyem+S9HN6AR78ufEeXJ61
pCna4GCRwEFdzHLUnEaPEh+q3TUSO1n0zE/afibTkpW+Jh6u7wgtLdOL1m8HaG7R
l5taWIvb/RL+pH2Gbbv/7SebacbpK/cf6gSGBbR6LgAvweCDUWdeJJluzY+m9uDp
uhwZ3mXvgV0MiQbTRk9j1QclyGNBJrXOOzBW84v8Tnu4P9kCbXVJpwuPAsJZQS7T
H8q9s3NUwDKHcAjExzuUdtOwmbdBgbd0IPkwSstuIsKvav3TwtNae0o39eAE5y8S
Bx1ulfD9XRaQiWSHo6UTH7wOJNtkQCvcAIirEMnlomKSwwAQTQ6Tmrdh5/hd/OI/
qY7LsmZfN8yZ+1KhKWlJyZJgabw9WIEaesmPwwFfS1dskDMAwoEegrK4azDprALC
6IxDj6oQ05irTwEu8ICFvYkzuBZ5tGEwmNKtnVJxzvbmUQBgoGGlPppVLexBSXdP
fRDLzuI4hX0g4vifRo4qcJS4U3yOuJpoIybY4ZSsOPefwA4DqHxG0M8Iqi1Qe84y
+e20v5AQnLxxUrC+XnwcW37JoGA6uukzyYijQrvPfngpllTr+fc=
=spIR
-----END PGP SIGNATURE-----
--=-=-=--
