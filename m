From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcs404: evb: Fix voltages for s5 and l3
Date: Mon, 4 Feb 2019 08:03:37 -0800
Message-ID: <20190204160337.GG2387@tuxbook-pro>
References: <20190125232954.26166-1-bjorn.andersson@linaro.org>
 <32b8136d-3acb-66e9-948c-ee8903b91401@linaro.org>
 <20190129224652.GB11349@centauri.lan>
 <20190204104347.GD23441@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190204104347.GD23441@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon 04 Feb 02:43 PST 2019, Mark Brown wrote:

> On Tue, Jan 29, 2019 at 11:46:52PM +0100, Niklas Cassel wrote:
> 
> > Adding Mark Brown on CC.
> 
> It really helps if you ask a specific question when doing something like
> this rather than just have a big quoted mail - it makes it much easier
> to find what's relevant rather than trying to find things, especially
> when they're buried behind several layers of quoting.
> 
> > On Tue, Jan 29, 2019 at 10:58:47PM +0100, Jorge Ramirez wrote:
> > > On 1/26/19 00:29, Bjorn Andersson wrote:
> 
> > > the question is, should this property contain only hardware achievable
> > > values? or should drivers only request hardware achievable values? the
> > > way the constrains are implemented it has to be one of the two (I think
> > > the former would be more intuitive - ie if the dts
> > > regulator-min-microvolt is a valid value)
> 
> Drivers should not be coded with a specific regulator or board in mind
> and should just request whatever they need.  This will then be matched
> with whatever the board is actually able to deliver.  Similarly there is
> no requirement that machine constraints be written with specific
> reference to what the physical regulator on the board is able to do, for
> example the constraints will come from electrical engineering
> restrictions like the specifications of the parts connected to the
> regulator rather than from what the regulator can actually do so people
> should feel free to just write down the actual physical constraint and
> let the regulator API ensure that the constraint is met.

We have a regulator that is described as 1.05V in the schematics for the
board we're working on and we have the USB block wanting 1.05V on one of
its pins.  But the particular regulator works in steps of 8mV, and the
adjacent steps are 1.048V and 1.056V.

A) If we describe the min-microvolt = max-microvolt = 1.05V then the
regulator frameworks adjusts the min value to 1.056V, per the steps, and
fail as min > max.

B) The USB driver that we inherited was written to request min/max of
1.05V/1.05V, so pointing this to a regulator with min/max of e.g.
1.05V/1.06V we're outside the adjusted range of 1.056V/1.06V.


So the question is, should the board dts be written with
min/max-microvolt adjusted to match the hardware steps? Or could the
regulator framework be made to round down to the previous valid step
instead of up?

Regards,
Bjorn
