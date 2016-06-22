From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: potentiometer: mcp4531: Add device tree binding
Date: Wed, 22 Jun 2016 09:06:16 +0200
Message-ID: <dfdbc7dd-8457-c0ef-9f0e-e2c1d96e5b11@axentia.se>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492137-32683-4-git-send-email-florian.vaussard@heig-vd.ch>
 <bf4dbd64-aac8-aba3-ec5c-4cd4d0e848f6@axentia.se>
 <829a4507-39d7-e04a-9672-6309def89ee2@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <829a4507-39d7-e04a-9672-6309def89ee2-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-06-22 08:22, Florian Vaussard wrote:
> Hello Peter,
>=20
> Le 21. 06. 16 =E0 09:51, Peter Rosin a =E9crit :
>> That is, if you need this patch at all, see my reply to 2/3...
>>
>=20
> This seems necessary in order to have the vendor ID in the compatible=
 string.

Hmm, I don't think so. The way I read the response from Rob was that
*my* device tree snippet should not assume that the i2c subsystem
ignores the vendor. So, I think that even w/o this patch a DT entry
like

		mcp4651-104@28 {
			compatible =3D "microchip,mcp4651-104";
			reg =3D <0x28>;
		};

will work, precisely since i2c ignores the microchip, part (and thus
allows you to omit/misspell it). I.e. I think that Rob is concerned
with how the DT is documented/defined, and not so much about how it
is then implemented in Linux.

I haven't actually tested that though, so I may be completely wrong
in all of the above statements...

Cheers,
Peter
