From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: imx: make the imx timer driver implementation
 independent of SoCs.
Date: Wed, 29 Apr 2015 18:25:27 +0300
Message-ID: <20150429152527.GH2258@tarshish>
References: <1430316881-4668-1-git-send-email-shenwei.wang@freescale.com>
 <20150429142614.GE2258@tarshish>
 <BL2PR03MB3703DA9D4D52EC9524D627C83D70@BL2PR03MB370.namprd03.prod.outlook.com>
 <20150429150824.GF2258@tarshish>
 <BL2PR03MB37005C844BCB89007D176F683D70@BL2PR03MB370.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BL2PR03MB37005C844BCB89007D176F683D70-AZ66ij2kwaY73p3xB2dGY+O6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shenwei Wang <Shenwei.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shenwei Wang,
On Wed, Apr 29, 2015 at 03:19:19PM +0000, Shenwei Wang wrote:
> > -----Original Message-----
> > From: Baruch Siach [mailto:baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org]
> > Sent: 2015=E5=B9=B44=E6=9C=8829=E6=97=A5 10:08
> > To: Wang Shenwei-B38339
> > Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH 1/1] ARM: imx: make the imx timer driver implem=
entation
> > independent of SoCs.
> >
> > When several SoC share the same IP block the usual convention is to=
 name=20
> > it in
> > the compatible property string after the first SoC it appeared on. =
Just look at
> > some binding documentation from Documentation/devicetree/bindings/t=
imer/ to
> > find examples. The allwinner,sun5i-a13-hstimer property is shared b=
y A10s and
> > A13 SoCs. The amlogic,meson6-timer is shared by Meson6 and Meson8 S=
oCs, and
> > so on.
>
> If the same IP block is shared with several SoCs, why we gave them di=
fferent compatible=20
> strings? If no changes in an IP block, I assume no changes in the rel=
ating driver as well.=20
> In this assumption, I don't see any need to introduce a new compatibl=
e string for an=20
> unchanged IP block in a new SoC.

That is exactly what I meant to say. Sorry that I was not clear enough.

When the same IP block is used in a newer generation SoC the same compa=
tible=20
property string is used. For that reason you can find in sun5i-a10s.dts=
i the=20
line

	compatible =3D "allwinner,sun5i-a13-hstimer";

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
