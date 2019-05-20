From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Convert vendor prefixes to json-schema
Date: Mon, 20 May 2019 11:35:01 -0500
Message-ID: <CAL_JsqLbuuO9YHYwTXV5ZEGOjzZHgVsWD=TCYk4cYpm0v1zHkQ@mail.gmail.com>
References: <20190510194018.28206-1-robh@kernel.org> <20190520131846.tqx7h7sjyw6sgka5@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520131846.tqx7h7sjyw6sgka5@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 8:18 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> On Fri, May 10, 2019 at 02:40:18PM -0500, Rob Herring wrote:
> > Convert the vendor prefix registry to a schema. This will enable checking
> > that new vendor prefixes are added (in addition to the less than perfect
> > checkpatch.pl check) and will also check against adding other prefixes
> > which are not vendors.
> >
> > Converted vendor-prefixes.txt using the following sed script:
> >
> > sed -e 's/\([a-zA-Z0-9\-]*\)[[:space:]]*\([a-zA-Z0-9].*\)/  "^\1,\.\*\":\n    description: \2/'
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > As vendor prefix updates come in via multiple trees, I plan to merge
> > this before -rc1 to avoid cross tree conflicts.
>
> I just tried this with the 5.2-rc1 release, and this very
> significantly slows down the validation.
>
> With a dtbs_check run on (arm's) sunxi_defconfig, on my core-i5 with 4
> threads, I go from 1.30 minutes to more than 12.

Indeed. 6 min to 45 min for allmodconfig. However, it's only 5 min to
run checks with only this file. I'd expect a more linear hit. Maybe
we're exceeding some cache size and thrashing.

> Should we improve the dt-validate tool before merging this patch?

How? I've looked at optimizing things some and implemented areas I
found (primarily, saving the fixed-up schema and not printing line
numbers (of the yaml encoded DT)).

I've been wanting to have some way to categorize checks, so we can
split rules from pedantic guidance. Maybe we can add a level keyword
in select or something.

Short term, I'm fine with just disabling this one by default with
'select: false'.

Rob
