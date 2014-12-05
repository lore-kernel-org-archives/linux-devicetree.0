From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] Broadcom STB GISB bus driver for 3.19 (v2)
Date: Fri, 05 Dec 2014 10:54:17 +0100
Message-ID: <6133066.hrdnRxXNp1@wuerfel>
References: <1417220370-469-1-git-send-email-f.fainelli@gmail.com> <2910464.KM7dWcxCmJ@wuerfel> <54815D85.7090409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54815D85.7090409-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 04 December 2014 23:23:49 Florian Fainelli wrote:
> Le 04/12/2014 07:44, Arnd Bergmann a =E9crit :
> > On Friday 28 November 2014 16:19:30 Florian Fainelli wrote:
> >> This pull request contains the following changes to the Broadcom G=
ISB bus
> >> arbiter from Kevin Cernekee:
> >>
> >> - Extend brcmstb GISB bus driver to work on MIPS (currently ARM-on=
ly) and support
> >>   65nm and 40nm MIPS-based chips such as: BCM7038, BCM7400 and BCM=
7435
> >=20
> > Pulled into next/drivers, thanks!
>=20
> Thanks! You may have to resolve a conflict when you merge
> brcm/stb-smp-uart with next/drivers for this file, especially with th=
e
> commit below:
>=20
> 203bb85ed605e43eadca62afb3a8cd128a8ec10a ("bus: brcmstb_gisb: save an=
d
> restore GISB timeout")
>=20
> for brcmstb_gisb_arb_suspend() and
> brcmstb_gisb_arb_resume_noirq() which still use the ioread32/iowrite3=
2
> accessors instead of those introduced later on by Kevin: gisb_read() =
and
> gisb_write. The merge resolution looks like this:
>=20
>=20
> #ifdef CONFIG_PM_SLEEP
> static int brcmstb_gisb_arb_suspend(struct device *dev)
> {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct brcmstb_gisb_arb_device *gdev =3D platform_get_drvdata=
(pdev);
>=20
>         gdev->saved_timeout =3D gisb_read(gdev, ARB_TIMER);
>=20
>         return 0;
> }
>=20
> /* Make sure we provide the same timeout value that was configured
> before, and
>  * do this before the GISB timeout interrupt handler has any chance t=
o run.
>  */
> static int brcmstb_gisb_arb_resume_noirq(struct device *dev)
> {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct brcmstb_gisb_arb_device *gdev =3D platform_get_drvdata=
(pdev);
>=20
>         gisb_write(gdev, gdev->saved_timeout, ARB_TIMER);
>=20
>         return 0;
> }

I ended up mismerging it actually, but Olof fixed it up. If you have th=
e
time, please check that the contents of our for-next branch are correct
now.

Thanks,

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
