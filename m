From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Fri, 24 May 2013 13:50:54 +0200
Message-ID: <20130524115053.GB5203@ab42.lan>
References: <20130429161725.GB30136@ab42.lan>
 <5182B557.4040804@wwwdotorg.org>
 <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
 <20130508164123.GA10248@ab42.lan>
 <518AAF31.8080502@wwwdotorg.org>
 <20130510082521.GA2125@ab42.lan>
 <51942472.9010402@wwwdotorg.org>
 <CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
 <20130522142824.GC4789@ab42.lan>
 <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Haojian,

On Thu, May 23, 2013 at 03:43:27PM +0800, Haojian Zhuang wrote:
> On 22 May 2013 22:28, Christian Ruppert <christian.ruppert@abilis.com=
> wrote:
> >
> > On Mon, May 20, 2013 at 10:10:33AM +0200, Linus Walleij wrote:
> > > On Thu, May 16, 2013 at 2:12 AM, Stephen Warren <swarren@wwwdotor=
g.org> wrote:
> > > > On 05/10/2013 02:25 AM, Christian Ruppert wrote:
> > >
> > > >> (*1) TB100 GPIO ranges are defined as a phandle to the I/O fun=
ction
> > > >>      which provides all pins of a given GPIO port. This functi=
on is not
> > > >>      necessarily requested from pinctrl and GPIO ports may ove=
rlap with
> > > >>      other functions. The pin controller knows about this and =
provides
> > > >>      whatever GPIO pin is available after mapping other reques=
ted
> > > >>      functions.
> > > >> (*2) Here, the entire GPIOB port is explicitly requested by th=
e GPIO
> > > >>      module, i.e. all pins of the port are made available as G=
PIOs.
> > > >
> > > > So I think all you're looking for is a way in DT to represent G=
PIO
> > > > ranges? I don't think that should be by string name, but rather=
 numbers:
> > > >
> > > > (actually, doesn't pinctrl-simple already have this?)
> > >
> > > Now I'm ever more confused ... we already have this :-)
> > >
> > > It's not even pinctrl-simple-centric it is completely generic.
> > > The code is in drivers/gpio/gpiolib-of.c.
> > >
> > > It was written by Shiraz Hashin and Haojian Zhuang.
> > > At the time I augmented the core code quite a bit to make
> > > a good fit.
> >
> > I agree. Unluckily, it uses pinctrl-internal pin numbering which we
> > would have to make coherent with the physical pin numbers of the
> > individual packaging variants of the chip in order to expose them t=
o
> > customers (see my previous mail at https://lkml.org/lkml/2013/5/22/=
207).
> >
> > Adapting the kernel-internal pin numbering in function of the produ=
ct
> > variant doesn't seem such a good idea to me: All pin groups etc. wi=
ll
> > have to be redefined for every product, a huge source of bugs and
> > unnecessary static data within the drivers.
> >I review two methods you mentioned in this mail.
>=20
> I think that you want to keep the logic simple. If so, I prefer you c=
an
> check pinctrl-single driver first. All pins are defined in DTS instea=
d.

Thanks for the hint. I haven't understood how to associate GPIOs to
other functions, however: Our hardware pin controller makes GPIO pins
available depending on the configuration of the non-GPIO interfaces.
This means that in many configurations, GPIO banks are only partially
available because some pins are used for other purposes. We can't expec=
t
our customers to manually change the pin assignments in the device tree
in order to take this into account for every PCB.

Is there a way to make different pinmux functions mutually exclusive in
pinctrl-single, e.g. a pin is either a GPIO or part of an SPI interface=
?
Can the same thing be done for example to mux either SPI or I2C on the
same pins? If the answer to both questions is yes, we could predefine
all functions as we currently do and our pinctrl driver could be
entirely replaced with pinctrl-single.

> [...]

Greetings,
  Christian

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
