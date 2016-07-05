From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: NUC900: Add nuc970 machine support
Date: Tue, 05 Jul 2016 10:09:09 +0200
Message-ID: <5195754.U9Bku6gEdi@wuerfel>
References: <1466851042-22239-1-git-send-email-vw@iommu.org> <4806020.41AJ9s5VGu@wuerfel> <577B63EF.6030906@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577B63EF.6030906-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 5, 2016 3:38:23 PM CEST Wan Zongshun wrote:
> On 2016=E5=B9=B406=E6=9C=8829=E6=97=A5 23:19, Arnd Bergmann wrote:
> >> diff --git a/arch/arm/mach-w90x900/include/mach/nuc970-regs-gcr.h =
b/arch/arm/mach-w90x900/include/mach/nuc970-regs-gcr.h
> >> new file mode 100644
> >> index 0000000..e7eb653
> >> --- /dev/null
> >> +++ b/arch/arm/mach-w90x900/include/mach/nuc970-regs-gcr.h
> >
> > Can you move the new headers to arch/arm/mach-w90x900/ directly?
> >
> >> +static int __init nuc900_restart_init(void)
> >> +{
> >> +	struct device_node *np;
> >> +
> >> +	np =3D of_find_compatible_node(NULL, NULL, "nuvoton,gcr");
> >> +	wtcr_addr =3D of_iomap(np, 0);
> >> +	if (!wtcr_addr)
> >> +		return -ENODEV;
> >> +
> >> +	of_node_put(np);
> >> +
> >> +	return 0;
> >> +}
> >
> > Is this a watchdog node? If it is, the restart logic should just
> > move into the watchdog driver.
>=20
> It is not watchdog node, just be global System control register node.

Ok. Then I'd say it should go into drivers/power/reset/

If you make the the gcr a syscon node, you can probably use the
syscon-reboot driver directly, or as a reference.

> >> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, par=
ent);
> >
> > We have actually moved away from using the soc_device as using the =
parent
> > for the other devices, just probe them separately. In fact the soc_=
device
> > could be handled by a driver in drivers/soc/nuvoton/
>=20
> Do you think I should add nuc900 soc driver in this folder?

Yes.

> If I want to add nuc900 soc driver in drivers/soc/nuvoton/, can I kee=
p=20
> my current dts structure no change, or Must I add a new node name soc=
 {}?
>
> I went through the code:soc-realview.c for reference, but I have no i=
dea
> about how to re-structure my dts file to match this type soc driver.

You don't need to change the DT for this, all the driver needs to
do now is to find out the information about the soc and register it
as a soc_device so it shows up in sysfs.

> >> +static const char *nuc970_dt_compat[] __initconst =3D {
> >> +	"nuvoton,nuc970evb",
> >> +	NULL,
> >> +};
> >> +
> >> +void nuc970_restart(enum reboot_mode mode, const char *cmd)
> >> +{
> >> +	if (wtcr_addr) {
> >> +		while (__raw_readl(wtcr_addr + REG_WRPRTR) !=3D 1) {
> >> +			__raw_writel(0x59, wtcr_addr + REG_WRPRTR);
> >> +			__raw_writel(0x16, wtcr_addr + REG_WRPRTR);
> >> +			__raw_writel(0x88, wtcr_addr + REG_WRPRTR);
> >> +		}
> >> +
> >> +		__raw_writel(1, wtcr_addr + REG_AHBIPRST);
> >> +	}
> >
> > Please use writel() instead of __raw_writel().
>=20
> Does this change apply to all others drivers? or just machine file to=
=20
> use writel()?

All drivers. You don't need to immediately change existing drivers, we
can clean them up some other day, but please use readl/writel for new c=
ode.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
