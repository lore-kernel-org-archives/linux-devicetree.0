From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: add irqchip driver for nuc900
Date: Tue, 05 Jul 2016 10:09:42 +0200
Message-ID: <4905263.SDvl9l5FN0@wuerfel>
References: <1466851042-22239-1-git-send-email-vw@iommu.org> <8706947.5rzUDVsB2F@wuerfel> <577B660D.50908@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577B660D.50908-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, July 5, 2016 3:47:25 PM CEST Wan Zongshun wrote:
> On 2016=E5=B9=B406=E6=9C=8829=E6=97=A5 23:27, Arnd Bergmann wrote:
> > On Saturday, June 25, 2016 6:37:20 PM CEST Wan Zongshun wrote:
> >> +#define IRQ_WDT             W90X900_IRQ(1)
> >> +#define IRQ_WWDT    W90X900_IRQ(2)
> >> +#define IRQ_LVD             W90X900_IRQ(3)
> >> +#define IRQ_EXT0    W90X900_IRQ(4)
> >> +#define IRQ_EXT1    W90X900_IRQ(5)
> >> +#define IRQ_EXT2    W90X900_IRQ(6)
> >> +#define IRQ_EXT3    W90X900_IRQ(7)
> >> +#define IRQ_EXT4    W90X900_IRQ(8)
> >> +#define IRQ_EXT5    W90X900_IRQ(9)
> >> +#define IRQ_EXT6    W90X900_IRQ(10)
> >
> > I'd suggest dropping the list, the contents are now in the dts.
>=20
> Do you think I should put one irqmap header file into this
> /arch/arm/boot/dts/include/dt-bindings folder, or I should removed th=
ose=20
> irqnumber map anywhere, just hardcode the irqnumber in dts file?

Just hardcode it.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
