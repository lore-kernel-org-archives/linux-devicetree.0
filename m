From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: imx: make the imx timer driver implementation
 independent of SoCs.
Date: Wed, 29 Apr 2015 18:08:24 +0300
Message-ID: <20150429150824.GF2258@tarshish>
References: <1430316881-4668-1-git-send-email-shenwei.wang@freescale.com>
 <20150429142614.GE2258@tarshish>
 <BL2PR03MB3703DA9D4D52EC9524D627C83D70@BL2PR03MB370.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BL2PR03MB3703DA9D4D52EC9524D627C83D70-AZ66ij2kwaY73p3xB2dGY+O6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shenwei Wang <Shenwei.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shenwei Wang,

On Wed, Apr 29, 2015 at 02:55:52PM +0000, Shenwei Wang wrote:
> > -----Original Message-----
> > From: Baruch Siach [mailto:baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org]
> > Sent: 2015=E5=B9=B44=E6=9C=8829=E6=97=A5 9:26
> > To: Wang Shenwei-B38339
> > Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH 1/1] ARM: imx: make the imx timer driver implem=
entation
> > independent of SoCs.
> >=20
> > On Wed, Apr 29, 2015 at 09:14:41AM -0500, Shenwei Wang wrote:
> > > There are 4 versions of the timer hardware on Freescale MXC hardw=
are.
> > > --Version 0: MX1/MXL
> > > --Version 1: MX21, MX27.
> > > --Version 2: MX25, MX31, MX35, MX37, MX51, MX6Q
> > > --Version 3: MX6DL, MX6SX
> > >
> > > This patch has removed the SoC related codes, and implemented the
> > > driver directly upon the hardware timer IP version.
> > >
> > > The new driver can be installed via device tree or the direct fun=
ction
> > > call to mxc_timer_init in order to support imx legacy systems lik=
e
> > > MX21 and MX27.
> > >
> > > For the device tree implementation, the driver is compatible with=
 the
> > > current bindings like "fsl,imx6q-gpt", but for future dts file, t=
he
> > > string like "fsl,imx-gpt-v2" without SoC information is recommend=
ed.
> >=20
> > That is not the usual convention for IP block versions.
> >=20
> > Please Cc the devicetree list (added).
>
> Thank you for the comments. What is the current naming rules for IP b=
lock=20
> version? It would be appreciated if you could provide an example.

When several SoC share the same IP block the usual convention is to nam=
e it in=20
the compatible property string after the first SoC it appeared on. Just=
 look=20
at some binding documentation from Documentation/devicetree/bindings/ti=
mer/ to=20
find examples. The allwinner,sun5i-a13-hstimer property is shared by A1=
0s and=20
A13 SoCs. The amlogic,meson6-timer is shared by Meson6 and Meson8 SoCs,=
 and so=20
on.

baruch

--=20
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Sy=
stems
=3D}------------------------------------------------ooO--U--Ooo--------=
----{=3D
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
