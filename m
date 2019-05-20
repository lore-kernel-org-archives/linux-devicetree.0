From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Convert vendor prefixes to json-schema
Date: Mon, 20 May 2019 16:23:20 -0500
Message-ID: <CAL_JsqKAP85+KnQtq-xaOdX-BetB0pA7+LT8vd6w=Yz4VWnQJg@mail.gmail.com>
References: <20190510194018.28206-1-robh@kernel.org> <20190520131846.tqx7h7sjyw6sgka5@flea>
 <CAL_JsqLbuuO9YHYwTXV5ZEGOjzZHgVsWD=TCYk4cYpm0v1zHkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLbuuO9YHYwTXV5ZEGOjzZHgVsWD=TCYk4cYpm0v1zHkQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 11:35 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 20, 2019 at 8:18 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Hi Rob,
> >
> > On Fri, May 10, 2019 at 02:40:18PM -0500, Rob Herring wrote:
> > > Convert the vendor prefix registry to a schema. This will enable checking
> > > that new vendor prefixes are added (in addition to the less than perfect
> > > checkpatch.pl check) and will also check against adding other prefixes
> > > which are not vendors.
> > >
> > > Converted vendor-prefixes.txt using the following sed script:
> > >
> > > sed -e 's/\([a-zA-Z0-9\-]*\)[[:space:]]*\([a-zA-Z0-9].*\)/  "^\1,\.\*\":\n    description: \2/'
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > As vendor prefix updates come in via multiple trees, I plan to merge
> > > this before -rc1 to avoid cross tree conflicts.
> >
> > I just tried this with the 5.2-rc1 release, and this very
> > significantly slows down the validation.
> >
> > With a dtbs_check run on (arm's) sunxi_defconfig, on my core-i5 with 4
> > threads, I go from 1.30 minutes to more than 12.
>
> Indeed. 6 min to 45 min for allmodconfig. However, it's only 5 min to
> run checks with only this file. I'd expect a more linear hit. Maybe
> we're exceeding some cache size and thrashing.

Looks like the problem is a cache. The python regex cache. Changing
re._MAXCACHE from 512 to 4096 fixes the problem. I can set this in the
dtschema lib.

Rob
