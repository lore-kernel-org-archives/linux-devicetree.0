From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] doc: Add bindings document for Xilinx LogiCore PR Decoupler
Date: Tue, 4 Apr 2017 16:36:29 -0700
Message-ID: <CAAtXAHe0qnu7Ub6sing4VUgFa-tkdvH767kNbZnu1S5THHS2oQ@mail.gmail.com>
References: <20170324153321.4168-1-atull@kernel.org> <20170324153321.4168-2-atull@kernel.org>
 <20170330224429.yo42hgnr7nhm2ljv@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330224429.yo42hgnr7nhm2ljv@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 05:44:29PM -0500, Rob Herring wrote:
> On Fri, Mar 24, 2017 at 10:33:20AM -0500, Alan Tull wrote:
> > From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Please use "dt-bindings: fpga: ..." for the subject.
>
>
> >
> > This adds the binding documentation for the Xilinx LogiCORE PR
> > Decoupler soft core.
> >
> > Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Acked-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> I'm confused why you are sending these instead of Moritz? If it goes
> through you, then it should have your S-o-B too.

Do you want me to resend this Alan (with Rob's suggestions)?
>
> > Cc: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  .../bindings/fpga/xilinx-pr-decoupler.txt          | 35 ++++++++++++++=
++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-pr-de=
coupler.txt
> >
> > diff --git a/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler=
.txt b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
> > new file mode 100644
> > index 000000000000..2c527ac30398
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
> > @@ -0,0 +1,35 @@
> > +Xilinx LogiCORE Partial Reconfig Decoupler Softcore
> > +
> > +The Xilinx LogiCORE Partial Reconfig Decoupler manages one or more
> > +decouplers / fpga bridges.
> > +The controller can decouple/disable the bridges which prevents signal
> > +changes from passing through the bridge.  The controller can also
> > +couple / enable the bridges which allows traffic to pass through the
> > +bridge normally.
> > +
> > +The Driver supports only MMIO handling. A PR region can have multiple
> > +PR Decouplers which can be handled independently or chained via decoup=
le/
> > +decouple_status signals.
> > +
> > +Required properties:
> > +- compatible : Should contain "xlnx,pr-decoupler-1.00" or "xlnx,pr-dec=
oupler"
>
> I'd drop xlnx,pr-decoupler, but in any case, it should not be OR rather
> "followed by". Plus the example has both.

Michal wanted to have both, so I put both. Personally I don't care. I
think they have some downstream stuff that relied on it.

>
> > +- regs : base address and size for decoupler module
> > +- clocks : input clock to IP
> > +- clock-names : should contain "aclk"
> > +
> > +Optional properties:
> > +- bridge-enable : 0 if driver should disable bridge at startup
> > +  1 if driver should enable bridge at startup
> > +  Default is to leave bridge in current state.
> > +
> > +See Documentation/devicetree/bindings/fpga/fpga-region.txt for generic=
 bindings.
> > +
> > +Example:
> > + fpga-bridge@100000450 {
> > + compatible =3D "xlnx,pr-decoupler-1.00",
> > +     "xlnx-pr-decoupler";
> > + regs =3D <0x10000045 0x10>;
> > + clocks =3D <&clkc 15>;
> > + clock-names =3D "aclk";
> > + bridge-enable =3D <0>;
> > + };
> > --
> > 2.11.0
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks,
Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
