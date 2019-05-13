From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Convert vendor prefixes to json-schema
Date: Mon, 13 May 2019 08:02:08 -0500
Message-ID: <CAL_JsqK_pTxYd0iq=-yKTexWKueVqBSyNfOrfek9k-8pg3YE9w@mail.gmail.com>
References: <20190510194018.28206-1-robh@kernel.org> <20190511181753.GA2444@t60.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190511181753.GA2444@t60.musicnaut.iki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 11, 2019 at 1:23 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
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
> [...]
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > deleted file mode 100644
> > index e9034a6c003a..000000000000
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ /dev/null
> > @@ -1,476 +0,0 @@
> > -Device tree binding vendor prefix registry.  Keep list in alphabetical order.
> [...]
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > new file mode 100644
> > index 000000000000..be037fb2cada
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -0,0 +1,975 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>
> Is there a license change as well?

It is, as we're trying to dual license schema files when possible. I
have permission from Grant who was the primary author. Also, given
that the file is 235 different authors with most being 1-2 lines, I
don't think that really meets the threshold of being copyright
holders.

Rob
