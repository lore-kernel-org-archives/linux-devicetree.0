From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Fri, 25 Jan 2019 19:19:47 +0000
Message-ID: <20190125191947.um4w4e5jpsv2kcxc@e5254000004ec.dyn.armlinux.org.uk>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
 <20190125184330.dm3kaoewvbwddacy@xps>
 <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 08:07:56PM +0100, Heiner Kallweit wrote:
> On 25.01.2019 19:48, Carlo Caione wrote:
> > On 25/01/19 13:06, Russell King - ARM Linux admin wrote:
> >> On Fri, Jan 25, 2019 at 12:55:10PM +0000, Carlo Caione wrote:
> >>> SmartEEE, compatible with IEEE802.3az standard, is designed to include
> >>> legacy MAC without EEE capability into the power saving system. Smart=
EEE
> >>> is enabled by default configuration on AR8031 after power-on or hardw=
are
> >>> reset.
> >>>
> >>> Unfortunately this is proved causing issues for certain hw
> >>> configurations.=A0 We add a quirk to optionally disable SmartEEE.
> >>
> >> It may be a good idea to detail what "certain hw configurations" are
> >> and/or what the "issues" are, so it's easier to find this if/when
> >> others encounter the same issue.
> > =

> > This fix was upstreamed from the imx downstream kernel so I do not have=
 much informations on that but something is reported in the U-Boot fix for =
the same problem at [0] so I'll add more info in the next revision.
> > =

> > Cheers,
> > =

> > [0] https://patchwork.ozlabs.org/patch/1015783/
> > =

> Thanks for the link. According to the description SmartEEE works only if
> both link partners support it (hence are Atheros PHY's). I would assume
> that this usually isn't the case, shouldn't the feature be an opt-in
> therefore?

I'm not convinced about that - I've been using AtherOS SmartEEE with
i.MX6 for quite some time (I have patches which allow me to read out
the stats via ethtool, and configure it - they're specific to the
FEC driver though.)  SmartEEE works just like EEE for me, and I
notice no problems.

I have i.MX6 boards connected to Netgear GS116 and similar switches,
and also Marvell DSA switches on other platforms.

This is why I said above about "more detail".  Then maybe folk would
know what to look for to see whether there is a problem.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
