From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: syscon or memory mappings (was: Re: [RFC/PATCH 0/8] pinctrl-rockchip: Change wrong initial assumptions)
Date: Sat, 03 May 2014 01:45:11 +0200
Message-ID: <4321949.A6Ghcdztds@diego>
References: <1414506.B4e2jZujVm@diego> <5737609.o5tyv6lkQG@diego> <1721270.d6hHid1rhj@typ>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1721270.d6hHid1rhj@typ>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Max,

Am Freitag, 2. Mai 2014, 15:59:05 schrieb Max Schwarz:
> On Thursday 01 May 2014 at 15:21:34, Heiko St=FCbner wrote:
> > On rk3188 it is
> > GRF: 0x00 - 0x5c: pin suspend control
> > GRF: 0x60 - 0x9c: pinmux control (0x60 and 0x64 gpio-only)
> > GRF: 0xa0 - 0xac: soc-control/status
> > GRF: 0xb0 - 0xc8: dma-control
> > GRF: 0xcc - 0xe0: "cpu core configuration"
> > GRF: 0xec - 0xf0: ddr-controller config
> > GRF: 0xf4 - 0x104: pin drive-strength (what we currently do not sup=
port)
> > GRF: 0x108: soc_status1
> > GRF: 0x10c - 0x140: USB phy control
> > GRF: 0x144 - 0x160: "OS register"
> > GRF: 0x160 - 0x19c: pin pull settings
> > PMU: 0x00 - 0x38: power-domains and a lot of unknown stuff
> > PMU: 0x3c: something called GPIO0_CON, what Rockchip does not use a=
t all
> > PMU: 0x40 - 0x60: "SYS_REGx"
> > PMU: 0x64 - 0x68: part of GPIO0 pull config
> >=20
> > so we would/will in the end need 4 mappings for the rk3188-pinctrl
> > GRF: 0x00 - 0x9c, GRF: 0xf4 - 0x104, GRF: 0x160 - 0x19c, PMU: 0x64 =
- 0x68
> >=20
> >=20
> > On rk3288 it is
> >=20
> > GRF: 0x00 - 0x84: gpio1-gpio8 iomux settings
> > GRF: 0x104 - 0x138: unknown GPIOxx_SR registers
> > GRF: 0x140 - 0x1b4: gpio1-gpio8 pull settings
> > GRF: 0x1c0 - 0x234: gpio1-gpio8 driver strength settings
> > GRF: 0x240: unknown/unused GPIO_SMT
> > GRF: 0x244 - 0x2d4: soc control/status registers
> > GRF: 0x2e0 - ...: a lot of stuff like dma, usb-phy etc.
> > PMU: 0x00 - 0x5c: powerdomains and a lot of other stuff
> > PMU: 0x60: GPIO_SR
> > PMU: 0x64 - 0x6c: gpio0 pull settings
> > PMU: 0x70 - 0x78: gpio0 drive-strength settings
> > PMU: 0x7c: GPIO_OP
> > PMU: 0x80: GPIO0_SEL18
> > PMU: 0x84 - 0x8c: gpio0 pinmux settings
> > PMU: 0x90 - 0xa0: more misc registers (powermode, sys_regX)
> >=20
> > so we would essentially need only two mappings here
> > GRF: 0x00 - 0x240 and PMU: 0x60 - 0x8c
> >=20
> > So we'd need additional if(is_rk3188()) conditionals to distinguish
> > between
> > these implementations [and possible future ones] to select the corr=
ect
> > base
> > address, and we don't know what the next SoC will bring and how the=
 stuff
> > will be ordered there.
>=20
> Thanks for providing the register mappings.
>=20
> Yes, if you do specify the mappings as you proposed it would be a nig=
htmare.
>=20
> However, this sheds light on an underlying issue: Rockchip is not tre=
ating
> the whole GPIO block as one cohesive device as we do currently. Inste=
ad, it
> seems to me, one GPIO bank is one device. Each has its cohesive mux, =
bank
> and pull registers - apart from rk3188-bank-0, maybe. But that one is
> special anyway with regards to register ordering (s.b.).
>=20
> The issues you had with RK3188 and now have with RK3288 seem to stem =
from
> trying to group all banks together into one pinctrl driver.
>
> So maybe we should promote the GPIO banks to full devices in the dt a=
nd make
> smaller mappings for each GPIO bank, i.e. three mappings for each GPI=
O bank
> (mux, bank, pull). I know we have to stay backwards compatible dt-wis=
e, but
> that should be doable.

Yes, that is another miss-conception from the early days. The gpio-cont=
rollers=20
themself are actually Synopsis Designware IPs - the kernel now even has=
 a=20
separate driver for them (gpio-dwapb). Only the real=20
pincontrol/muxing/pull/etc is from Rockchip.

Currently I can't think of a way to move over gracefully, without intro=
ducing=20
crap into the gpio-dwapb driver. As at the moment it parses all informa=
tion it=20
needs from the dt directly - of course with different bindings.

That is also the reason I do not want to introduce more "special-cases"=
 in the=20
