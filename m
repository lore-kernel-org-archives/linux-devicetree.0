From: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: potentiometer: mcp4531: Add device tree binding
Date: Wed, 22 Jun 2016 08:22:46 +0200
Message-ID: <829a4507-39d7-e04a-9672-6309def89ee2@heig-vd.ch>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492137-32683-4-git-send-email-florian.vaussard@heig-vd.ch>
 <bf4dbd64-aac8-aba3-ec5c-4cd4d0e848f6@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bf4dbd64-aac8-aba3-ec5c-4cd4d0e848f6-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaussard Florian <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Peter,

Le 21. 06. 16 =E0 09:51, Peter Rosin a =E9crit :
> On 2016-06-21 08:55, Florian Vaussard wrote:
>> This patch adds the necessary device tree binding to allow DT probin=
g of
>> currently supported parts.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>> ---
>>  drivers/iio/potentiometer/mcp4531.c | 83 ++++++++++++++++++++++++++=
++++++++++-
>>  1 file changed, 82 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/potentiometer/mcp4531.c b/drivers/iio/poten=
tiometer/mcp4531.c
>> index 2251173..41a1e46 100644
>> --- a/drivers/iio/potentiometer/mcp4531.c
>> +++ b/drivers/iio/potentiometer/mcp4531.c
>> @@ -31,6 +31,8 @@
>>  #include <linux/module.h>
>>  #include <linux/i2c.h>
>>  #include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> =20
>>  #include <linux/iio/iio.h>
>> =20
>> @@ -188,12 +190,84 @@ static const struct iio_info mcp4531_info =3D =
{
>>  	.driver_module =3D THIS_MODULE,
>>  };
>> =20
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id mcp45xx_of_match[] =3D {
>=20
> Should be named mcp4531_of_match, also the casting to void and
> then back to an integer type is ugly. Would it work to store a
> pointer directly into the mcp4531_cfg array instead? I.e.
>=20
> 	{ .compatible =3D "microchip,mcp4531-502", .data =3D &mcp4531_cfg[MC=
P453x_502] },
> etc
>=20
> and then adjust accordingly in mcp4531_probe()?
>=20

Yes the casting is pretty ugly. And kbuild agrees with you :) I took th=
is from
another driver (lame excuse). Your suggestion is sensible, I will give =
it a try.

> That is, if you need this patch at all, see my reply to 2/3...
>=20

This seems necessary in order to have the vendor ID in the compatible s=
tring.

Thanks for your review.

=46lorian
