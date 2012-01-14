From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [RFC PATCH v3 2/5] pinctrl: add dt binding support for pinmux mappings
Date: Sun, 15 Jan 2012 02:21:19 +0800
Message-ID: <CAA+hA=TrT=KSJGRyMeqW8u2BQ0xdW1o7hpJFENwRP7povc7ONg@mail.gmail.com>
References: <CAA+hA=RBqpSmntS2h+6xMQuRvSRHenmDgrYSSzMXHtOCpU+HCQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F18F8@HQMAIL01.nvidia.com>
	<7FE21149F4667147B645348EC605788507F698@039-SN2MPN1-013.039d.mgd.msft.net>
	<74CDBE0F657A3D45AFBB94109FB122FF177EE39E6B@HQMAIL01.nvidia.com>
	<20120107135445.GI4790@S2101-09.ap.freescale.net>
	<74CDBE0F657A3D45AFBB94109FB122FF177EE3A6E5@HQMAIL01.nvidia.com>
	<20120112033941.GH20968@S2101-09.ap.freescale.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17801D1DCC@HQMAIL01.nvidia.com>
	<20120113034558.GA12184@S2101-09.ap.freescale.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17801D1F9D@HQMAIL01.nvidia.com>
	<20120114012213.GD1810@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120114012213.GD1810@S2101-09.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Stephen Warren <swarren@nvidia.com>, Dong Aisheng-B29396 <B29396@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 14, 2012 at 9:22 AM, Shawn Guo <shawn.guo@linaro.org> wrote=
:
> On Fri, Jan 13, 2012 at 10:16:36AM -0800, Stephen Warren wrote:
> ...
>> For reference, that message is:
>>
>> Linusw wrote:
>> > On Mon, Dec 5, 2011 at 3:43 AM, Dong Aisheng <dongas86 <at> gmail.=
com> wrote:
>> > > My current plan is to define all (might be frequently) used func=
toin
>> > > and groups for the exist upstreamed board like 53 Loco and etc, =
is
>> > > that ok?
>> >
>> > Yes, but do it in respective board file, so if we say, one day
>> > stops to support a certain board we can just delete that board
>> > file and be done with it.
>> >
>> > Plus this gives us a nice separation as we move toward
>> > device trees. (I think.)
>>
>> My interpretation of what Dong wrote there is "I'm only going to def=
ine
>> the functions and groups that are actually in use by upstream boards=
,
>> not everything the SoC supports". However, your (Shawn's) references=
 to
>> the email, it sounds like you're interpreting what Dong wrong as "I'=
m
>> going to define some virtual groups that don't exist in HW but repre=
sent
>> common use-cases of the HW".
>>
> Then what does the word 'groups' in Dong's sentence means with your
> understanding, considering there is no HW level pingroup on imx?
>
>> Admittedly, the wording of Linusw's actually seems to agree more wit=
h how
>> you're interpreting what Dong said, but in that case, I don't think =
his
>> reply makes sense - the whole purpose of the mux mapping table is to
>> represent the board-specific configuration. If we're going to circum=
vent
>> it, we should completely remove it from the pinctrl subsystem, rathe=
r than
>> having some boards avoid using it by creating virtual pin groups ins=
tead.
>>
> IMO, it's a compromise. =A0It still makes sense to have concept of
> pingroup in pinctrl subsystem, because platforms like Tegra have
> the HW pingroup.
>
IMO can we the 'virtual' pin groups for IMX first in this very first st=
ep?
At least we found it works for IMX and easy to us and it's also
suitable for Tegra
, maybe others too. It also meets the design of current pinctrl subsyst=
em.
And we can discuss and add individual pin support for dt later if reall=
y need,
that could avoid introducing much complexity for pinctrl dt support in
the first.

Beside although IMX does not group the pins together as a separate unit=
,
usually the pins are used in 'predefined' groups(from the meaning of pa=
d name)
in most cases.
I think it's ok to think those pins a hw group:
like SD1_CMD, SD1_CLK, SD1_DAT0..SD1_DAT7 although those pins can also
be used as other function.

Regards
Dong Aisheng

>> > > > For imx6q example, we have 193 pins as the muxable entities, a=
nd for
>> > > > each of those pin, there are 8 alternative functions. =A0Let's=
 see what
>> > > > we will have if we enumerate all the available functions for e=
ach pin.
>> ...
>> > > > We simply do not want to over bloat imx6q pinctrl driver with =
such
>> > > > enumeration.
>> > >
>> > > Yes, I see you'd end up with a huge number of function definitio=
ns here.
>> > >
>> > > You may be able to avoid this by changing the way you name/numbe=
r the
>> > > functions though.
>> > >
>> > > The example above has a unique function name for every individua=
l signal.
>> > > instead, can you name functions based on the controller they con=
nect to?
>> > >
>> > > So, instead of having:
>> > >
>> > > IMX6Q_PAD_SD2_DAT1__USDHC2_DAT1
>> > > IMX6Q_PAD_SD2_DAT2__USDHC2_DAT2
>> > > IMX6Q_PAD_SD2_DAT3__USDHC2_DAT3
>> > > IMX6Q_PAD_SD2_DAT4__USDHC2_DAT4
>> > >
>> > > Can you replace this with a single:
>> > >
>> > > IMX_FUNC_USDHC2
>> >
>> > So all 'enum imx6q_pad_*' goes away, and instead, we define macros
>> > IMX_FUNC_* at controller basis, correct?
>>
>> Yes, something like that. The best set to choose probably differs ba=
sed
>> on the SoC and its mux capabilities. But thinking more, if you're go=
ing
>> along this kind of route, I'd prefer to just define the "func0", "fu=
nc1",
>> ... "func7" functions that represent the raw HW selection instead.
>>
> In this case, I do not see any point to define them, since it does no=
t
> make too much difference than integer 0, 1, ..., 7.
>
> --
> Regards,
> Shawn
