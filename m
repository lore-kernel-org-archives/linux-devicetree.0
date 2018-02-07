From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Wed, 7 Feb 2018 14:49:57 +0100
Message-ID: <20180207134957.ysdowrgsyyyoxu5b@pengutronix.de>
References: <20180201174923.7385-1-l.stach@pengutronix.de>
 <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de>
 <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
 <1517914394.3175.21.camel@pengutronix.de>
 <CACRpkdbuGOrm=y=yPpsrkckk8+uKGxv6J9WGw9y=yiGcmbqn+w@mail.gmail.com>
 <1517932068.3175.27.camel@pengutronix.de>
 <CACRpkdYy43E5H=tRAf+YDvAY1RDTJ34nHSmqCXEn9xaknbLKZQ@mail.gmail.com>
 <20180207111156.a7cevrz3dbk2f4fb@pengutronix.de>
 <AM3PR04MB306B7EE043B75EFF5A7CE5280FC0@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB306B7EE043B75EFF5A7CE5280FC0@AM3PR04MB306.eurprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 07, 2018 at 01:21:44PM +0000, A.s. Dong wrote:
> Hi Sascha,
> 
> > -----Original Message-----
> > From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> > Sent: 2018年2月7日 19:12
> > To: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Lucas Stach <l.stach@pengutronix.de>; A.s. Dong
> > <aisheng.dong@nxp.com>; dl-linux-imx <linux-imx@nxp.com>; Gary Bisson
> > <gary.bisson@boundarydevices.com>; Vladimir Zapolskiy
> > <vladimir_zapolskiy@mentor.com>; Sascha Hauer <kernel@pengutronix.de>;
> > Mark Rutland <mark.rutland@arm.com>; Rob Herring <robh@kernel.org>;
> > open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > <devicetree@vger.kernel.org>; patchwork-lst@pengutronix.de;
> > linux-gpio@vger.kernel.org
> > Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
> > 
> > On Wed, Feb 07, 2018 at 10:09:20AM +0100, Linus Walleij wrote:
> > > On Tue, Feb 6, 2018 at 4:47 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> > >
> > > > To be fully honest I'm a bit annoyed with the pinctrl framework
> > > > making things (IMHO) unnecessarily complex, for what is basically a
> > > > pretty easy task.
> > >
> > > My ambition is to make things readable, understandable and
> > > maintainable. In generic terms, incorporating a bunch of knowledge of
> > > the electronics that really happen into the stuff we encode in the
> > > kernel.
> > >
> > > I guess it varies a bit on what goal one has.
> > >
> > > If the goal is "ship product with upstream kernel really fast now"
> > > then things like pinctrl-single.c where we just hammer magic values
> > > into registers, make sense. OMAP developers had no idea whatsoever
> > > what their ASIC people or cell library authors were doing so they just
> > > threw in the towel. HiSilicon also use this. Intels ambition was to
> > > use ACPI BIOS to handle all pin control and route around the kernel
> > > altogether, but that is not working out so well for them I think.
> > >
> > > All of them are approaches to avoid putting the hairy details into the
> > > kernel, just poke some magic values into some magic registers and be
> > > happy.
> > >
> > > So i.MX could have been like that, but then I guess you need to take
> > > legacy into account and discuss with the other i.MX driver authors
> > > about how they really wanted and want to do things.
> > >
> > > Their current silence wrt this mailchain is actually becoming a
> > > problem, and the problem is that discussing with you falls upwards to
> > > me as subsystem maintainer. Which sucks. I prefer that people who know
> > > this hardware discuss amongst themselves how they want things to work.
> > >
> > > Surely Sascha must have an opinion? It means much to me what he wants
> > > to do. I take it you guys are colleagues?
> > 
> > My opinion is that all that is generic about padctrl is a device driver saying "Put
> > my pins into a suitable mode". That is what padctrl is good for and we are there
> > for years now. I have always been happy with the plain register values in the
> > device tree. Before device tree we had exactly these values in the board files
> > and I never heard anyone complaining about it. There were defines for the bits
> > in the register which you could use when you were unhappy with plain register
> > values.
> > 
> > It's really trivial to look in the reference manual to make up the needed register
> > values. It's also trivial to take a register value and look into the reference
> > manual what this value does. Every translation layer, call it generic properties,
> > just makes things more complicated. Often enough our input is register value
> > tables from either our customers our from spreadsheets from FSL/NXP. Every
> > translation layer in the way just means we have to translate the already existing
> > register values into something hoping that this correctly translates back into the
> > register values.
> > 
> > It's not that some board designer comes up with "I need a drive strength of
> > 150mA" and wants to put that value into the device tree. Instead they start
> > with the reference manual, see which values they can (must) adjust and then
> > adjust the values until they are happy. No one wants to ask questions like "How
> > do I have to manipulate that device tree to change that particular bit?"
> > 
> > As said, I am happy with plain register values in the device tree and I consider
> > everything else overengineered.
> > FSL/NXP Reference Manuals are freely available and of high quality so everybody
> > can understand the register values. There's nothing magic to them. That might
> > change slightly when the Manuals are not available, but even then I think that
> > not the device tree ABI is the right place to add that missing documentation.
> > 
> 
> Probably as I first implemented generic pinconfig support for i.MX, personally
> I'm tend to it a bit, mainly because below reasons we find in real situations:
> 
> First and most important, plain register value is a bit error prone.
> (Actually we meet many times of issues during internal development).
> User has to compose it manually by refer to reference manual
> which might be more easy to mistake than using standard binding property.
> 
> And not everyone would like to compose the register value manually
> when writing their device tree, they may simply do copy & paste of an exist one
> and quickly test, if it works, everything is done. They don't know which setting is actually
> used as they can see nothing from the plain register value. Untill the device becomes
> unwork in some special circumstances, then they have to waste a lot time to find out
> the pad setting issue. This happens especially more often when switch to
> a new SoC while the pad config register layout changed a bit.
> We certainly would like to avoid it!
> 
> Secondly, plain register value is also unreadable and unmaintainable,
> also not quite friendly in reviewing other one's patches.
> 
> Last, it might be trivial, people don't want to refer to reference manual
> again and again once being asked which driver strength or something else
> Is used.

These issues could be solved by bitmask defines aswell, no need to bloat
the dtbs with strings.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
