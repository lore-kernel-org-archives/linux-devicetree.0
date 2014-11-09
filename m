From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: zynq: Enable PL clocks for Parallella
Date: Sat, 8 Nov 2014 16:58:02 -0800
Message-ID: <20141109005802.GE13855@quad.lixom.net>
References: <1415294531-8942-1-git-send-email-afaerber@suse.de>
 <eca8ae5de8184151b03d3fd8d23c62a7@BY2FFO11FD010.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <eca8ae5de8184151b03d3fd8d23c62a7-neA4ZlFjCT2P1V7ZRuPZVmYJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 07, 2014 at 07:44:16AM +0100, Michal Simek wrote:
> On 11/06/2014 06:22 PM, Andreas F=E4rber wrote:
> > The Parallella board comes with a U-Boot bootloader that loads one =
of
> > two predefined FPGA bitstreams before booting the kernel. Both defi=
ne an
> > AXI interface to the on-board Epiphany processor.
> >=20
> > Enable clocks FCLK0..FCLK3 for the Programmable Logic by default.
> >=20
> > Otherwise accessing, e.g., the ESYSRESET register freezes the board=
,
> > as seen with the Epiphany SDK tools e-reset and e-hw-rev, using /de=
v/mem.
> >=20
> > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.17.x
> > Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> > ---
> >  Michal/Olof, please consider this trivial patch as a fix for 3.18.
>=20
> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
> Olof, Arnd: Can you please pick this directly?

Done, applied to fixes.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
