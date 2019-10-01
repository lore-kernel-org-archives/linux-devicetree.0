From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] regulator: Document "regulator-boot-on" binding more thoroughly
Date: Tue, 1 Oct 2019 12:46:35 -0700
Message-ID: <CAD=FV=UE4K8Oj99KA5HNBxX0pXu11bkHjdwcmwwW3Z-+_nDiLA@mail.gmail.com>
References: <20190926124115.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid>
 <20191001174104.GD4786@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001174104.GD4786@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, ckeepax@opensource.cirrus.com, Chunyan Zhang <zhang.chunyan@linaro.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Oct 1, 2019 at 10:41 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 26, 2019 at 12:41:18PM -0700, Douglas Anderson wrote:
>
> > -    description: bootloader/firmware enabled regulator
> > +    description: bootloader/firmware enabled regulator.
> > +      It's expected that this regulator was left on by the bootloader.
> > +      If the bootloader didn't leave it on then OS should turn it on
> > +      at boot but shouldn't prevent it from being turned off later.
>
> This is good...
>
> > +      This property is intended to only be used for regulators where
> > +      Linux cannot read the state of the regulator at bootup.
>
> ...but we shouldn't say "Linux" here since the DT binding is for all
> OSs, not just Linux.  I'd say "software" instead.  Really the
> expectation is that things wouldn't support readback at all, though it's
> possible there's some weird hardware out there that will support
> readback some of the time I guess.

Argh.  I knew not to mention "Linux" and kept it in mind to write the
first part.  ...but then I must have just spaced.  I also removed the
"at bootup" part since it seemed better.

-Doug
