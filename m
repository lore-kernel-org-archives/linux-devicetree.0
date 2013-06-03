From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Mon, 3 Jun 2013 14:30:04 +0200
Message-ID: <20130603123001.GD31808@ab42.lan>
References: <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
 <20130508164123.GA10248@ab42.lan>
 <518AAF31.8080502@wwwdotorg.org>
 <20130510082521.GA2125@ab42.lan>
 <51942472.9010402@wwwdotorg.org>
 <CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
 <20130522142824.GC4789@ab42.lan>
 <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
 <20130524115053.GB5203@ab42.lan>
 <CAD6h2NSh_4TNAGeFhg+va5QX2hGia+gkw-mPaeMezghsa=Zc6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD6h2NSh_4TNAGeFhg+va5QX2hGia+gkw-mPaeMezghsa=Zc6Q@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 26, 2013 at 11:49:20PM +0800, Haojian Zhuang wrote:
> On 24 May 2013 19:50, Christian Ruppert <christian.ruppert@abilis.com=
> wrote:
> > Hello Haojian,
> >
> > On Thu, May 23, 2013 at 03:43:27PM +0800, Haojian Zhuang wrote:
> >> On 22 May 2013 22:28, Christian Ruppert <christian.ruppert@abilis.=
com> wrote:
> >> >
> >> > On Mon, May 20, 2013 at 10:10:33AM +0200, Linus Walleij wrote:
> >> > > On Thu, May 16, 2013 at 2:12 AM, Stephen Warren <swarren@wwwdo=
torg.org> wrote:
> >> > > > On 05/10/2013 02:25 AM, Christian Ruppert wrote:
> [...]
> >> I think that you want to keep the logic simple. If so, I prefer yo=
u can
> >> check pinctrl-single driver first. All pins are defined in DTS ins=
tead.
> >
> > Thanks for the hint. I haven't understood how to associate GPIOs to
> > other functions, however: Our hardware pin controller makes GPIO pi=
ns
> > available depending on the configuration of the non-GPIO interfaces=
=2E
> > This means that in many configurations, GPIO banks are only partial=
ly
>=20
> They're multiple function pins. You can find those pins in most moder=
n SoCs.
>=20
> > available because some pins are used for other purposes. We can't e=
xpect
> > our customers to manually change the pin assignments in the device =
tree
> > in order to take this into account for every PCB.
>=20
> Yes, you need to define the gpio-range & pinctrl-single,gpio-range.
> If you define them in your DTSI file, customer only need to include i=
t.
> If you define them in your DTS file, customer only need to copy them =
into
> their DTS file.
>=20
> If you don't have the requirements of routing multiple pins to the sa=
me GPIO,
> I suggest you to define them in your DTSI file.

OK, here's a simplified example of what we would like to do (this seems
pretty common so I suppose there is a way I haven't understood). Our
situation is slightly more complex but for the purpose of discussion
let's assume a chip with 8 pins which can be configured for the
following functions:

Pin   GPIO-A    I2C    SPI0     SPI1
------------------------------------
 1    GPIOA0    SDA             MISO1
 2    GPIOA1    SCL             MOSI1
 3    GPIOA2                    SS1_B
 4    GPIOA3                    SCLK1
 5    GPIOA4           MISO0
 6    GPIOA5           MOSI0
 7    GPIOA6           SS0_B
 8    GPIOA7           SCLK0

We can now define the following pinctrl-single:

pinmux: pinmux@0xFFEE0000 {
	compatible =3D "pinctrl-single";
	reg =3D <0xFFEE0000 0x8>;
	#address-cells =3D <1>;
	#size-cells =3D <0>;
	#gpio-range-cells =3D <3>;
	pinctrl-single,register-width =3D <32>;
	pinctrl-single,function-mask =3D <0xffffffff>;
	pinctrl-single,gpio-range =3D <&range 1 8 0>;
	gpioa_pins: pinmux_gpioa_pins {
		pinctrl-single,pins =3D <0x0 0 0x4 0>
	};
	i2c_pins: pinmux_i2c_pins {
		pinctrl-single,pins =3D <0x0 1>
	};
	spi0_pins: pinmux_spi0_pins {
		pinctrl-single,pins =3D <0x1 1>
	};
	spi1_pins: pinmux_spi1_pins {
		pinctrl-single,pins =3D <0x0 2>
	};
	range: gpio-range {
		#pinctrl-single,gpio-range-cells =3D <3>;
	};
};
gpioa: gpio_a {
	/* ... */
	gpio-controller;
	gpio-ranges =3D <&pinmux 0 0 8>;
};

How do I tell pinctrl-single that:
1. I2C and SPI1 cannot be selected at the same time?
2. In case I2C is selected, GPIOA0 and GPIOA1 cannot be requested but
   GPIOA2 and GPIOA3 are available?
3. In case SPI1 is selected GPIOA0-GPIOA3 are not available?
4. In case SPI0 is selected GPIOA4-GPIOA7 are not available?

> > Is there a way to make different pinmux functions mutually exclusiv=
e in
> > pinctrl-single, e.g. a pin is either a GPIO or part of an SPI inter=
face?
>=20
> gpio_request() could help you to request GPIO if the pin isn't used y=
et.
> And even your pin is in I2C mode without usage.
>=20
> But if you want to the mutually exclusive, you could do by this way.
>=20
> 1) Function is only in GPIO mode.
> In uart node, GPIO is function 1.
> pinctrl-0 =3D <&uart1_pmx_func>;
> uart1_pmx_func: uart1_pmx_func {
>      pinctrl-single,pins =3D <0x104 0x1>;
> };
>=20
> Then you can't switch to SPI interface, unless you want to switch pin=
 state.
>=20
> 2) Function is only in UART mode.
> You can hack gpio function in pinctrl-single,gpio-range property. i.e=
=2E you
> always set gpio function as UART mode by hack.
>=20
> But I still don't understand why you need this feature.
>=20
> > Can the same thing be done for example to mux either SPI or I2C on =
the
> > same pins?
>=20
> Are you using the develop board that one pin may be routed to multipl=
e
> functions? And you can choose SPI or I2C by switch.

We do have development boards to which the customer can connect their
own peripherals (and adapt the device tree accordingly). We are also
looking for a comprehensive way to configure the I/Os even for customer=
s
designing their own boards.

> It means that the sames pin are shared between SPI and I2C driver. Ei=
ther
> SPI driver gets this pin, or I2C driver gets this pin. Only one drive=
r could
> get the pins even you don't use pinctrl-single driver. It likes GPIO.

Exactly. This is what I'm wondering about in the example above. What
must I do to get a clear error message in case someone by mistake tries
the following in the above example:

spi0: tb10x_spi0 {
	/* ... */
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&spi0_pins>;
};
i2c: tb10x_i2c {
	/* ... */
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&i2c_pins>;
};

And the following:

i2c: tb10x_i2c {
	/* ... */
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&i2c_pins>;
};
some_external_component: ext_comp {
	/* ... */
	gpios =3D <&gpioa 0>;
};

> SPI & I2C driver are always enabled in your kernel image. So you're e=
nabling
> different devices with different hardware configuration, and you need=
 to
> prepare two DTS files. Your boot loader should find which
> hardware configuration is enabled & loaded the right DTS file.
> So different pinmux settings are written in these two DTS files.

Exactly. In addition, even pinmux modes which are not used in a given
board are still defined in our SOC .dtsi file.

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
