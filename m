From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk/zynq/clkc: Add 'fclk-enable' feature
Date: Mon, 28 Oct 2013 14:43:35 -0700
Message-ID: <b7840a0d-ac49-4c2d-beaa-9f79748c70d0@CH1EHSMHS006.ehs.local>
References: <1381425018-5653-1-git-send-email-soren.brinkmann@xilinx.com>
 <1592656.1ojHcSlzVh@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1592656.1ojHcSlzVh@flatron>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 28, 2013 at 10:13:28PM +0100, Tomasz Figa wrote:
> Hi Soren,
>=20
> On Thursday 10 of October 2013 10:10:17 Soren Brinkmann wrote:
> > In some use cases Zynq's FPGA clocks are used as static clock
> > generators for IP in the FPGA part of the SOC for which no Linux dr=
iver
> > exists and would control those clocks. To avoid automatic
> > gating of these clocks in such cases a new property - fclk-enable -=
 is
> > added to the clock controller's DT description to accomodate such u=
se
> > cases. It's value is a bitmask, where a set bit results in enabling
> > the corresponding FCLK through the clkc.
> >=20
> > FPGA clocks are handled following the rules below:
> >=20
> > If an FCLK is not enabled by bootloaders, that FCLK will be disable=
d in
> > Linux. Drivers can enable and control it through the CCF as usual.
> >=20
> > If an FCLK is enabled by bootloaders AND the corresponding bit in t=
he
> > 'fclk-enable' DT property is set, that FCLK will be enabled by the =
clkc,
> > resulting in an off by one reference count for that clock. Ensuring=
 it
> > will always be running.
> >=20
> > Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> > v2:
> >  - change default value for fclk-enable to '0'
> > ---
> >  Documentation/devicetree/bindings/clock/zynq-7000.txt |  4 ++++
> >  drivers/clk/zynq/clkc.c                               | 18
> > +++++++++++++++--- 2 files changed, 19 insertions(+), 3 deletions(-=
)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/zynq-7000.txt
> > b/Documentation/devicetree/bindings/clock/zynq-7000.txt index
> > d99af878f5d7..11fdd146ec83 100644
> > --- a/Documentation/devicetree/bindings/clock/zynq-7000.txt
> > +++ b/Documentation/devicetree/bindings/clock/zynq-7000.txt
> > @@ -22,6 +22,10 @@ Required properties:
> >  Optional properties:
> >   - clocks : as described in the clock bindings
> >   - clock-names : as described in the clock bindings
> > + - fclk-enable : Bit mask to enable FCLKs in cases no proper CCF
>=20
> Since it's a vendor specific property, it should include vendor prefi=
x.
The whole driver is vendor specific. Should there really be another
prefix for that property?

>=20
> Also CCF is a Linux-specific implementation detail, which DT bindings
> should not be involved into. If you really need to implement this usi=
ng
> this way, then at least property description should say something lik=
e=20
> this:
>=20
> xlnx,fclk-enable : Bit mask of bits of fclk enable register that must
> be statically enabled at boot-up time.
=46air enough. I'll change the description

>=20
> However, I wonder why you can't simply define an FPGA block using a s=
ingle=20
> node, which would be a consumer to all the fclk clocks you need to en=
able=20
> and then make a driver for it that would simply enable all clocks=20
> specified in clocks property.
Well, then we'd have a dummy driver that wouldn't fit into any subsyste=
m
and wouldn't do anything but enabling clocks. Seems much easier to
handle it in this driver. Especially, since I hope that this is just a
workaround and that the majority of use cases involves drivers for thei=
r
soft-IP that simply uses the CCF.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
