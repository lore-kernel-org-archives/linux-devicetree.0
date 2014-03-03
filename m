From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 0/7] Convert twl4030-madc to IIO API and add DT support
Date: Mon, 3 Mar 2014 16:00:01 +0800
Message-ID: <20140303080001.GH4674@lee--X1>
References: <1393374270-20079-1-git-send-email-sre@debian.org>
 <1393444990-28140-1-git-send-email-sre@debian.org>
 <5311CA14.6080009@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5311CA14.6080009-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 01 Mar 2014, Jonathan Cameron wrote:

> On 26/02/14 20:03, Sebastian Reichel wrote:
> >Hi,
> >
> >This is RFCv4 for converting twl4030-madc to the IIO API and
> >adding DT support. The patchset compiles and has been tested
> >on my Nokia N900.
> >
> >Changes since RFCv3 [0]:
> >  * Added Acked-by from Lee Jones (MFD subsystem maintainer)
> >    to twl_i2c_read/write_u16 patches
> >  * Fixed style issues found by Lee Jones
> >    This readded the temp variable Jonathan Cameron wanted to
> >    be removed, but makes the code cleaner - especially once
> >    the brackets for math for clarity are added.
> >  * Tested with converted rx51-battery driver on Nokia N900,
> >    which can be found at [1].
> >
> >[0] https://lkml.org/lkml/2014/2/25/627
> >[1] https://lkml.org/lkml/2014/2/25/639
>=20
> Hi All,
>=20
> Obviously there are a few outstanding bits and pieces to be addressed=
=2E
>=20
> To get this lined up for a merge...
>=20
> Lee, do you want to take this through mfd or shall I take it through
> IIO?  I don't mind either way.  It stands pretty separate in IIO so
> shouldn't cause any merge issues beyond minor fuzz.

I'm happy to take it through MFD with your Ack.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
