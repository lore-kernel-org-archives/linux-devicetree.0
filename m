MIME-Version: 1.0
Date: Wed, 19 Dec 2018 08:05:00 -0600
References: <20181217144324.99422-1-chris.brandt@renesas.com>
	<20181217144324.99422-2-chris.brandt@renesas.com>
	<20181218150551.GA15519@bogus>
In-Reply-To: <20181218150551.GA15519@bogus>
Message-ID: <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 18, 2018 at 9:05 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 17, 2018 at 09:43:23AM -0500, Chris Brandt wrote:
> > Basic support for the RZ/A2 (R7S9210) SoC.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---

> > +     gic: interrupt-controller@e8221000 {
> > +             compatible = "arm,gic-400";
>
> Kind of strange that a single core A9 uses an external GIC rather than
> the built-in one.

Still have this question on v4. It should be "arm,cortex-a9-gic" if
the A9 built-in GIC is used.

Rob