bank-declaration we're using currently - to not make this move more dif=
ficult in=20
the future.

As it is, with the patch attached to the last mail, the pinctrl driver=20
wouldn't even need the "rockchip,rk3188-gpio-bank0" compatible anymore,=
 as the=20
information about its special case is now sitting in the bank declarati=
on=20
inside the driver. Which then would enable us to remove the gpio-bank s=
ubnodes=20
alltogether and use the external gpio driver.


> Then we are fully flexible and don't need any conditionals or address
> calculation logic. And should a future SoC bring another layout insid=
e the
> banks, we can react with a new "compatible"-name (and maybe a complet=
ely
> separate driver, if the change is big enough).

Especially the rk3288 seems to introduce a lot more variants. So if we =
were to=20
really split each pin-bank into a separate node, each bank would need t=
o be=20
handled differently - as they all have one peculiarity or another.



> > Also leaving the driver behind, devicetree is meant to describe the
> > hardware, not the implementation. And hw-wise both PMU and GRF are =
actual
> > hardware blocks even with individual clock gates.
>=20
> Whatever a "hardware block" is. n:m mappings between devices and cloc=
ks are
> no problems in the dt. So why not describe things a bit more precisel=
y?
> > Citing the syscon-devicetree bindings:
> > 	System controller node represents a register region containing a s=
et
> > 	of miscellaneous registers. The registers are not cohesive enough =
to
> > 	represent as any specific type of device.
> >=20
> > So to me both GRF and PMU regions scream "syscon".
>=20
> Yes, that sounds a bit like the mess we are dealing with ;-)
> I still feel that declaring everything as syscon is somehow circumven=
ting
> the dt. And I feel more comfortable declaring GRF_SOC_* as "miscellan=
eous
> registers" rather than e.g. the iomux space of GPIO0.
>=20
> Don't get me wrong please, I'm not completely against the syscon idea=
=2E I'm
> just trying to have a full discussion on the issue.

Oh, me too :-) . I'm not entirely fixated on this idea, but using a sys=
con=20
feels somehow naturally to me in this case.

While for example syscon cannot handle clocks currently, the underlying=
 regmap=20
can - so it would be only a matter of teaching syscon to tell regmap of=
 the=20
clock to use (GRF and PMU register-clocks in this case), instead of nee=
ding to=20
have every user of parts of these registers handle the relevant clock i=
tself=20
on register accesses.

Also, as you can see in the grf map, the rk3188 actually has two soc_st=
atus=20
registers (0xac and 0x108) which have the dmac, cpu and drive strength=20
registers in between. So having a syscon only for soc_con and soc_statu=
s will=20
produce problems too.

Another example, GRF_IO_VSEL at 0x0380 is most likely some sort of pin =
voltage=20
selection. As it only spans 1 register I'd assume it could contain sett=
ings=20
that span all pin banks.

And of course, splitting the register space into dozens of small indivi=
dual=20
mappings looks messy :-)


> > I've attached my current WIP patch to implement rk3288 support (unt=
ested,
> > as I don't have any hardware), based on this series. As you can see=
 in
> > it, the rk3288 has even more peculiarities with gpio-only and 4bit =
wide
> > iomuxes.
> Nice, but you needed to introduce flags like "SOURCE_PMU/GRF" which w=
ould
> not be necessary with the fine-grained mapping. GPIO-Only could be ha=
ndled
> by a mask specified in the dt.

While it is true, that on the rk3288 all gpio0-iomux settings are resid=
ing the=20
in the pmu, this is not necessarily true for everything. Like on the rk=
3188,=20
the iomux registers of bank0 are in the GRF space while parts of the pu=
ll=20
settings are in the PMU space.


> > As the patch stands now, rk3288 doesn't even need special handling =
for its
> > iomux registers, as it can be simply described now in the pin-bank
> > declaration at the bottom - and even the rk3188-bank0 wouldn't be
> > necessary
> > anymore.
>=20
>        /*
> 		 * The bits in these registers have an inverse ordering
> 		 * with the lowest pin being in bits 15:14 and the highest
> 		 * pin in bits 1:0
> 		 */
> 		*bit =3D 7 - (pin_num % RK3188_PULL_PINS_PER_REG);
>=20
> (from rk3188_calc_pull_reg_and_bit)
>=20
> That's probably still a peculiarity of rk3188-bank0, isn't it? So we'=
d still
> need a conditional on rk3188-bank0. That could enable a fourth mappin=
g for
> the split up mux space of bank0 as well.

No, the pull-pins are reversed inside the register on all banks of the =
rk3188.


> > I'm also hoping for more input so I've changed the title a bit, to =
maybe
> > attract more people :-).
>=20
> Yes, let's hope someone else speaks up. Maybe there has already been =
a
> precedent in another mach-*? I'll try to find something similar.
> In the end you as the maintainer have to make the decision though. An=
d as I
> said I don't have real problems with the syscon solution, it just doe=
sn't
> feel nice.

Actually Linus Walleij is the pinctrl maintainer, so he'll also needs t=
o be=20
happy with what we come up here :-) .


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
