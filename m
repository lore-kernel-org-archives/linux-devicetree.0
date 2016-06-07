From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v5 1/2] drm/bridge: Add sii902x driver
Date: Tue, 7 Jun 2016 02:40:56 +0000
Message-ID: <HE1PR04MB10516B0A27EEBFDA8019C1A1EC5D0@HE1PR04MB1051.eurprd04.prod.outlook.com>
References: <1464879601-30569-1-git-send-email-boris.brezillon@free-electrons.com>
	<CACvgo51VRL=Ewbvx-sbwfLoPm00rDUEJ3mvk8Rc0T4WKC=UThA@mail.gmail.com>
 <20160603120238.76dc9380@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160603120238.76dc9380@bbrezillon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Huan Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

Sorry for reply late, I was on PTO. And another PTO on  June 9~11, 2016=
=2EUTC+8

>
> > > +       gpiod_set_value(sii902x->reset_gpio, 1);
> > > +
> > > +       msleep(100);
> > Ouch that is some juicy number. Can we get a comment with
> > reasoning/origin of it ?
>=20
> As already explained to Maxime, I just don't know why this is needed,=
 simply
> because I don't have access to the datasheet and I just based my
> implementation on another driver.
> I can add a comment stating that this was extracted from another
> implementation, but with no explanation on why this is needed.
>=20
> Meng, do you have any information about startup-time, or something li=
ke that?
>=20

I had checked the datasheet of sii9022a, which said the Min of TRESET i=
s 100 =ECs, and Max is not specified.

Regards,
Meng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
