From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the
 'interesting' ones.
Date: Tue, 17 Sep 2013 13:07:30 +0100
Message-ID: <20130917120730.GW16984@lee--X1>
References: <52345182.1080609@kernel.org>
 <52372F2B.3030504@gmail.com>
 <20130917081003.GU16984@lee--X1>
 <20130917112433.GB26737@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130917112433.GB26737-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2013, Mark Rutland wrote:

> On Tue, Sep 17, 2013 at 09:10:03AM +0100, Lee Jones wrote:
> > > > http://marc.info/?l=3Dlinux-iio&m=3D137881790217809&w=3D2
> > >=20
> > > Looks reasonable. My only comment is '-' is preferred over '_'.
> >=20
> > Ah, in the node name you mean. Yes, I can change that.
> >=20
> > The compatible string has to stay the same however, as it has to ma=
tch
> > the device name which can't be changed due to possible userspace
> > breakage.
>=20
> I'm not sure I follow why the compatible string must be identical to =
the
> name appearing to userspace.

It doesn't. It has to be identical to the device name, which I'm
guessing is used when populating sysfs.

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
