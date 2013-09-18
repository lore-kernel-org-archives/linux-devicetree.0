From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: zynq: Enable arm_global_timer
Date: Wed, 18 Sep 2013 10:05:18 -0700
Message-ID: <9c796de2-4f19-4104-ae69-60f963a65d03@CH1EHSMHS028.ehs.local>
References: <1379004640-15117-1-git-send-email-soren.brinkmann@xilinx.com>
 <1379004640-15117-3-git-send-email-soren.brinkmann@xilinx.com>
 <20130915124036.A66A8C42C3C@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130915124036.A66A8C42C3C-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 15, 2013 at 01:40:36PM +0100, Grant Likely wrote:
> On Thu, 12 Sep 2013 09:50:40 -0700, Soren Brinkmann <soren.brinkmann@=
xilinx.com> wrote:
> > Zynq is based on an ARM Cortex-A9 MPCore, which features the
> > arm_global_timer in its SCU. Therefore enable the timer for Zynq.
> >=20
> > Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/zynq-7000.dtsi | 8 ++++++++
> >  arch/arm/mach-zynq/Kconfig       | 1 +
> >  2 files changed, 9 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/z=
ynq-7000.dtsi
> > index e32b92b..eaacb39 100644
> > --- a/arch/arm/boot/dts/zynq-7000.dtsi
> > +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> > @@ -92,6 +92,14 @@
> >  			};
> >  		};
> > =20
> > +		global_timer: global_timer@f8f00200 {
>=20
> Nit: node names and property names use '-' not '_'. Plus the generic
> names principle suggests the node should be names 'timer' not
> 'global_timer'. The following would be fine:
That is really good to know. When I wrote this line, I read through a
couple of other dtses and was unable to identify a consistent system
behind node/label names.

>=20
> 		global_timer: timer@f8f00200 {
All right, I'll change it to this.

=09
	Thanks,
	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
