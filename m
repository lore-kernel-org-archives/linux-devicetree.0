From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V4 5/5] dt-bindings: iio: adc: Add buffered input
 property
Date: Wed, 26 Jun 2019 20:34:38 +0100
Message-ID: <20190626203438.59019143@archlinux>
References: <20190625081128.22190-1-mircea.caprioru@analog.com>
        <20190625081128.22190-5-mircea.caprioru@analog.com>
        <CAL_Jsq+ryELXJNdzZBxzCfMQnMdeGr_xC+ABJ3wGx2tZum6AwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+ryELXJNdzZBxzCfMQnMdeGr_xC+ABJ3wGx2tZum6AwA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mircea Caprioru <mircea.caprioru@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Jun 2019 08:45:01 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Tue, Jun 25, 2019 at 2:12 AM Mircea Caprioru
> <mircea.caprioru@analog.com> wrote:
> >
> > This patch adds the buffered mode device tree property for positive and
> > negative inputs. Each option can be enabled independently.
> >
> > In buffered mode, the input channel feeds into a high impedance input stage
> > of the buffer amplifier. Therefore, the input can tolerate significant
> > source impedances and is tailored for direct connection to external
> > resistive type sensors such as strain gages or RTDs.
> >
> > Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> > ---
> >
> > Changelog v3:
> > - added this separate commit for adi,buffered-positive and negative
> >   properties
> >
> > Changelog v4:
> > - nothing changed here
> >
> >  .../devicetree/bindings/iio/adc/adi,ad7124.yaml       | 11 +++++++++++
> >  1 file changed, 11 insertions(+)  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing.

thanks,

Jonathan
