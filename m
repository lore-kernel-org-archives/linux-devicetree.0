From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: zynq: DT: Add missing reference for ADC
Date: Wed, 24 Sep 2014 10:09:09 -0700
Message-ID: <6c7fde5f-aff1-41c1-8cde-b01b976aa9f3@BY2FFO11FD036.protection.gbl>
References: <fced9e56dc4ef8df9ead34f6444c010cc31c7a61.1411567289.git.michal.simek@xilinx.com>
 <20140924161814.GG13679@xsjandreislx>
 <f6b47676-f664-4b01-8c70-a526eb8d1931@BY2FFO11FD011.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f6b47676-f664-4b01-8c70-a526eb8d1931-neA4ZlFjCT2sSxJLu3NLlWYJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-09-24 at 07:06PM +0200, Michal Simek wrote:
> On 09/24/2014 06:18 PM, S=C3=B6ren Brinkmann wrote:
> > On Wed, 2014-09-24 at 04:01PM +0200, Michal Simek wrote:
> >> Add missing reference for ADC node.
> >>
> >> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>
> >>  arch/arm/boot/dts/zynq-7000.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/=
zynq-7000.dtsi
> >> index 772381fe07bb..fc90f47f9c03 100644
> >> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> >> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> >> @@ -64,7 +64,7 @@
> >>  		interrupt-parent =3D <&intc>;
> >>  		ranges;
> >>
> >> -		adc@f8007100 {
> >> +		adc: adc@f8007100 {
> > I think we enumerated all labels. I.e. 'adc0' is probably better.
>=20
> I was thinking about it and the reason I didn't use that adc0 was
> that it is unique and it is just one in PS. Maybe there could be anot=
her adc in PL
> but it will be probably automated not to use adc key world.
> For PL part names was depending on user description.
>=20
> Anyway logic was not to use enumerated label for unique IPs.
As you said yourself, due to having/being an FPGA and also the
extensibility of the platform via buses (including PCIe), I
would not consider any IP to be unique.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
