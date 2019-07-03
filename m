MIME-Version: 1.0
Date: Wed, 3 Jul 2019 13:04:53 -0600
References: <20190703095421.11798-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095421.11798-1-maxime.ripard@bootlin.com>
Message-ID: <CAL_Jsq+fqJe5_H80xwimsjueVCEwxbNa2sVQCAg=RjD-n1VfXA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: nvmem: SID: Fix the examples node names
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 3, 2019 at 3:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Now that the examples are validated, the examples in the SID binding
> generates an error since the node names aren't one of the valid ones.
>
> Let's switch for one that is ok.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
