From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [RFC v3 1/3] gpio: dt-bindings: add basic-mmio-gpio bindings
Date: Thu, 28 Apr 2016 10:48:45 +0200
Message-ID: <4157402.TZZDVdqqxO@debian64>
References: <cover.1461710784.git.chunkeey@googlemail.com> <CAL_JsqKYU=W8DhVjgihgPiu2B_QgLnFqDqX-soghHDFVUGtAOQ@mail.gmail.com> <CAAVeFuLeQRLReHQbwM5mBtoUG7zKcuw8ScNaV_0-MLw48QZsOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuLeQRLReHQbwM5mBtoUG7zKcuw8ScNaV_0-MLw48QZsOw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

On Thursday, April 28, 2016 03:20:39 PM Alexandre Courbot wrote:
> On Thu, Apr 28, 2016 at 12:08 AM, Rob Herring <robh+dt@kernel.org> wrote:
> > On Wed, Apr 27, 2016 at 5:15 AM, Christian Lamparter
> > What I meant was convert the drivers, not the dts files to a generic
> > driver. There is no benefit here from a dts perspective. It is driver
> > consolidation that would make all this worthwhile.
> > [...]
> > My other worry about this is next someone will want to add interrupt
> > registers which is probably a majority of GPIO controllers.
> >
> > Of course, I'm sure Linus has an opinion on all of this.
> 
> I'm not Linus, but after a quick look at the drivers mentioned by
> Christian I see little room for improvement (but still some - see
> below). Like Rob mentioned we want the DT's compatible property to
> describe the hardware as precisely as possible. "basic-mmio-gpio" is
> not precise and not backward-compatible. The examples listed by
> Christian are already all using the generic MMIO driver and are thus
> already quite short.
> [...]
> So without touching the DT I think consolidating the bgpio users in a
> fashion similar to what simple-panel does would be worthwhile.
I'm getting ready to update my series with a patch like that. I would
like to consolidate the gpio drivers into a single file. But for the
v4 series at least the parsers are still residing in their original files
(I hoped this would make the transition from the _probe to the parser
less painless but the diff came out pretty much unreadable). 
I think this would be just a matter of what's preferred.
