From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: An extremely simplified pinctrl bindings proposal
Date: Mon, 6 Feb 2012 20:26:52 +0100
Message-ID: <CACRpkdYt-L+an5DTdYkS5Hi+18-rszAt7hXwZNUNVK-d0UaCWA@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
	<4F302474.1020701@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F302474.1020701@firmworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mitch Bradley <wmb@firmworks.com>
Cc: Stephen Warren <swarren@nvidia.com>, Dong Aisheng <dongas86@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, "ext Tony Lindgren (tony@atomide.com)" <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2012 at 8:05 PM, Mitch Bradley <wmb@firmworks.com> wrote=
:

> I like the general approach of simplifying the pinctrl thing, as the
> previous approach did not appear to be converging.

pinctrl as such is upstream, widely ACKed and quite converged I'd say.

But the Device Tree bindings and general path to get data out of the dr=
ivers
and board files are not (yet) converging...

> Both Open Firmware and ACPI have addressed this general problem. =A0I=
n
> addition to a numeric identifier for the register, you need to specif=
y the
> access semantics. =A0It's difficult to finitely enumerate all possibl=
e cases,
> but you can get to 99.9% with a modest number of access models, and t=
hen add
> new models as needed.

This is interesting. So are you referring to a piece of Open Firmware
that is not in the Device Tree? Since this is all about device tree tha=
t
comes from OF, we might be reinventing the wheel.
Can you give some pointers?

Indeed it seems related to ACPI or some BIOS stuff on
non-embedded systems.

Yours,
Linus Walleij
