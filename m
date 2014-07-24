From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/11] ARM: dts: zynq: Update deprecated xuartps clock
 names
Date: Thu, 24 Jul 2014 16:24:49 -0700
Message-ID: <50aad941-92d9-428a-a708-77040e24b651@BY2FFO11FD008.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-5-git-send-email-afaerber@suse.de>
 <82ab6426-211e-451e-99c3-df40dbea817e@BN1AFFO11FD039.protection.gbl>
 <53D1931C.7080409@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53D1931C.7080409-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-25 at 01:13AM +0200, Andreas F=C3=A4rber wrote:
> Am 25.07.2014 01:09, schrieb S=C3=B6ren Brinkmann:
> > On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
> >> Avoids deprecation warning messages.
> >=20
> > A patch that updates those names is already in armsoc.
>=20
> Which tree/branch should I base this series on then? It seemed the
> Xilinx branches were all heavily outdated some days ago, so this is
> against vanilla v3.16-rc6.

That is something for the maintainers to answer. But in general, you're
adding a lot of stuff that is not yet upstream, AFAIK. Some is still
under review I think (like QSPI), others are just staged for the next
merge window and parts are still in flight. Michal hopefully has a
better overview.
This particular patch can simply be omitted I think.

	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
