From: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [alsa-devel][PATCH 1/2] mfd: arizona: Add support for OUTn_MONO
 register control
Date: Thu, 18 Dec 2014 16:42:58 +0900
Message-ID: <20141218164258.6785ca4e@songinha-Samsung-DeskTop-System>
References: <1418030422-27061-1-git-send-email-ideal.song@samsung.com>
 <1418030422-27061-2-git-send-email-ideal.song@samsung.com>
 <20141209085717.GT3951@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141209085717.GT3951@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, ckeepax-yzvPICuk2ABX+icLlh6Yhe4GMZTVgNySAL8bYrjMMd8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
Sorry for the late reply.

On Tue, 09 Dec 2014 08:57:17 +0000
Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On Mon, 08 Dec 2014, Inha Song wrote:
>=20
> > Some boards need to set the OUTn_MONO register to configurates
> > the output signal path as a mono differential output. This
> > wlf,out-mono property is optional. If present, values must be
> > specified less than or equal to the number of output signals.
> > If values less than the number of output signals, elements
> > that has not been specified are set to 0 by default.
> >=20
> > Example:
> >  - wlf,out-mono =3D <1 0 1>; /* set OUT1,OUT3 to mono differential =
*/
> >=20
> > Signed-off-by: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/mfd/arizona-core.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.=
c
> > index bce7c07..117be32 100644
> > --- a/drivers/mfd/arizona-core.c
> > +++ b/drivers/mfd/arizona-core.c
> > @@ -561,6 +561,16 @@ static int arizona_of_get_core_pdata(struct ar=
izona *arizona)
> >  		count++;
> >  	}
> > =20
> > +	count =3D 0;
> > +	of_property_for_each_u32(arizona->dev->of_node, "wlf,out-mono", p=
rop,
> > +				 cur, val) {
>=20
> Nit: Can you break after the first parameter instead?
>=20
> > +		if (count =3D=3D ARRAY_SIZE(arizona->pdata.out_mono))
>=20
> It's better practise to use ">=3D".

OK, I will fix this.

Best Regards,
Inha Song.

>=20
> > +			break;
> > +
> > +		arizona->pdata.out_mono[count] =3D !!val;
> > +		count++;
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
