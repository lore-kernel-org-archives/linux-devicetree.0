From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ARM: zynq: DT: Add 'clock-latency' property
Date: Fri, 11 Apr 2014 12:41:02 -0700
Message-ID: <34776df5-5255-4d58-a5ab-83f2017e16fc@AM1EHSMHS018.ehs.local>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com>
 <1396653256-28397-2-git-send-email-soren.brinkmann@xilinx.com>
 <53423BB6.7010508@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53423BB6.7010508-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-04-07 at 07:46AM +0200, Michal Simek wrote:
> On 04/05/2014 01:14 AM, Soren Brinkmann wrote:
> > Specify the 'clock-latency' property to avoid certain cpufreq gover=
nors
> > from refusing to work with the following error:
> >   ondemand governor failed, too long transition latency of HW, fall=
back to performance governor
> >=20
> > Reported-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
> > Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Tested-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
> > Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> > This is a fix from our vendor tree
> >=20
> > Changes in v2:
> >  - This patch has been added
> >=20
> > ---
> >  arch/arm/boot/dts/zynq-7000.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Applied to zynq-dt.

Actually, this should probably go in as fix into the current (3.15)
release cycle.

	Thanks,
	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
