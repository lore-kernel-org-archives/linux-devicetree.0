From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the
 'interesting' ones.
Date: Tue, 17 Sep 2013 14:48:41 +0100
Message-ID: <20130917134841.GX16984@lee--X1>
References: <52345182.1080609@kernel.org>
 <52372F2B.3030504@gmail.com>
 <20130917081003.GU16984@lee--X1>
 <20130917112433.GB26737@e106331-lin.cambridge.arm.com>
 <20130917120730.GW16984@lee--X1>
 <20130917133025.GD26737@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130917133025.GD26737-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2013, Mark Rutland wrote:

> On Tue, Sep 17, 2013 at 01:07:30PM +0100, Lee Jones wrote:
> > On Tue, 17 Sep 2013, Mark Rutland wrote:
> >=20
> > > On Tue, Sep 17, 2013 at 09:10:03AM +0100, Lee Jones wrote:
> > > > > > http://marc.info/?l=3Dlinux-iio&m=3D137881790217809&w=3D2
> > > > >=20
> > > > > Looks reasonable. My only comment is '-' is preferred over '_=
'.
> > > >=20
> > > > Ah, in the node name you mean. Yes, I can change that.
> > > >=20
> > > > The compatible string has to stay the same however, as it has t=
o match
> > > > the device name which can't be changed due to possible userspac=
e
> > > > breakage.
> > >=20
> > > I'm not sure I follow why the compatible string must be identical=
 to the
> > > name appearing to userspace.
> >=20
> > It doesn't. It has to be identical to the device name, which I'm
> > guessing is used when populating sysfs.
>=20
> I still don't understand why the device name must be identical to the
> compatible string.
>=20
> The string "st,lsm303dlh_magn" (with the "st," prefix) appears nowher=
e
> in v3.12-rc1

You're looking at an old patchset. We found out that the Snowball
schematic was actually incorrect and we have a LSM303DLHC.

git grep -i lsm303dlhc_magn v3.12-rc1
  drivers/iio/magnetometer/st_magn.h:
    #define LSM303DLHC_MAGN_DEV_NAME   "lsm303dlhc_magn"

> and the compatible string in the dt doesn't seem to get
> assigned to the device in the i2c core or in
> drivers/iio/magnetometer/st_magn_i2c.c.

It does:
  drivers/i2c/busses/*.c: of_i2c_register_devices();
  drivers/of/of_i2c.c:    |-> of_modalias_node();
                            |-> i2c_new_device();

> I don't see how the "st,lsm303dlh_magn" string could be getting to
> userspace already such that it could be relying on it.
>=20
> Am I missing something?
>=20
> Thanks,
> Mark.
>=20
> >=20

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
