From: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: potentiometer: mcp4531: Add device tree binding
Date: Thu, 23 Jun 2016 10:50:37 +0200
Message-ID: <576BA2DD.2060501@heig-vd.ch>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492137-32683-4-git-send-email-florian.vaussard@heig-vd.ch>
 <bf4dbd64-aac8-aba3-ec5c-4cd4d0e848f6@axentia.se>
 <829a4507-39d7-e04a-9672-6309def89ee2@heig-vd.ch>
 <dfdbc7dd-8457-c0ef-9f0e-e2c1d96e5b11@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dfdbc7dd-8457-c0ef-9f0e-e2c1d96e5b11-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaussard Florian <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Peter,

On 06/22/2016 09:06 AM, Peter Rosin wrote:
> On 2016-06-22 08:22, Florian Vaussard wrote:
>> Hello Peter,
>>
>> Le 21. 06. 16 =E0 09:51, Peter Rosin a =E9crit :
>>> That is, if you need this patch at all, see my reply to 2/3...
>>>
>>
>> This seems necessary in order to have the vendor ID in the compatibl=
e string.
>=20
> Hmm, I don't think so. The way I read the response from Rob was that
> *my* device tree snippet should not assume that the i2c subsystem
> ignores the vendor. So, I think that even w/o this patch a DT entry
> like
>=20
> 		mcp4651-104@28 {
> 			compatible =3D "microchip,mcp4651-104";
> 			reg =3D <0x28>;
> 		};
>=20
> will work, precisely since i2c ignores the microchip, part (and thus
> allows you to omit/misspell it). I.e. I think that Rob is concerned
> with how the DT is documented/defined, and not so much about how it
> is then implemented in Linux.
>=20

The way that I read Rob's reply is reverse: you should not rely on the =
matching
done by i2c subsystem and provide a proper of_device_id table instead.

I think that ignoring the vendor when matching the compatible, like wha=
t is
currently done by the i2c subsystem, is bad. What happens if you have t=
wo chips
from two companies with the same name (yes it happens)? You may need di=
fferent
data to address the small specificities of each chip, or even worse a d=
ifferent
driver at all. This implies that we should explicitly match the vendor =
as well,
otherwise we would be unable to cope with such cases.

Moreover, if we look at the current i2c drivers, a whole bunch of them =
already
have a of_device_id table:

(on v4.6)

$ git grep -l i2c_device_id | wc -l
636
$ git grep -l i2c_device_id | xargs grep -l 'of_device_id' | wc -l
197

Currently 30% of all i2c drivers explicitly declare DT compatible strin=
gs. And I
am sure that this number will keep increasing as drivers are converted =
to DT.

Regards,
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
