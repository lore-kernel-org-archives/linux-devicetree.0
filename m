From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: Support SiRF audio modules
Date: Mon, 10 Mar 2014 16:31:58 +0000
Message-ID: <20140310163158.GI13661@lee--X1>
References: <1394184531-7679-1-git-send-email-rongjun.ying@csr.com>
 <20140310103532.GI14976@lee--X1>
 <CAByv0RNQrPitsfcAwMvn=eZ1hNSaii=jw94H68rQvfQXnjYz9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAByv0RNQrPitsfcAwMvn=eZ1hNSaii=jw94H68rQvfQXnjYz9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >> +     if (of_device_is_compatible(pdev->dev.of_node,
> >> +                     "sirf,prima2-audio")) {
> >> +             cell =3D sirf_audio_prima2_devs;
> >> +             cell_number =3D ARRAY_SIZE(sirf_audio_prima2_devs);
> >
> > s/cell_number/n_devs
> >
> >> +     } else if (of_device_is_compatible(pdev->dev.of_node,
> >> +                     "sirf,atlas6-audio")) {
> >> +             cell =3D sirf_audio_atlas6_devs;
> >> +             cell_number =3D ARRAY_SIZE(sirf_audio_atlas6_devs);
> >
> > s/cell_number/n_devs
> >
> >> +     } else
> >> +             return -EINVAL;
> >
> > I'm not sure there's any need for this. Why don't you just parse th=
e
> > child nodes? Are you even sure you need an MFD at all? It appears
> > you're just using an MFD to share a regmap. Seems like over-kill to=
 me.
>=20
> In my case, the prima2 and atlas6 codec have small different. But
> they use the same register address space.
> The sound codec driver need know what codec device is applied.

Mark,

I understand it was you who made the original request for the regmap
to be shared between devices. Was it an MFD that you had in mind?

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
