From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Thu, 6 Jun 2013 17:30:31 +0200
Message-ID: <20130606153030.GA19876@ab42.lan>
References: <51942472.9010402@wwwdotorg.org>
 <CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
 <20130522142824.GC4789@ab42.lan>
 <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
 <20130524115053.GB5203@ab42.lan>
 <CAD6h2NSh_4TNAGeFhg+va5QX2hGia+gkw-mPaeMezghsa=Zc6Q@mail.gmail.com>
 <20130603123001.GD31808@ab42.lan>
 <CAD6h2NQVKKvcoPdD4sm5rUM5G-FpF3abL=k+WfQsnKnm7qhREA@mail.gmail.com>
 <20130606141115.GA10345@ab42.lan>
 <CAD6h2NRNMQP-ZQ0Cc613tGThVEo7AzRExBmWsbtr1DXgiPwz7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD6h2NRNMQP-ZQ0Cc613tGThVEo7AzRExBmWsbtr1DXgiPwz7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2013 at 10:32:21PM +0800, Haojian Zhuang wrote:
> On 6 June 2013 22:11, Christian Ruppert <christian.ruppert@abilis.com=
> wrote:
> > On Wed, Jun 05, 2013 at 09:44:27AM +0800, Haojian Zhuang wrote:
> >> On 3 June 2013 20:30, Christian Ruppert <christian.ruppert@abilis.=
com> wrote:
> >> > OK, here's a simplified example of what we would like to do (thi=
s seems
> >> > pretty common so I suppose there is a way I haven't understood).=
 Our
> >> > situation is slightly more complex but for the purpose of discus=
sion
> >> > let's assume a chip with 8 pins which can be configured for the
> >> > following functions:
> >> >
> >> > Pin   GPIO-A    I2C    SPI0     SPI1
> >> > ------------------------------------
> >> >  1    GPIOA0    SDA             MISO1
> >> >  2    GPIOA1    SCL             MOSI1
> >> >  3    GPIOA2                    SS1_B
> >> >  4    GPIOA3                    SCLK1
> >> >  5    GPIOA4           MISO0
> >> >  6    GPIOA5           MOSI0
> >> >  7    GPIOA6           SS0_B
> >> >  8    GPIOA7           SCLK0
> >> >
> >> > We can now define the following pinctrl-single:
> >> >
> >> > pinmux: pinmux@0xFFEE0000 {
> >> >         compatible =3D "pinctrl-single";
> >> >         reg =3D <0xFFEE0000 0x8>;
> >> >         #address-cells =3D <1>;
> >> >         #size-cells =3D <0>;
> >> >         #gpio-range-cells =3D <3>;
> >> >         pinctrl-single,register-width =3D <32>;
> >> >         pinctrl-single,function-mask =3D <0xffffffff>;
> >> >         pinctrl-single,gpio-range =3D <&range 1 8 0>;
> >> >         gpioa_pins: pinmux_gpioa_pins {
> >> >                 pinctrl-single,pins =3D <0x0 0 0x4 0>
> >> >         };
> >> >         i2c_pins: pinmux_i2c_pins {
> >> >                 pinctrl-single,pins =3D <0x0 1>
> >> >         };
> >> >         spi0_pins: pinmux_spi0_pins {
> >> >                 pinctrl-single,pins =3D <0x1 1>
> >> <0x1 1>?
> >>
> >> If each pinmux register is only for one pin in your SoC.
> >> I think that your definitions are wrong above. We use
> >> register offset as the first argument, not pin number.
> >> And the second argument should be pin function number.
> >
> > In our case each pinmux register (bit field) actually controls an e=
ntire
> > group of pins.
> >
> >> If multiple pins are sharing one register with different bits,
> >> you need to enable "pinctrl-single,bit-per-mux".
> >
> > Multiple pins are sharing the same bits in the same register. Do yo=
u
> > think this prevents us from using pinctrl-single?
> >
> Could you give me your register definition? Then I can understand you
> better.

In our example, the register map would look a bit like the following.
Note that every register configures four pins at a time.

Register 0x0:
 Mode  GPIO-A    I2C    SPI1
 Value 0x0       0x1    0x2
 ---------------------------
 Pin1  GPIOA0    SDA    MISO1
 Pin2  GPIOA1    SCL    MOSI1
 Pin3  GPIOA2           SS1_B
 Pin4  GPIOA3           SCLK1

Register 0x4:
 Mode  GPIO-A    SPI0
 Value 0x0       0x1
 ---------------------
 Pin5  GPIOA4    MISO0
 Pin6  GPIOA5    MOSI0
 Pin7  GPIOA6    SS0_B
 Pin8  GPIOA7    SCLK0

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
