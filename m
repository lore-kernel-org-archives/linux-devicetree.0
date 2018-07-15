From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 3/3] iio: hx711: fix spurious unit-address in example
Date: Sun, 15 Jul 2018 09:39:31 +0100
Message-ID: <20180715093931.67a4d6e1@archlinux>
References: <20180710181937.GA5398@arbeit>
        <20180711135432.GA16230@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711135432.GA16230@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linus.walleij@linaro.org, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Jul 2018 07:54:32 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, Jul 10, 2018 at 08:19:37PM +0200, Andreas Klinger wrote:
> > Device tree compiler (dtc) gives a warning if a device node has "@" with a
> > following number as it's name but no reg property.
> > 
> > Fix the example in the documentation of avia,hx711 to conform to dtc
> > behavior.
> > 
> > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/avia-hx711.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied, thanks.

Jonathan
