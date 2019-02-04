From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcs404: evb: Fix voltages for s5 and l3
Date: Mon, 4 Feb 2019 11:25:10 -0800
Message-ID: <20190204192510.GZ31919@minitux>
References: <20190125232954.26166-1-bjorn.andersson@linaro.org>
 <32b8136d-3acb-66e9-948c-ee8903b91401@linaro.org>
 <20190129224652.GB11349@centauri.lan>
 <20190204104347.GD23441@sirena.org.uk>
 <20190204160337.GG2387@tuxbook-pro>
 <20190204182321.GH23441@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190204182321.GH23441@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon 04 Feb 10:23 PST 2019, Mark Brown wrote:

> On Mon, Feb 04, 2019 at 08:03:37AM -0800, Bjorn Andersson wrote:
> 
> > We have a regulator that is described as 1.05V in the schematics for the
> > board we're working on and we have the USB block wanting 1.05V on one of
> > its pins.  But the particular regulator works in steps of 8mV, and the
> > adjacent steps are 1.048V and 1.056V.
> 
> > A) If we describe the min-microvolt = max-microvolt = 1.05V then the
> > regulator frameworks adjusts the min value to 1.056V, per the steps, and
> > fail as min > max.
> 
> Right, because that constraint isn't satisifiable on the board, an exact
> value has been asked for which can't be delivered.  We *could* try to
> allow some fudge factor for tolerance but that feels risky, it'd be
> better if the constraints were written to be satisfiable.
> 

Okay, I don't see a big problem with expecting the DT to only contain
values that the hardware can actually do. I do however see that
machine_constraints_voltage() has been changes to expect the driver to
return -ENOTRECOVERABLE when we don't have a way to query the voltage
during probe.

Updating the qcom_smd-regulator driver to do this causes this regulator
to not be probed as we now have:
[    0.199911] l3: Setting 1050000-1050000uV^M
[    0.199927] l3: unsupportable voltage constraints 1056000-1048000uV^M

So there's a risk of this breaking compatibility with older dtb files on
other boards. We will have to do some more verification on this.

But we can start by making sure we're specifying valid constraints for
the hardware.

> > B) The USB driver that we inherited was written to request min/max of
> > 1.05V/1.05V, so pointing this to a regulator with min/max of e.g.
> > 1.05V/1.06V we're outside the adjusted range of 1.056V/1.06V.
> 
> This is just very bad practice on the part of the USB driver, if it is
> not varying the voltage it should not be setting the voltage and let the
> machine figure things out.  It is completely pointless for the driver to
> be setting an exact value that it never varies, this is the sort of
> thing machine constraints are for as it leads to trouble like this.
> This is one of the many unfortunate practices in the Qualcomm BSP code
> sadly.
> 

We're taking care of this, but I spotted the min = max =
non-supported-value issue on SDM845 recently as well and wanted to know
which path to take.

> > So the question is, should the board dts be written with
> > min/max-microvolt adjusted to match the hardware steps? Or could the
> 
> Well, it is definitely unwise of the board to request a specific
> voltage if the board can't physically set it, that's asking for trouble,
> so I'd have expected the board should pick the value it wants.
> 

Agreed, and if we can make the initial get_voltage fail with
-ENOTRECOVERABLE then we get a proper failure on an invalid DT, so I'll
review the other platforms using this driver to see if we can introduce
this.

> > regulator framework be made to round down to the previous valid step
> > instead of up?
> 
> We definitely don't want to round voltages down, it is vastly more
> common for devices to experience problems like brownouts if they go
> under voltage so it'd be more likely to cause harm than good.

We're 2mV off in this case, but it could have been way off. So I'm good
with this position.

Thanks Mark

Regards,
Bjorn
