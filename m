Return-Path: <robherring2@gmail.com>
Message-ID: <5b9f3f86.1c69fb81.c8019.1190@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: OF: Cut painful BNF experiments from bindings
References: <20180913074702.5724-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180913074702.5724-1-linus.walleij@linaro.org>
Date: Sun, 16 Sep 2018 22:44:07 -0500
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Kumar Gala <galak@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 13, 2018 at 09:47:02AM +0200, Linus Walleij wrote:
> In 2011 the commit bf859f84a19f
> ("gpio/dt: Refine GPIO device tree binding") introduced an
> experimental BNF notation for defining a regular grammar for
> the GPIO phandles used by different devices.
> 
> This was an interesting approach, and shows that we have long
> nutured the idea to formally verify device tree files using
> regular grammar.
> 
> Most if not all other bindings use natural language to define
> the bindings, and the recent thinking for verifying device
> tree files is to use JSON schemas in separate definitions.

The plan is json-schema will replace/incorporate all this. Of course, it 
will still have human readable prose.

> Cut the BNF business and replace it with natural language
> so that it becomes more human-readable for now.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Kumar Gala <galak@kernel.crashing.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio.txt         | 114 ++++++++++--------
>  1 file changed, 64 insertions(+), 50 deletions(-)

Otherwise, this all looks fine to me. Would be nice to get some comment 
from Grant on this given he wrote it.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
