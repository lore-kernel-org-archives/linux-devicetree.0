From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: afe: add current-sense-shunt
 and voltage-divider
Date: Fri, 13 Apr 2018 16:42:04 -0500
Message-ID: <20180413214204.6msvqb4sk3uaeiq3@rob-hp-laptop>
References: <20180410152802.30958-1-peda@axentia.se>
 <20180410152802.30958-2-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180410152802.30958-2-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Andrew F . Davis" <afd@ti.com>, Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 10, 2018 at 05:28:01PM +0200, Peter Rosin wrote:
> An ADC is often used to measure other quantities indirectly. These
> bindings describe two cases, a current through a shunt resistor, and
> a "big" voltage measured with the help of a voltage divider.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../bindings/iio/afe/current-sense-shunt.txt       | 41 ++++++++++++++++++++
>  .../bindings/iio/afe/voltage-divider.txt           | 45 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++++
>  3 files changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/afe/current-sense-shunt.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/afe/voltage-divider.txt

Reviewed-by: Rob Herring <robh@kernel.org>
