From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa
 boards
Date: Tue, 11 Dec 2018 13:36:40 +0100
Message-ID: <20181211123640.GC4632@lunn.ch>
References: <1541086962-52626-1-git-send-email-michal.vokac@ysoft.com>
 <5bea0e99.1c69fb81.18be0.5162@mx.google.com>
 <42ffee3e-7c2a-aab9-547f-2064a77339a8@ysoft.com>
 <a61683a2-30aa-e387-2170-3d79e0043739@ysoft.com>
 <18065d41-4ae0-ada2-35f1-00d8a8489397@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <18065d41-4ae0-ada2-35f1-00d8a8489397@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Vm9rw6HEjQ==?= Michal <Michal.Vokac@ysoft.com>
Cc: Rob Herring <robh@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

> > Hi Rob, gentle ping on this.
> > 
> > I would like to be sure how to proceed with this. Do you really want me
> > to move *all* nodes that are disabled in this common dtsi into the per
> > board dts?
> > 
> > All the boards use identical PCB. Anything that is disabled here is not
> > present on at least one of the boards. It means it is routed on the
> > board and the SoC has the capability but the parts are not populated.
> > 
> > So it is not only about the LED controller. What about the LCD, OLED,
> > backlight, USB..?
> 
> Can anybody advice how to split these dts/dtsi files, please?
> I am not sure what should reside in the common dtsi and what should
> be moved into the per board dts in case my current solution is not
> appropriate.

The kirkwood-synology.dtsi might be of interest? There are a lot of
Synology NAS boxes which share a lot in common. So all the common
parts are in that .dtsi. The .dbs file for each individual model then
enables the parts its needs.

Although you have one PCB, or the different population options
considered different products, each with there own name?

	   Andrew
