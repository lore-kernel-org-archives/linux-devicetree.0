From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 13/36] dt-bindings: arm: Convert PMU binding to
 json-schema
Date: Fri, 19 Oct 2018 11:34:51 +0100
Message-ID: <20181019103451.GB14246@arm.com>
References: <20181005165848.3474-1-robh@kernel.org>
 <20181005165848.3474-14-robh@kernel.org>
 <20181009115713.GE6248@arm.com>
 <CAL_JsqLeG3WUa2peOWFGUoMuonWaWJoU-7A6d8cqXp-_e3B3XA@mail.gmail.com>
 <20181010165048.GB16512@arm.com>
 <CAL_Jsq+NExxsksmhA6z5_eTutVkm_NFthayvHz-vvq1gkSeXNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+NExxsksmhA6z5_eTutVkm_NFthayvHz-vvq1gkSeXNA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Oct 10, 2018 at 01:51:24PM -0500, Rob Herring wrote:
> On Wed, Oct 10, 2018 at 11:50 AM Will Deacon <will.deacon@arm.com> wrote:
> > On Tue, Oct 09, 2018 at 01:14:02PM -0500, Rob Herring wrote:
> > > I guess the single interrupt case is less obvious now with no
> > > description (it's the first list item of 'oneOf'). The schema If the
> > > single interrupt is not supported, then we can drop it here.
> >
> > Well the description says "1 interrupt per core" which is incorrect.
> 
> You are reading the schema wrong. There are 2 cases supported as
> defined by each '-'. The 2nd case is all the keywords until the
> indentation decreases. So 'description' is just description of the 2nd
> case. The first case is just "maxItems: 1". I probably didn't put a
> description because why write in free form text what the schema says
> (other than of course no one knows json-schema...).

Apologies, I've not read one of these things before and looks like I
completely misread it.

> YAML combines the best of Makefiles and python. You can't have tabs
> and Indentation is significant. :)

Oh wow, I'm in way over my head here!

> > I also
> > don't understand why maxItems is 8.
> 
> Humm, I probably just made that up based on GICv2 limitations. What
> should it be? If there's not any inherit maximum, can we put something
> reasonable? There's not really any way to express that it should match
> the number of cores in the system.

What's the largest number you can think of?

Will
