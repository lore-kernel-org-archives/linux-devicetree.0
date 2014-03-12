From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mfd: add bcm590xx pmu driver
Date: Wed, 12 Mar 2014 09:23:55 +0000
Message-ID: <20140312092355.GB5672@lee--X1>
References: <1394552775-31264-1-git-send-email-mporter@linaro.org>
 <1394552775-31264-3-git-send-email-mporter@linaro.org>
 <20140311160837.GP21216@lee--X1>
 <20140311221938.GO25092@beef>
 <20140311224517.GA5672@lee--X1>
 <20140311232545.GP25092@beef>
 <20140312004030.GH28112@sirena.org.uk>
 <20140312005748.GQ25092@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140312005748.GQ25092@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > > Are there any inter-patch dependencies in the set? If so, we sh=
ould
> > > > know about them so we can coordinate a sensible solution.
> >=20
> > > Yes, the regulator driver (3/5) that Mark applied is dependent on=
 this
> > > patch...the regulator driver includes include/linux/mfd/bcm590xx.=
h.
> >=20
> > There's no actual dependency though - the regulator driver can only=
 be
> > built if the MFD is enabled in Kconfig since it depends on it so un=
til
> > the MFD is present in the tree it won't get built.
>=20
> Oh, right. Lee, no dependencies then.

Perfect, I'll just apply the MFD patch.

We still need the DT guys to look over your document, so nothing will
be certain until a) we receive their Ack or b) enough time passes, so
we will review it between ourselves.

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
