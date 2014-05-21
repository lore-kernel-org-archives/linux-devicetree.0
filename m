From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mfd: bcm590xx: add support for secondary I2C
 slave address
Date: Wed, 21 May 2014 10:26:27 +0100
Message-ID: <20140521092626.GF6679@lee--X1>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-3-git-send-email-mporter@linaro.org>
 <20140428115627.GY21279@lee--X1>
 <20140428140910.GB7719@beef>
 <20140520161131.GB32025@lee--X1>
 <20140520190055.GQ12304@sirena.org.uk>
 <20140520202923.GT32082@beef>
 <20140520214439.GS12304@sirena.org.uk>
 <20140520215726.GU32082@beef>
 <20140520221758.GH12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140520221758.GH12304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 20 May 2014, Mark Brown wrote:

> On Tue, May 20, 2014 at 05:57:26PM -0400, Matt Porter wrote:
> > On Tue, May 20, 2014 at 10:44:39PM +0100, Mark Brown wrote:
>=20
> > > I looked at that but it seems I already acked the regulator part =
of the
> > > series and nothing else looked immediately relevant?
>=20
> > The series has cross dependencies (shared header include) and thus =
needs
> > to have both the mfd and regulator portions merged together. You ha=
d
> > mentioned in the v1 version that you'd like to take it through the
> > regulator tree and so Lee's comments earlier were with regard to yo=
u
> > taking the mfd portions.
>=20
> Right, OK - because it depends on the earlier MFD patches (I think?) =
I
> was expecting it to be applied in MFD and merged over to regulator.

Great, that's all I needed to know.  I'm on it.

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
