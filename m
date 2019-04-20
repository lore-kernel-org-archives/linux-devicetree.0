Return-Path: <SRS0=utuj=SW=nxp.com=peng.fan@kernel.org>
From: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Sat, 20 Apr 2019 13:38:14 +0000
Message-ID: 
 <AM0PR04MB44812EBB23214A5892C3E04C88200@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Sudeep Holla <sudeep.holla@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>, Silvano Di Ninno <silvano.dininno@nxp.com>, Andre Przywara <andre.przywara@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sudeep,

Sorry if this reply breaks email thread, I need to manual remove some NXP I=
T policy words from email.

>=20
> On Wed, Apr 17, 2019 at 04:21:55PM +0000, Leonard Crestez wrote:
> > On 4/17/2019 4:33 PM, Sudeep Holla wrote:
> > >>> I don't yet buy the security argument. There are many more shared
> > >>> parts on the SoC, like the clock controller, that would need to be
> > >>> taken away from the non-secure world if one would want to run an
> > >>> untrusted OS kernel on a i.MX8M system.
> > >>>
> > >>> To properly implement security on any i.MX8M based system the
> > >>> firmware would need to grow something like a full ARM SCPI
> > >>> implementation, so all shared critical peripherals are solely under
> firmware control.
> > >>
> > >> It might be possible to rework this to use some form of
> > >> SCMI-over-SMC instead of vendor-specific SMCCC SIP calls
> > >
> > > Sounds feasible and good if all the custom IDs/calls/..etc are well
> > > hidden in the firmware(TF-A in this case) behind the existing
> > > abstraction in Linux kernel.
> >
> > >> Hiding everything critical for security (especially CCM) behind a
> > >> SCMI interface would be a large amount of work but introducing SCMI
> > >> incrementally (starting with imx8mm power) would be useful by
> > >> itself because it simplifies OS implementation.
> > >
> > > Agreed, but not at the expense of introducing and maintaining
> > > *random*
> > > *one-off* *custom* SMC extensions. Sorry, that's not open to debate.
> > >
> > >> Many at NXP have attempted to evaluate SCMI and their conclusion
> > >> has always been that "many extensions are required".
> > >
> > > I would like to hear the evaluation. Don't assume that you need to
> > > implement something similar to ARM SCMI reference design. All OSPM
> > > like Linux kernel cares is conformance to the interface, what/how
> > > you implement on the other side is left to you.
> >
> > Brief summary from some attempts at nudging NXP devs towards SCMI:
> >
>=20
> Thanks for providing the evaluation details.
>=20
> >
> > There is no SCMI-over-SMC support specified? This would make it
> > possible to use SCMI as a purely software solution on platforms which
> > did not take SCMI into account at hardware design time or which don't
> > have a dedicated SCP inside the SOC. This applies to all imx.
> >
>=20
> While I admit, the section of SCMI specification that touches transport i=
s quite
> lean, I would view it as done intentionally as the specification is mainl=
y
> concentrated on it's subject matter which is protocol and not the transpo=
rt
> itself. So did the evaluation attempted to consider/try SMC as transport
> retaining protocol as is ?
>=20
> I can't see any issues with that and hence I am asking it loud here.

To take SMC as a virtual maibox, there is no interrupt doorbell.
So I modify poll_completion to true for my test.

SCMI transports mailbox use a shared memory for data transfer and response.
But actually it should be ok use mailbox registers or smc cpu registers.

>=20
> > Peng has been looking at some out-of-tree arm-smc-mailbox patches so
> > it's not just NXP which would like the option of implementing SCMI
> > vendor side in ATF. Like this:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flwn=
.
> >
> net%2FArticles%2F726861%2F&amp;data=3D02%7C01%7Cpeng.fan%40nxp.co
> m%7Cc6b
> >
> 07ec02c5d4fa6c24908d6c40c3dcf%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0%7
> >
> C0%7C636911954210639761&amp;sdata=3DpJ8bHojmm8bP4sft2cBxzocdN%2F
> bLFQdGeW
> > 2ilnnfzw8%3D&amp;reserved=3D0
> >
>=20
> OK, any inputs from that study ?

I am still at a very initial stage trying scmi over smc with basic communic=
ation work,
Base protocol, power domain protocol work. Power domain set/get still not r=
eady.

