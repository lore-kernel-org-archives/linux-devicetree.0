From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Initial register settings in Device Tree?
Date: Wed, 25 Jun 2014 12:06:09 +0200
Message-ID: <4617934.0IxWlTMVfd@wuerfel>
References: <53A71474.7030704@tronnes.org> <9567058.OVFbhFdhBE@wuerfel> <53A9ACE4.9040506@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A9ACE4.9040506-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf Tronnes <notro-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 24 June 2014 18:52:52 Noralf Tronnes wrote:
> Den 23.06.2014 15:38, skrev Arnd Bergmann:
> > On Sunday 22 June 2014 21:27:52 Noralf Tr=C3=B8nnes wrote:
> >> Den 22.06.2014 20:18, skrev Arnd Bergmann:
> >>> On Sunday 22 June 2014 19:37:56 Noralf Tr=C3=B8nnes wrote:
> >> Or should each register have it's own property?
> >> st7735r,pwctr1 =3D <C5 C2 0A 00>
> > Each user-serviceable property should be abstract and use the norma=
l
> > units that you'd expect to see in a data sheet: milivolts, nanoseco=
nds,
> > etc. See if some other display controller already has picked names
> > for these properties, then use the same. If nobody has done this
> > before, try to use property names that would also make sense on a
> > different controller. If we get a couple of these, we can split out
> > the property parsing code into a separate helper module.
> I found this example that uses regulators to specify voltage:
> Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> - dsi: display serial interface
> - avdd-dsi-supply: phandle of a supply that powers the DSI controller
>=20
> If I should use regulators, I would need to have a controller driver =
and
> a panel driver, so to avoid that I just specify the millivolt/factor=20
> directly.
> This way the DT controller node will contain the panel description.
> (I could add a generic panel driver if regulators is the way to go)
>=20
> This is how the setup could be for a ST7735R controller:
>=20
> st7735r,avdd-millivolt =3D <4900> /* 4.9v */
> st7735r,vrhp-millivolt =3D <4600> /* 4.6v */
> st7735r,vrhn-millivolt =3D <4600> /* -4.6 */
> st7735r,pwr-mode =3D <2> /* 0=3D2x, 1=3D3x, 2=3Dauto (the datasheet d=
oesn't say=20
> what this is) */
> st7735r,vgh25-millivolt =3D <2400>
> st7735r,vgh-factor =3D <1> /* 0=3D2*AVDD+VGH25, 1=3D3*AVDD, 2=3D3*AVD=
D+VGH25 */
> st7735r,vgl-millivolt =3D <10000> /* -10v */
> /* ap,sap,pwr-freqX have to do with power consumption vs. image quali=
ty. */
> st7735r,ap-factor =3D <1> /* Current in source driver op-amp: 0=3Dsma=
ll,=20
> 1=3Dmedium low, 2=3Dmedium, 3=3Dmedium high, 4=3Dlarge */
> st7735r,sap-factor =3D <0> /* Current in source driver op-amp: 0=3Dsm=
all,=20
> 1=3Dmedium low, 2=3Dmedium, 3=3Dmedium high, 4=3Dlarge */
> /* Booster circuit Step-up cycle in Normal mode/ full colors */
> st7735r,pwr-freq1-factor-normal =3D <1> /* BCLK/{1, 1.5, 2, 4} */
> st7735r,pwr-freq2-factor-normal =3D <1>
> st7735r,pwr-freq3-factor-normal =3D <1>
> st7735r,pwr-freq4-factor-normal =3D <1>
> st7735r,vcom-millivolt =3D <775> /* -0.775v */
> st7735r,rotation =3D <0> /* Display rotation: 0,90,180,270 */
> st7735r,gamma-positive =3D <0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00 07=
 02 10>
> st7735r,gamma-negative =3D <0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00 07=
 03 10>
>=20
>=20
> For a ILI9325 controller:
>=20
> ili9325,gamma-ap-factor =3D <100> /* Gamma driver amplifiers constant=
=20
> current ratio: 0=3D1.00, 1=3D0.75, 2=3D0.50 */
> ili9325,source-ap-factor =3D <75> /* Source driver amplifiers constan=
t=20
> current ratio: 0=3D1.00, 1=3D0.75, 2=3D0.50 */
> ili9325,vgh-factor =3D <4> /* Vci1 x {4,5,6} */
> ili9325,vgl-factor =3D <3> /* -Vci x {3,4,5} */
> ili9325,vci1-factor =3D <100> /* Vci x {1.00 - 0.70} */
> ili9325,pwr-freq1-factor =3D <1> /* Fosc / {1, 2, 4, 8, 16, 32, 64} *=
/
> ili9325,pwr-freq2-factor =3D <4> /* Fosc / {4, 8, 16, 32, 64, 128, 25=
6} */
> ili9325,vci-internal /* use internal 2.5V for Vci reference, default =
is=20
> Vci pin */
> ili9325,vreg1out-factor =3D <160> /* Vci x {1.60 - 2.00} */
> ili9325,vcom-amplitude-factor =3D <100> /* VREG1OUT x {0.70 - 1.24} *=
/
> ili9325,vcomh-factor =3D <> /* VREG1OUT x {0.685 - 1.000} */
> ili9325,rotation =3D <0> /* Display rotation: 0,90,180,270 */
> ili9325,gamma-positive =3D <10 values>
> ili9325,gamma-negative =3D <10 values>

