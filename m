From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFCv2 1/3] docs: dts: Added documentation for Xilinx Zynq Reset
 Controller bindings.
Date: Wed, 29 Jul 2015 10:38:02 -0700
Message-ID: <20150729173802.GO2650@xsjsorenbubuntu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
 <20150728025833.GQ2650@xsjsorenbubuntu>
 <CAAtXAHejK2vL2qSdhqrtHmkV_RBfkLzQNM8ZbDvREvienNqzXw@mail.gmail.com>
 <20150728225337.GF2650@xsjsorenbubuntu>
 <CAAtXAHd8kG_FtKTW-2T2KToXesWgsgxkZ3vpXZ_oRjGCSfpFgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAtXAHd8kG_FtKTW-2T2KToXesWgsgxkZ3vpXZ_oRjGCSfpFgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-07-28 at 11:14PM -0700, Moritz Fischer wrote:
> Hi S=C3=B6ren,
>=20
> On Tue, Jul 28, 2015 at 3:53 PM, S=C3=B6ren Brinkmann
> <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > On Mon, 2015-07-27 at 09:52PM -0700, Moritz Fischer wrote:
> >> Hi S=C3=B6ren,
> >>
> >> thanks for your feedback.
> >>
> >> On Mon, Jul 27, 2015 at 7:58 PM, S=C3=B6ren Brinkmann
> >> <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >> > Hi Moritz,
> >> >
> >> > On Fri, 2015-07-24 at 05:21PM -0700, Moritz Fischer wrote:
> >> >> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/reset/zynq-reset-pl.txt | 13=
 +++++++++++++
> >> >>  1 file changed, 13 insertions(+)
> >> >>  create mode 100644 Documentation/devicetree/bindings/reset/zyn=
q-reset-pl.txt
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/reset/zynq-reset=
-pl.txt b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> >> >> new file mode 100644
> >> >> index 0000000..ac4499e
> >> >> --- /dev/null
> >> >> +++ b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> >> >> @@ -0,0 +1,13 @@
> >> >> +Xilinx Zynq PL Reset Manager
> >> >> +
> >> >> +Required properties:
> >> >> +- compatible: "xlnx,zynq-reset-pl"
> >> >> +- syscon <&slcr>;
> >> >> +- #reset-cells: 1
> >> >> +
> >> >> +Example:
> >> >> +     rstc: rstc@240 {
> >> >> +             #reset-cells =3D <1>;
> >> >> +             compatible =3D "xlnx,zynq-reset-pl";
> >> >> +             syscon =3D <&slcr>;
> >> >> +     };
> >> >
> >> > I think you also have to add the outputs and make them part of t=
he
> >> > binding. Otherwise you'd have to read the implementation to find
> >> > out what device should be hooked up to which output of the reset=
-controller.
> >>
> >> Is something like this what you had in mind? I had that prepared f=
or
> >> the next round of patches:
> >>
> >> Reset outputs:
> >>  0  : soft reset
> >>  32 : ddr reset
> >>  64 : topsw reset
> >>  96 : dmac reset
> >>  128: usb0 reset
> >>  129: usb1 reset
> >>  160: gem0 reset
> >>  161: gem1 reset
> >>  164: gem0 rx reset
> >>  165: gem1 rx reset
> >>  166: gem0 ref reset
> >>  167: gem1 ref reset
> >>  192: sdio0 reset
> >>  193: sdio1 reset
> >>  196: sdio0 ref reset
> >>  197: sdio1 ref reset
> >>  224: spi0 reset
> >>  225: spi1 reset
> >>  226: spi0 ref reset
> >>  227: spi1 ref reset
> >>  256: can0 reset
> >>  257: can1 reset
> >>  258: can0 ref reset
> >>  259: can1 ref reset
> >>  288: i2c0 reset
> >>  289: i2c1 reset
> >>  320: uart0 reset
> >>  321: uart1 reset
> >>  322: uart0 ref reset
> >>  323: uart1 ref reset
> >>  352: gpio reset
> >>  384: lqspi reset
> >>  385: qspi ref reset
> >>  416: smc reset
> >>  417: smc ref reset
> >>  448: ocm reset
> >>  512: fpga0 out reset
> >>  513: fpga1 out reset
> >>  514: fpga2 out reset
> >>  515: fpga3 out reset
> >>  544: a9 reset 0
> >>  545: a9 reset 1
> >>  552: peri reset
> >
> > Basically, yes. I guess the gaps are due to directly mapping this n=
umber
> > to bank and bit instead of doing some more complex mapping in betwe=
en?
> > I'm not sure whether I like this :) I guess if a number is off the
> > driver would still toggle the addressed bit?
>=20
> My assumption was that people would use a #include
> <dt-bindings/xlnx,zynq-reset.h> in their dts. Assuming I got the
> numbers in there right this makes it hard to misuse by accident.
> I'm not saying it's perfect ...

Michal always turned down the #include patches with the argument of
re-using the dts files outside of the Linux sources where those include=
s
etc may not be available in this form.

>=20
> > I'm not sure, is it worth
> > to do some explicit mapping from logical outputs to a physical rese=
t? It
> > seems it would be a little safer since it would be easy to check th=
at
> > the addressed reset is valid and there wouldn't be any reserved/inv=
alid
> > bits be toggled. Also, it would make the outputs in here a continuo=
us
> > series of numbers without these gaps. Not sure though whether
> > it's worth the additional complexity in the implementation.
>=20
> So your suggestion is to have a large switch case kind of thingy? I
> thought about it and it seemed complex as there's quite a bunch of
> resets with gaps. Do you know of a driver that does something similar=
?

Yeah, that was what I had in mind. Some big switch-case lookup that map=
s
a logical reset number from DT to the HW.
No, I haven't looked around what other drivers do. So, probably the
right thing is to just do what everybody else does.
I was more thinking about how easy it might be to re-use the driver for
the next-gen device.

> When I wrote this I looked at the other reset drivers and figured the=
y
> all had this kind of bank mapping of sorts so I assumed that's how
> people usually do it.

Yeah, I don't think we should make things overly complicated without a
good reason. So, unless DT or reset folks have any objections, I'm fine
with it.

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
