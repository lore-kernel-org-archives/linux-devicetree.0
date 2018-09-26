From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Olimex A64-OLinuXino: fix
 ethernet
Date: Wed, 26 Sep 2018 11:45:25 +0200
Message-ID: <20180926094525.e4fepvonmy7ykdbb@flea>
References: <20180919141938.18791-1-rodrigo@tjader.xyz>
 <20180921142941.5ymp7ksphgboxrwz@flea>
 <CAG7TQgFOuHHmkm-6CDDYJ6KuDqfjNvFjnt8_9BPYfdP=oV57VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG7TQgFOuHHmkm-6CDDYJ6KuDqfjNvFjnt8_9BPYfdP=oV57VQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rodrigo =?utf-8?B?RXh0ZXJja8O2dHRlciBUasOkZGVy?= <rodrigo@tjader.xyz>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

On Fri, Sep 21, 2018 at 12:25:53PM -0300, Rodrigo Exterckötter Tjäder wrote:
> On Fri, Sep 21, 2018 at 11:30 AM Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> > On Wed, Sep 19, 2018 at 11:19:36AM -0300, Rodrigo Exterckötter Tjäder wrote:
> > > Without "allwinner,tx-delay-ps = <600>;" on the DTP it can receive packets
> > > but not send.
> > >
> > > Signed-off-by: Rodrigo Exterckötter Tjäder <rodrigo@tjader.xyz>
> >
> > Again, that commit log would be nice if it was a bit more
> > explicit. What is a DTP? How did you come up with that value? What is
> > the value used by Allwinner/Olimex, and why did you use another one if
> > you did?
> 
> Thanks for the feedback.
> 
> DTP is a typo, it should have been DT for "device tree".
> 
> Olimex's provided device tree uses a different driver for ethernet,
> but it has a property named "tx-delay" with value 6 and the range of
> the property is 0-7. On dwmac-sun8i's bindings documentation it says
> allwinner,tx-delay-ps has a range of 0-700 and must be a multiple of
> 100, so I tried 600 and it works.
>
> I'm not sure how much of that I should include in the commit log,
> perhaps something like this:
> 
> ---
> arm64: dts: allwinner: OLinuXino: PHY TX clock delay
> 
> The PHY requres a delay on the TX clock, otherwise it is not able to send
> any packets on the interface.
> 
> Olimex's device tree uses 6 in a range of 0-7, dwmac-sun8i requires a
> multiple of 100 in the range 0-700.
> 
> Signed-off-by: Rodrigo Exterckötter Tjäder <rodrigo@tjader.xyz>

There's no need to be so specific though :)

Something like that would work:

arm64: dts: allwinner: a64-olinuxino: set the PHY TX delay

The PHY found on the A64-Olinuxino requires a TX delay in order to
operate properly. Olimex uses a 600ps second delay in their BSP, and
that has been found to work, so let's use that value in the current
DT.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
