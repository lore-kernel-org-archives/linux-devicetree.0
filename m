From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Date: Mon, 17 Jun 2019 13:41:24 -0600
Message-ID: <CAOCk7NpwMzhbbvwp-vy3TvbadTHqxqVau6yfds+pSOPG=2Qb7g@mail.gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com> <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk> <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
 <20190617160358.GC5316@sirena.org.uk> <CAOCk7Nrnd7yJQ=0pO64iT+RfmsKfJW0x0RhrmSLkO_brFqZ2+Q@mail.gmail.com>
 <20190617183757.GH5316@sirena.org.uk> <CAOCk7NpbZwAreGpVCvF2yFBDJKbAxBZ23oncfF_SyEwoiC2+PQ@mail.gmail.com>
 <20190617192413.GI5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617192413.GI5316@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 1:24 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jun 17, 2019 at 01:06:42PM -0600, Jeffrey Hugo wrote:
> > On Mon, Jun 17, 2019 at 12:37 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > Something really weird is going on with the word wrapping in your mail,
> > > it looks like you're writing lines longer than 80 characters (120?) and
> > > they're getting a newline added in the middle of the line to wrap them
> > > without reflowing the paragraph.
>
> > Doh.  Hopefully this one is better.
>
> Yes, thanks!  Though now it's off-list :/

Doh.  Added everyone back.

>
> > > Well, it doesn't *have* to be the raw register value, more accurately
> > > it's some token which is useful for passing to and from the hardware;
> > > The documentation such as it
> > > is is in the documentation of the list_voltage() operation (which is
> > > what defines the selector values for a given driver).
>
> > Ok, so this one bit -
> > Selectors range from zero to one less than regulator_desc.n_voltages.
> > Voltages may be reported in any order.
>
> Yes.
>
> > So, I understand that.  Its an indexing of the supported voltages.
> > From my perspective, that has nothing to do with hardware.  Its just a
> > remapping of the values to a different set.  Voltages X, Y, and Z map
> > to 0, 1, and 2.  Its a token so that the driver and the framework can
> > use a common value.
>
> > I really think we are on the same page here, its just I was getting
> > confused by how you were describing it in your replies.
>
> Yes, I was just coming from the perspective that for almost all hardware
> the selectors are chosen to be the values that are in the bitfield that
> the hardware uses to specify the voltage since that's the most common
> thing and tends to make things simpler for people, it's also the primary
> place where the concept came from.
>
> > > Your idea of very basic implementations is how the overwhelming majority
> > > of hardware is implemented.  Regulators with register maps will tend to
> > > just have a bitfield where you set the voltage with each valid value in
> > > that bitfield mapped to a single voltage, the exceptions tend to use
> > > direct voltage values instead (and not support enumeration at all).
>
> > > Looking at the driver I think it's got what the helpers are terming
> > > pickable linear ranges (naming is hard) and could use those helpers.
>
> > I'm pretty sure Stephen Boyd and Bjorn just investigated that a few
> > weeks ago, and came to the conclusion that it can't because of things
> > like the hardware really wants to stay in the same range if at all
> > possible, which is not behavior the pickable linear ranges seems to
> > support.
>
> Sounds like it just needs a custom map_voltage() function?  Though
> thinking about it it's possibly worth just making the standard map try
> to keep things in the same range as that will if nothing else reduce the
> number of I/O operations.  Probably also reduce glitches if there's
> overlapping ranges.

I didn't think so when I was paying attention to their discussion.
However maybe I missed something.  I think I'll take another look.
Might make for a nice cleanup, but if its just in the driver, or if it
involves updating the framework, it seems to be outside scope for this
series of changes.
