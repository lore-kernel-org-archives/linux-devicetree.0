From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 14/36] mtd: st_spi_fsm: Add device-tree binding
 documentation
Date: Tue, 3 Dec 2013 11:31:56 +0000
Message-ID: <20131203113156.GB12031@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-15-git-send-email-lee.jones@linaro.org>
 <CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
 <20131202110304.GB31626@lee--X1>
 <CACRpkdb8=RRsNRKe4Nbefu2BJ4xHakmNjxFC1gwLea=bAmOz-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb8=RRsNRKe4Nbefu2BJ4xHakmNjxFC1gwLea=bAmOz-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, angus.clark-qxv4g6HH51o@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 03 Dec 2013, Linus Walleij wrote:

> On Mon, Dec 2, 2013 at 12:03 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> >> > +Optional properties:
> >> > +  - st,syscfg          : Phandle to boot-device system configur=
ation registers
> >> > +  - st,boot-device-reg : Address of the aforementioned boot-dev=
ice register(s)
> >> > +  - st,boot-device-spi : Expected boot-device value if booted v=
ia this device
> >> > +
> >> > +Example:
> >> > +       spifsm: spifsm@fe902000{
> >> > +               compatible         =3D "st,spi-fsm";
> >> > +               reg                =3D  <0xfe902000 0x1000>;
> >> > +               reg-names          =3D "spi-fsm";
> >> > +               pinctrl-0          =3D <&pinctrl_fsm>;
> >> > +               st,syscfg          =3D <&syscfg_rear>;
> >> > +               st,boot-device-reg =3D <0x958>;
> >> > +               st,boot-device-spi =3D <0x1a>;
> >>
> >> I don't think we should encode any register offsets whatsoever in =
device
> >> tree but maybe that's just me. (Yes, Stephen will beat me up about
> >> pin control single, but I consider that a special case.)
> >>
> >> I would just put the last two things as #defines into the driver f=
ile(s)
> >> or - if it's related to other syscfg registers and varies with SoC=
 incarnation,
> >> as a #define in a shared header for that syscfg thing.
> >
> > No can do. This isn't _this_ device's register offset, this is a
> > syscfg register offset which a) there is no driver to apply specifi=
c
> > register offsets to and b) are liable to change oversubsequent SoCs=
=2E
>=20
> So it can be in <linux/mfd/my-sysconfig-regs.h> as
> a
>=20
> #define MY_SYSCON_V1_BOOT_DEV_REG 0x958
> #define MY_SYSCON_V1_BOOT_DEV_SPI 0x1a
>=20
> The kernel should know which SoC is in use and
> act apropriately right?

And this have lots of machine_is() calls everywhere?

Sounds perfect. ;)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
