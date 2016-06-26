From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: potentiometer: mcp4531: Add device tree binding
Date: Sun, 26 Jun 2016 15:53:14 +0100
Message-ID: <6d0f2f31-7d9f-5b6b-b244-d976c4d3cd0d@kernel.org>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492137-32683-4-git-send-email-florian.vaussard@heig-vd.ch>
 <bf4dbd64-aac8-aba3-ec5c-4cd4d0e848f6@axentia.se>
 <829a4507-39d7-e04a-9672-6309def89ee2@heig-vd.ch>
 <dfdbc7dd-8457-c0ef-9f0e-e2c1d96e5b11@axentia.se>
 <576BA2DD.2060501@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576BA2DD.2060501-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/06/16 09:50, Florian Vaussard wrote:
> Hello Peter,
>=20
> On 06/22/2016 09:06 AM, Peter Rosin wrote:
>> On 2016-06-22 08:22, Florian Vaussard wrote:
>>> Hello Peter,
>>>
>>> Le 21. 06. 16 =E0 09:51, Peter Rosin a =E9crit :
>>>> That is, if you need this patch at all, see my reply to 2/3...
>>>>
>>>
>>> This seems necessary in order to have the vendor ID in the compatib=
le string.
>>
>> Hmm, I don't think so. The way I read the response from Rob was that
>> *my* device tree snippet should not assume that the i2c subsystem
>> ignores the vendor. So, I think that even w/o this patch a DT entry
>> like
>>
>> 		mcp4651-104@28 {
>> 			compatible =3D "microchip,mcp4651-104";
>> 			reg =3D <0x28>;
>> 		};
>>
>> will work, precisely since i2c ignores the microchip, part (and thus
>> allows you to omit/misspell it). I.e. I think that Rob is concerned
>> with how the DT is documented/defined, and not so much about how it
>> is then implemented in Linux.
>>
>=20
> The way that I read Rob's reply is reverse: you should not rely on th=
e matching
> done by i2c subsystem and provide a proper of_device_id table instead=
=2E
The original 'quirk' of matching in i2c and spi based on the part numbe=
r
alone has been the source of much grief.  Unfortunately it is there
and there are numerous device trees out there using it.

The preferred option is a nice conventional table as you added in patch=
 2.

We just haven't gotten round to updating all the drivers yet and as it
'works' right now there is little motivation to do it unless someone is
working on the driver as you are.
>=20
> I think that ignoring the vendor when matching the compatible, like w=
hat is
> currently done by the i2c subsystem, is bad. What happens if you have=
 two chips
> from two companies with the same name (yes it happens)? You may need =
different
> data to address the small specificities of each chip, or even worse a=
 different
> driver at all. This implies that we should explicitly match the vendo=
r as well,
> otherwise we would be unable to cope with such cases.
Exactly and it's already happened I believe... With two totally differe=
nt parts
having the same part number rather than the similar ones case.
>=20
> Moreover, if we look at the current i2c drivers, a whole bunch of the=
m already
> have a of_device_id table:
>=20
> (on v4.6)
>=20
> $ git grep -l i2c_device_id | wc -l
> 636
> $ git grep -l i2c_device_id | xargs grep -l 'of_device_id' | wc -l
> 197
>=20
> Currently 30% of all i2c drivers explicitly declare DT compatible str=
ings. And I
> am sure that this number will keep increasing as drivers are converte=
d to DT.
>=20
> Regards,
> Florian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