As Leonard mentioned before, clk hierarchy is very intricate and it relies =
on many
clk core features. We need SCMI spec could cover that, such as mux, parent.

I have not tried clock protocol, if wrong, please correct
1. CLOCK_RATE_SET/RATE_GET will hide the complexity for OS, but move the=20
  complexity to firmware.=20
  However, on i.MX8M, we would keep the clk hierarchy in Linux side, and
  in firmware we add a check to check whether allow the mux, reparent,=20
  gate change or not. In this way, we could minimize the firmware binary
  size and use Linux clk core features. clk-scmi.c are not able to serve th=
e
  requirement, we need do clk_register with mux/gate/divider with SCMI
  wrapper in Linux side.
2. Some i.MX8M power domain on needs clk being enabled, such as
  https://elixir.bootlin.com/linux/v5.1-rc5/source/arch/arm64/boot/dts/free=
scale/imx8mq.dtsi#L320
  need extend scmi driver. However scmi does not have a power domain
  tree in Linux dts, it call into firmware to find which power domain is ne=
eded
  for Linux, then register it.

3. some i.MX8M power domain off needs external regulator power off
  to save power, need extend scmi driver. But since there is no power domai=
n
  tree, I do not find a good way to add regulator. Moving regulator logic
  to firmware will require i2c support in ATF to communicate with pmic,
  however pmic has many outputs not only for the upper power domain,
  moving i2c to ATF will incur risk when OS and ATF both access the pmic.

>=20
> > Blessing SCMI-over-SMC would allow stuff like intercepting a SCMI
> > message in EL2; checking if the guest is allowed to use that resource
> > and then either forward to EL3 or return an error.
> >
>=20
> Why are you mixing virtualisation and EL2 here ? Yes we need them but it
> should be optional and if a platform doesn't need it, it should be possib=
le to
> skip it.
>=20
> >
> > SCMI clock protocol does not cover muxes? On imx the clk hierarchy is
> > very intricate and it relies on many clk core features (including
> > notifiers) and occasional assigned-clocks-parents properties to
> > control muxes from linux. Moving all that to firmware would be a huge
> > amount of effort.
> >
>=20
> Yes it may be huge amount of work. But is it completely safe as claimed ?
> Giving access to mux controls in OSPM is no so safe/secure in the modern
> world. So you either make it safe with that extra huge effort needed or j=
ust
> keep everything in OSPM. But IMO anything in between is not worth it.
>=20
> > If SCMI included a generic clk mux and allowed keeping the clk
> > hierarchy inside linux then the effort required for hiding the CCM
> > would still be large, but more approachable. It would not "simplify
> > the rich OS" but it would still improve security.
> >
>=20
> Why do you need to keep the clk hierarchy in Linux ?

Just replied above.

Hiding the clk tree in Linux would keep the complexity
in ATF in our case, and enlarge the ATF binary size, and not
able to use some clk core features.

>=20
> >
> > Last point is that SCMI does not cover pinctrl? This is a large chunk
> > of firmware functionality on some imx and security control over
> > individual pins is desirable.
> >
>=20
> Yes but is that something available at runtime ? Can't that be one-off fi=
rmware
> setting. Will Linux need to configure it differently on each boot ?
> Just trying to understand. You say security control here and is it really=
 safe to
> give OS access to control those ?

There is a iomux controller for pinctrl usage on i.MX8M, it could be set to
secure world read/write, Non secure world read/write block.
With pinctrl over SCMI, we could add check to see whether allow Linux
to modify some iomux registers that are used by TEE.

>=20
> In short, if you had a full blown protocol like few other platforms, the =
push
> back would have been minimal. Instead, i.MX chose to implement a solution
> which doesn't have a design thought before and custom SMC APIs added on
> fly whenever a new request is raised by OSPM to control things that it th=
inks it
> should. I am sure, the very next platform will have it's own set of
> requirements and custom SMC APIs/interface and no one has even bothered
> about long term maintenance of these.
>=20

As I tried and still trying SCMI over SMC, the current SCMI spec/code
could not serve our requirement.

I wonder will SCMI spec open to community and maintained by
community for adding new feature? If there is github repo for this,
I think we could submit issue/pull request for new feature.
Or is it possible that we submit code to Linux scmi, then drive SCMI
spec change?

Thanks,
Peng.

> So assuming that trend, I would NACK this as it stands.
>=20
> --
> Regards,
> Sudeep