This doesn't feel right to me at all, though I have a hard time
coming up with the correct solution since I still don't understand
enough of the subject matter.

If you are driving the same display from the ST7735R and the ILI9325
controllers, the DT properties should be the same high-level properties
and the interpretation done in the driver. It sounds like you have
a good overview of the settings that panels may require

> Then we have some other registers:
> Display Control 1 (R07h) : GON and DTE Set the output level of gate=20
> driver G1 ~ G320
> Gate Scan Control (R60h, R61h, R6Ah) : various gate driver line setup
> Panel Interface Control 1 (R90h) : DIVI[1:0]: Sets the division ratio=
 of=20
> internal clock frequency
>=20
> (I see now, that I can't use 0 as a property value, since this has to=
 be
> the default value if I'm going to support platform_data.)

I don't see a problem with platform_data here. I'd normally recommend
not use platform_data at all these days, since most of the platforms
we support are DT only. If you still need platform_data, there is
no requirement to keep the format the same as for the DT properties,
or to use zero as a default.

> >> The gamma registers have several values that control a resistor ne=
twork
> >> that sets grayscale values.
> >> Would this suffice?
> >> st7735r,gamma-positive =3D <0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00=
 07 02 10>
> >> st7735r,gamma-negative =3D <0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00=
 07 03 10>
> >>
> >> Usually when buying these displays, they come with an initializati=
on
> >> sequence.
> >> Having register values in the DT, a user will be up and running in
> >> minutes with a new display.
> >> If one has to read the datasheet and map the register values to
> >> bitfields and properties, it takes a lot of time and not the least=
, it's
> >> error prone.
> > Can you describe how this works for arbitrary combinations of contr=
ollers
> > and displays? Are the initialization sequences specific to some con=
troller?
> Each controller has it's own way of setting the operational parameter=
s=20
> for a panel.
> A controller can also support panels with different resolutions.
> The panel can also be connected to the controller in different ways=20
> (gate lines).
> Then each panel has it's own needs. I'm no expert in this, so I can't=
=20
> tell how
> different the many panels are which are used in the huge number of ch=
inese
> displays on ebay and with other more longterm suppliers.
>=20
> Here's the voltage abilities of the ILI9325 controller:
>=20
> Low operating power supplies:
> IOVcc =3D 1.65V ~ 3.3 V (interface I/O)
> Vcc =3D 2.4V ~ 3.3 V (internal logic)
> Vci =3D 2.5V ~ 3.3 V (analog)
> LCD Voltage drive:
> Source/VCOM power supply voltage
> DVDH - GND =3D 4.5V ~ 6.0
> VCL =E2=80=93 GND =3D -2.0V ~ -3.0V
> VCI =E2=80=93 VCL <=3D 6.0V
> Gate driver output voltage
> VGH - GND =3D 10V ~ 20V
> VGL =E2=80=93 GND =3D -5V ~ -15V
> VGH =E2=80=93 VGL <=3D 32V
> VCOM driver output voltage
> VCOMH =3D 3.0V ~ (DDVDH-0.5)V
> VCOML =3D (VCL+0.5)V ~ 0V
> VCOMH-VCOML <=3D 6.0V
>=20
> In practice however, most of the users of my drivers just use the=20
> defaults in
> the driver (max power). They connect a 3.3V display to the Raspberry =
Pi, and
> the default voltage setup and gamma curves gives a good enough image =
for=20
> hobby use.

I still don't see how you get from a panel data sheet list of acceptabl=
e
settings to the register-level settings for a given controller. It soun=
ds
like you do have to do that manually for each combination of display an=
d
controller, whereas I was expecting this to be done by the display
controller driver.

> > An alternative to listing all the settings in DT might be to have a=
 list
> > of supported displays in the controller driver and pick the display
> > by name, but that only works if there are a small number of possibl=
e
> > displays that can be connected to each controller.
> I'm afraid there are too many panels to make that work.
> Panel drivers might be used though.
> But I'm a layman that does this for fun, if I where in the business I=
 would
> know more about the panel side of this is issue.
>=20
> Currently I have drivers for 17 controllers in my project, with 3 mor=
e=20
> in the pipeline.
> That number can easily be doubled to account for other displays=20
> currently avilable.

Ok.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
