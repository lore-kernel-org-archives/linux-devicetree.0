Return-Path: <SRS0=qchw=UL=verge.net.au=horms@kernel.org>
Date: Wed, 12 Jun 2019 13:55:21 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Message-ID: <20190612115520.27likbbmm7dqbx7u@verge.net.au>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
 <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612111900.2crgsg4adinrrw5u@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612111900.2crgsg4adinrrw5u@ninjato>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 12, 2019 at 01:19:00PM +0200, Wolfram Sang wrote:
> 
> I think it is confusing to describe a HS400 property if the HW is not
> capable of it. Even if the driver has a safety check and will prevent it
> from being used.
> 
> But as I said, I won't be insisting. I understood it simplifies things
> in grouping boards. From my side, we can close the case here.

I would slightly prefer if the property was left out
for one thing, how can we verify the board supports HS400 at this time?
