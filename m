From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: Support SiRF audio modules
Date: Tue, 11 Mar 2014 05:49:26 +0000
Message-ID: <20140311054926.GA2839@lee--X1>
References: <1394184531-7679-1-git-send-email-rongjun.ying@csr.com>
 <20140310103532.GI14976@lee--X1>
 <5EB3BFCD089AD643B9BB63439F5FD5E9012BE2D157@SHAASIEXM01.ASIA.ROOT.PRI>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5EB3BFCD089AD643B9BB63439F5FD5E9012BE2D157-W2enlP78h2wYZnBWG7VmBdnKn0HB1kRyVQQcQy+6Uvc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <Barry.Song-kQvG35nSl+M@public.gmane.org>
Cc: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DL-SHA-WorkGroupLinux <DL-SHA-WorkGroupLinux-z7JfP6tgrtVrifDez5n5bw@public.gmane.org>, Rongjun Ying <Rongjun.Ying-kQvG35nSl+M@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > diff --git a/include/linux/mfd/sirf/audio.h b/include/linux/mfd/s=
irf/audio.h
> > > new file mode 100644
> > > index 0000000..d8cfff9
> > > --- /dev/null
> > > +++ b/include/linux/mfd/sirf/audio.h
> > > @@ -0,0 +1,17 @@
> > > +/*
> > > + * audio.h
> > > + *
> > > + * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc=
 group
> > company.
> > > + *
> > > + * Licensed under GPLv2 or later.
> > > + */
> >=20
> > Use a standard header please
>=20
> I think this has been a standard header. It is one simpler version fo=
r license.
> If there is any problem here, it should be the 1st line, we might rep=
lace audio.h by a simple description of this file.

My issue wasn't with the license, but the header in general. It
started off without a proper name for the driver followed by no
description of the code, then I noticed the author (who is listed
at the bottom) is not mentioned. My issue is that it's sparse and
uninformative.

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
