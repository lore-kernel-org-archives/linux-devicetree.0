From: Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Sun, 26 May 2013 23:49:20 +0800
Message-ID: <CAD6h2NSh_4TNAGeFhg+va5QX2hGia+gkw-mPaeMezghsa=Zc6Q@mail.gmail.com>
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
	<20130524115053.GB5203@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130524115053.GB5203@ab42.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24 May 2013 19:50, Christian Ruppert <christian.ruppert@abilis.com> =
wrote:
> Hello Haojian,
>
> On Thu, May 23, 2013 at 03:43:27PM +0800, Haojian Zhuang wrote:
>> On 22 May 2013 22:28, Christian Ruppert <christian.ruppert@abilis.co=
m> wrote:
>> >
>> > On Mon, May 20, 2013 at 10:10:33AM +0200, Linus Walleij wrote:
>> > > On Thu, May 16, 2013 at 2:12 AM, Stephen Warren <swarren@wwwdoto=
rg.org> wrote:
>> > > > On 05/10/2013 02:25 AM, Christian Ruppert wrote:
>> > >
>> > > >> (*1) TB100 GPIO ranges are defined as a phandle to the I/O fu=
nction
>> > > >>      which provides all pins of a given GPIO port. This funct=
ion is not
>> > > >>      necessarily requested from pinctrl and GPIO ports may ov=
erlap with
>> > > >>      other functions. The pin controller knows about this and=
 provides
>> > > >>      whatever GPIO pin is available after mapping other reque=
sted
>> > > >>      functions.
>> > > >> (*2) Here, the entire GPIOB port is explicitly requested by t=
he GPIO
>> > > >>      module, i.e. all pins of the port are made available as =
GPIOs.
>> > > >
>> > > > So I think all you're looking for is a way in DT to represent =
GPIO
>> > > > ranges? I don't think that should be by string name, but rathe=
r numbers:
>> > > >
>> > > > (actually, doesn't pinctrl-simple already have this?)
>> > >
>> > > Now I'm ever more confused ... we already have this :-)
>> > >
>> > > It's not even pinctrl-simple-centric it is completely generic.
>> > > The code is in drivers/gpio/gpiolib-of.c.
>> > >
>> > > It was written by Shiraz Hashin and Haojian Zhuang.
>> > > At the time I augmented the core code quite a bit to make
>> > > a good fit.
>> >
>> > I agree. Unluckily, it uses pinctrl-internal pin numbering which w=
e
>> > would have to make coherent with the physical pin numbers of the
>> > individual packaging variants of the chip in order to expose them =
to
>> > customers (see my previous mail at https://lkml.org/lkml/2013/5/22=
/207).
>> >
>> > Adapting the kernel-internal pin numbering in function of the prod=
uct
>> > variant doesn't seem such a good idea to me: All pin groups etc. w=
ill
>> > have to be redefined for every product, a huge source of bugs and
>> > unnecessary static data within the drivers.
>> >I review two methods you mentioned in this mail.
>>
>> I think that you want to keep the logic simple. If so, I prefer you =
can
>> check pinctrl-single driver first. All pins are defined in DTS inste=
ad.
>
> Thanks for the hint. I haven't understood how to associate GPIOs to
> other functions, however: Our hardware pin controller makes GPIO pins
> available depending on the configuration of the non-GPIO interfaces.
> This means that in many configurations, GPIO banks are only partially

They're multiple function pins. You can find those pins in most modern =
SoCs.

> available because some pins are used for other purposes. We can't exp=
ect
> our customers to manually change the pin assignments in the device tr=
ee
> in order to take this into account for every PCB.

Yes, you need to define the gpio-range & pinctrl-single,gpio-range.
If you define them in your DTSI file, customer only need to include it.
If you define them in your DTS file, customer only need to copy them in=
to
their DTS file.

If you don't have the requirements of routing multiple pins to the same=
 GPIO,
I suggest you to define them in your DTSI file.

>
> Is there a way to make different pinmux functions mutually exclusive =
in
> pinctrl-single, e.g. a pin is either a GPIO or part of an SPI interfa=
ce?

gpio_request() could help you to request GPIO if the pin isn't used yet=
=2E
And even your pin is in I2C mode without usage.

But if you want to the mutually exclusive, you could do by this way.

1) Function is only in GPIO mode.
In uart node, GPIO is function 1.
pinctrl-0 =3D <&uart1_pmx_func>;
uart1_pmx_func: uart1_pmx_func {
     pinctrl-single,pins =3D <0x104 0x1>;
};

Then you can't switch to SPI interface, unless you want to switch pin s=
tate.

2) Function is only in UART mode.
You can hack gpio function in pinctrl-single,gpio-range property. i.e. =
you
always set gpio function as UART mode by hack.

But I still don't understand why you need this feature.

> Can the same thing be done for example to mux either SPI or I2C on th=
e
> same pins?

Are you using the develop board that one pin may be routed to multiple
functions? And you can choose SPI or I2C by switch.

It means that the sames pin are shared between SPI and I2C driver. Eith=
er
SPI driver gets this pin, or I2C driver gets this pin. Only one driver =
could
get the pins even you don't use pinctrl-single driver. It likes GPIO.

SPI & I2C driver are always enabled in your kernel image. So you're ena=
bling
different devices with different hardware configuration, and you need t=
o
prepare two DTS files. Your boot loader should find which
hardware configuration is enabled & loaded the right DTS file.
So different pinmux settings are written in these two DTS files.

>
>> [...]
>
> Greetings,
>   Christian
>
> --
>   Christian Ruppert              ,          <christian.ruppert@abilis=
=2Ecom>
>                                 /|
>   Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9=
-Fleuri
>                              _// | bilis Systems   CH-1228 Plan-les-O=
uates
