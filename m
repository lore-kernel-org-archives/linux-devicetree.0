Return-Path: <robherring2@gmail.com>
Date: Fri, 26 Jul 2019 17:40:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: nvmem: SID: Fix the examples node names
Message-ID: <20190726234007.GA7328@bogus>
References: <20190703095421.11798-1-maxime.ripard@bootlin.com>
 <CAL_Jsq+fqJe5_H80xwimsjueVCEwxbNa2sVQCAg=RjD-n1VfXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+fqJe5_H80xwimsjueVCEwxbNa2sVQCAg=RjD-n1VfXA@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 03, 2019 at 01:04:53PM -0600, Rob Herring wrote:
> On Wed, Jul 3, 2019 at 3:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Now that the examples are validated, the examples in the SID binding
> > generates an error since the node names aren't one of the valid ones.
> >
> > Let's switch for one that is ok.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml    | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Seems this one has been missed for 5.3, so I've applied it.

Rob
