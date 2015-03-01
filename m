From: Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v3 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Sun, 1 Mar 2015 23:39:11 +0300
Message-ID: <20150301233911.2352ce48@v1ron-s7>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
	<1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
	<2119510.55A8Br1LeL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2119510.55A8Br1LeL@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=D0=92 Sun, 01 Mar 2015 20:52:55 +0100
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On Sunday 01 March 2015 19:06:45 Roman Volkov wrote:
> > This patch set enables SD controller support for WM8650 and
> > fixes minor errors in WM8505 Device Tree file.
> >=20
> > Changes in v3:
> > 1. Add minor fixes for WM8505 SDHC node
> >=20
> > Tested on both WM8505 and WM8650.
> >=20
> > Roman Volkov (2):
> >   dts: vt8500: Add SDHC node to DTS file for WM8650
> >   dts: vt8500: Fix errors in SDHC node for WM8505
> >=20
> >  arch/arm/boot/dts/wm8505.dtsi | 4 ++--
> >  arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
> >  2 files changed, 11 insertions(+), 2 deletions(-)
> >=20
> > --=20
> > Hi maintainers, I see my previous versions were not applied. Could
> > this little patch set be applied for the linux-next? I don't think
> > this is new functionality, this must be considered as bugfix for
> > existing Device Tree.
> >=20
> > Any other suggestions?
>=20
> According to the MAINTAINERS file, Tony Prisk should be the person to
> pick them up, but he was not the recipient of the mail.
>=20
> 	Arnd

Thanks for the tip. Tony probably need to add these files to his list
of maintained files. get_maintainer.pl doesn't mention him.

Roman
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
