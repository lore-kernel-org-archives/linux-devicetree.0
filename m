From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Tue, 9 Jul 2019 09:48:14 -0600
Message-ID: <CAL_JsqKf+Z9XJJvqcOw-0L-BLCt_Yv-qv-eu+zhoNFnk8rH8Og@mail.gmail.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com> <20190709014058.GA30269@bogus>
 <0c90f9376c0e425c9a226379f7e5bfad@quantatw.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0c90f9376c0e425c9a226379f7e5bfad@quantatw.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Cc: George Hung <ghung.quanta@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "wak@google.com" <wak@google.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac <linux-edac@vger.kernel.org>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 3:50 AM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi Rob,
>
>
> > -----Original Message-----
> > From: openbmc
> > [mailto:openbmc-bounces+george.hung=3Dquantatw.com@lists.ozlabs.org] On
> > Behalf Of Rob Herring
> > Sent: Tuesday, July 09, 2019 9:41 AM
> > To: George Hung
> > Cc: Mark Rutland; Linus Walleij; Tali Perry; paulmck@linux.ibm.com;
> > wak@google.com; benjaminfair@google.com; openbmc@lists.ozlabs.org;
> > tomer.maimon@nuvoton.com; devicetree@vger.kernel.org; Borislav Petkov;
> > Avi.Fishman@nuvoton.com; Jonathan Cameron; Mauro Carvalho Chehab;
> > linux-edac; Patrick Venture; Nicolas Ferre; linux-kernel; James Morse; =
Greg
> > Kroah-Hartman; davem@davemloft.net
> > Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC
> > documentation
> >
> > On Wed, Jun 05, 2019 at 10:12:53PM +0800, George Hung wrote:
> > > Add device tree documentation for Nuvoton BMC ECC
> > >
> > > Signed-off-by: George Hung <ghung.quanta@gmail.com>
> > > ---
> > >  .../bindings/edac/npcm7xx-sdram-edac.txt        | 17
> > +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > > b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > > new file mode 100644
> > > index 000000000000..dd4dac59a5bd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > > @@ -0,0 +1,17 @@
> > > +Nuvoton NPCM7xx SoC EDAC device driver
> > > +
> > > +The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and
> > the
> > > +driver uses the EDAC framework to implement the ECC detection and
> > corrtection.
> > > +
> > > +Required properties:
> > > +- compatible:      should be "nuvoton,npcm7xx-sdram-edac"
> >
> > Is this for the whole SDRAM controller or just ECC related registers?
> > In the former case, the naming should just reflect the block name and n=
ot a
> > Linux term.
>
> Sorry for confused naming, the address space is for the whole memory cont=
roller registers indeed,
> but the driver only uses the ECC related registers.
> Should I change the name to "nuvoton,npcm7xx-edac" ?

No, you should drop the 'edac' part. The DT describes the h/w, not
what one driver (currently) uses.

Rob
