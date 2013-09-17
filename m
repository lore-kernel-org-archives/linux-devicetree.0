From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the
 'interesting' ones.
Date: Tue, 17 Sep 2013 14:30:26 +0100
Message-ID: <20130917133025.GD26737@e106331-lin.cambridge.arm.com>
References: <52345182.1080609@kernel.org>
 <52372F2B.3030504@gmail.com>
 <20130917081003.GU16984@lee--X1>
 <20130917112433.GB26737@e106331-lin.cambridge.arm.com>
 <20130917120730.GW16984@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130917120730.GW16984@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 01:07:30PM +0100, Lee Jones wrote:
> On Tue, 17 Sep 2013, Mark Rutland wrote:
>=20
> > On Tue, Sep 17, 2013 at 09:10:03AM +0100, Lee Jones wrote:
> > > > > http://marc.info/?l=3Dlinux-iio&m=3D137881790217809&w=3D2
> > > >=20
> > > > Looks reasonable. My only comment is '-' is preferred over '_'.
> > >=20
> > > Ah, in the node name you mean. Yes, I can change that.
> > >=20
> > > The compatible string has to stay the same however, as it has to =
match
> > > the device name which can't be changed due to possible userspace
> > > breakage.
> >=20
> > I'm not sure I follow why the compatible string must be identical t=
o the
> > name appearing to userspace.
>=20
> It doesn't. It has to be identical to the device name, which I'm
> guessing is used when populating sysfs.

I still don't understand why the device name must be identical to the
compatible string.

The string "st,lsm303dlh_magn" (with the "st," prefix) appears nowhere
in v3.12-rc1, and the compatible string in the dt doesn't seem to get
assigned to the device in the i2c core or in
drivers/iio/magnetometer/st_magn_i2c.c.

I don't see how the "st,lsm303dlh_magn" string could be getting to
userspace already such that it could be relying on it.

Am I missing something?

Thanks,
Mark.

>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
