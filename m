From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: afe: add current-sense-cuicuit
 and voltage-divider
Date: Sun, 8 Apr 2018 14:40:03 -0300
Message-ID: <CAOMZO5CWjJ1WMnrFnqFC+324AqghFgCzSGasgwVkAw_YZHJBzw@mail.gmail.com>
References: <20180403153635.8228-1-peda@axentia.se> <20180403153635.8228-2-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403153635.8228-2-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Michael Hennerich <michael.hennerich@analog.com>, Phil Reid <preid@electromag.com.au>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 12:36 PM, Peter Rosin <peda@axentia.se> wrote:

> diff --git a/Documentation/devicetree/bindings/iio/afe/current-sense-circuit.txt b/Documentation/devicetree/bindings/iio/afe/current-sense-circuit.txt
> new file mode 100644
> index 000000000000..0bc7d89387c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/afe/current-sense-circuit.txt
> @@ -0,0 +1,45 @@
> +Current Sense Curcuit

s/Curcuit/Circuit

> +=====================
> +
> +When an io-channel measures the voltage over a current sense resistor,
> +the interesting mesaurement is often the current through the resistor,
> +not the voltage over it. This binding describes such a current sense
> +curcuit.

s/curcuit/circuit
