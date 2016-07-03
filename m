From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] iio: potentiometer: mcp4531: Add device tree
 binding
Date: Sun, 3 Jul 2016 10:25:23 +0100
Message-ID: <8d501966-d2f3-7b0b-2d70-3f0a60802d99@kernel.org>
References: <1466972567-9580-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466972567-9580-4-git-send-email-florian.vaussard@heig-vd.ch>
 <68f532da-766d-d1f6-5528-f69b80fb41b6@axentia.se>
 <f05299bb-6404-fb3a-badc-4668a6600e08@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f05299bb-6404-fb3a-badc-4668a6600e08-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/06/16 06:30, Florian Vaussard wrote:
> Hi Peter,
>=20
> Le 27. 06. 16 =E0 00:12, Peter Rosin a =E9crit :
>> Hi Florian,
>>
>> On 2016-06-26 22:22, Florian Vaussard wrote:
>>> This patch adds the necessary device tree binding to allow DT probi=
ng of
>>> currently supported parts.
>>>
>>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>>> ---
>>>  drivers/iio/potentiometer/mcp4531.c | 273 ++++++++++++++++++++++++=
+++++++++++-
>>>  1 file changed, 272 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/iio/potentiometer/mcp4531.c b/drivers/iio/pote=
ntiometer/mcp4531.c
>>> index 2251173..bf7b853 100644
>>> --- a/drivers/iio/potentiometer/mcp4531.c
>>> +++ b/drivers/iio/potentiometer/mcp4531.c
>>> @@ -31,6 +31,8 @@
>>>  #include <linux/module.h>
>>>  #include <linux/i2c.h>
>>>  #include <linux/err.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> =20
>>>  #include <linux/iio/iio.h>
>>> =20
>>> @@ -188,12 +190,275 @@ static const struct iio_info mcp4531_info =3D=
 {
>>>  	.driver_module =3D THIS_MODULE,
>>>  };
>>> =20
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id mcp4531_of_match[] =3D {
>>> +	{
>>> +		.compatible =3D "microchip,mcp4531-502",
>>> +		.data =3D &mcp4531_cfg[MCP453x_502]
>>> +	},
>>
>> All this vertical whitespace makes this unreadable. I'd be
>> happier with either ignoring the 80 char rule, or skipping
>> the leading tab. I.e.
>>
>> 	{ .compatible =3D "microchip,mcp4531-502", .data =3D &mcp4531_cfg[M=
CP453x_502] },
>> 	{ .compatible =3D "microchip,mcp4531-103", .data =3D &mcp4531_cfg[M=
CP453x_103] },
>> 	{ .compatible =3D "microchip,mcp4531-503", .data =3D &mcp4531_cfg[M=
CP453x_503] },
>> 	...
>>
>> or
>>
>> { .compatible =3D "microchip,mcp4531-502", .data =3D &mcp4531_cfg[MC=
P453x_502] },
>> { .compatible =3D "microchip,mcp4531-103", .data =3D &mcp4531_cfg[MC=
P453x_103] },
>> { .compatible =3D "microchip,mcp4531-503", .data =3D &mcp4531_cfg[MC=
P453x_503] },
>> ...
>>
>> Or perhaps using a macro?
>>
>> #define MCP4531_COMPATIBLE(of_compatible, cfg) {	\
>> 		.compatible =3D of_compatible,		\
>> 		.data =3D &mcp4531_cfg[cfg],		\
>> }
>>
>> and then
>>
>> 	MCP4531_COMPATIBLE("microchip,mcp4531-502", MCP453x_502),
>> 	MCP4531_COMPATIBLE("microchip,mcp4531-103", MCP453x_103),
>> 	MCP4531_COMPATIBLE("microchip,mcp4531-503", MCP453x_503),
>> 	...
>>
>> Pick any of those, and you have my ack. Maybe Jonathan has an opinio=
n
>> on which is best?
>>
>=20
> The macro is my preferred one, as it makes things easier to read. Jon=
athan?
I'm fine with any of the options (or indeed the original line break hea=
vy
approach). Take your pick!

Jonathan
>=20
> Thanks for the suggestion!
>=20
> Best,
> Florian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
