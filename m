From: Roman Volkov <v1ron-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH v3 RESEND 0/2] WM8505/WM8650 DT fixes for SD card
 controller
Date: Fri, 1 Jan 2016 20:32:30 +0300
Message-ID: <20160101203230.1dc5e655@v1ron-s7>
References: <1451655492-2569-1-git-send-email-v1ron@mail.ru>
	<7786478.TezhYjHkEF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7786478.TezhYjHkEF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux+armsoc-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=D0=92 Fri, 01 Jan 2016 15:29:29 +0100
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On Friday 01 January 2016 16:38:10 Roman Volkov wrote:
> > From: Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
> >=20
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
> >  =20
>=20
> Applied both to next/dt, thanks a lot for following up!
>=20
> Let me know if you think this should go into stable backports as well=
,
> I did not apply it to the fixes branch as you don't have a
> 'Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org' tag and it has never worked so far.

Yes, this must go into the stable too. Let me know if I must change
something or resend.

Thanks,
Roman
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
