From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH v3 1/4] edac: Add an function to retrieve the EDAC
 debugfs node
Date: Thu, 13 Aug 2015 10:41:50 +0200
Message-ID: <20150813104150.2c084a8c@ipc1.ka-ro>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
	<1439326077-25507-2-git-send-email-lho@apm.com>
	<20150812101219.GC14011@nazgul.tnic>
	<20150812104954.GD14011@nazgul.tnic>
	<CAPw-ZT=AFtyLt4CNGBzLZcdPr-ekJpQxKA4Y_AiDzqKfhF1-=w@mail.gmail.com>
	<CAPw-ZTkfAxqG6HQHU3WomrqRwXa+jyTWCg=ns1HKC323ds1yug@mail.gmail.com>
	<20150813081537.GB20004@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150813081537.GB20004-K5JNixvcfoxupOikMc4+xw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> On Wed, Aug 12, 2015 at 09:30:58PM -0700, Loc Ho wrote:
> > Okay... The 'inline' helps with the compiler warning. If I move all=
 to
> > header file with 'static inline' and wrapper around CONFIG_EDAC_DEB=
UG,
> > don't I need to export and declare the variable 'edac_debugfs'? Are
> > you okay with export this variable?
>=20
> You need to make edac_debugfs extern in the header and define it in
> edac_mc_sysfs.c.
>=20
> But that's ok because edac_core.h will be included only by EDAC drive=
rs
> and they're supposed to see edac_debugfs anyway...
>=20
What's the point in having an accessor function that returns a driver
internal variable when this variable is exported anyway?
This will only further inconsistencies because half of the users will
use the variable directly and the other half will use the accessor
function.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
