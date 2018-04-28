From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: iio: afe: add binding for
 current-sense-amplifier
Date: Sat, 28 Apr 2018 18:02:26 +0100
Message-ID: <20180428180226.66ca35ae@archlinux>
References: <20180423210809.29586-1-peda@axentia.se>
        <20180423210809.29586-4-peda@axentia.se>
        <20180427143025.v2pbl6ejikjhsoyh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427143025.v2pbl6ejikjhsoyh@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Andrew F . Davis" <afd@ti.com>, Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 27 Apr 2018 09:30:25 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, Apr 23, 2018 at 11:08:08PM +0200, Peter Rosin wrote:
> > Similar to current sense shunts, but an amplifier enables the use
> > of a smaller sense resistance.
> > 
> > Signed-off-by: Peter Rosin <peda@axentia.se>
> > ---
> >  .../bindings/iio/afe/current-sense-amplifier.txt   | 26 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.txt  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
Applied

Thanks,

Jonathan
