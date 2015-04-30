From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: vexpress: Add unified-cache Device Tree property
Date: Thu, 30 Apr 2015 14:45:37 +0100
Message-ID: <20150430134537.GP7440@e106497-lin.cambridge.arm.com>
References: <5509437E.6060806@arm.com>
 <1426671298-2012-1-git-send-email-r.schwebel@pengutronix.de>
 <20150429191228.GO15254@pengutronix.de>
 <20150430110853.GN7440@e106497-lin.cambridge.arm.com>
 <20150430133011.GE15254@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430133011.GE15254-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 30, 2015 at 02:30:11PM +0100, Robert Schwebel wrote:
> Hi Liviu,
>=20
> On Thu, Apr 30, 2015 at 12:08:53PM +0100, Liviu Dudau wrote:
> > Sorry Robert, this fell through the cracks. VExpress gets very few
> > patches in general and we're new to this :(
>=20
> Thanks for the help!
>=20
> I still see these errors with 4.1-rc1:
>=20
> [    0.000000] L2C: platform modifies aux control register: 0x0202000=
0 -> 0x02420000
> [    0.000000] L2C: DT/platform modifies aux control register: 0x0202=
0000 -> 0x02420000
> [    0.268626] platform 10000000.sysreg: Error -2 creating of_node li=
nk
> [    0.271997] platform basic-mmio-gpio.1.auto: Error -2 creating of_=
node link
> [    0.272266] platform basic-mmio-gpio.2.auto: Error -2 creating of_=
node link
> [    0.272681] platform basic-mmio-gpio.3.auto: Error -2 creating of_=
node link
> [    0.426298] of_amba_device_create(): amba_device_add() failed (-19=
) for /memory-controller@100e0000
> [    0.426799] of_amba_device_create(): amba_device_add() failed (-19=
) for /memory-controller@100e1000
> [    0.427099] of_amba_device_create(): amba_device_add() failed (-19=
) for /watchdog@100e5000
> [    0.433206] of_amba_device_create(): amba_device_add() failed (-19=
) for /smb/motherboard/iofpga@7,00000000/sysctl@01000
> [    0.438165] of_amba_device_create(): amba_device_add() failed (-19=
) for /smb/motherboard/iofpga@7,00000000/wdt@0f000
>=20
> Do you have an idea what might go wrong?

No, not yet. I will give it a go on my TC2 board.

Best regards,
Liviu

>=20
> rsc
> --=20
> Pengutronix e.K.                           |                         =
    |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
