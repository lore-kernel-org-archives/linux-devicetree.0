From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 8/8] dt-bindings: Add max12xx SPI ADC series as
 trivial devices
Date: Thu, 10 Oct 2019 23:31:29 +0200
Message-ID: <20191010233129.67a1d76c@xps13>
References: <20191007132657.4190-1-miquel.raynal@bootlin.com>
        <20191007132657.4190-9-miquel.raynal@bootlin.com>
        <20191010204751.GA22206@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010204751.GA22206@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Rob Herring <robh@kernel.org> wrote on Thu, 10 Oct 2019 15:47:51 -0500:

> On Mon, Oct 07, 2019 at 03:26:57PM +0200, Miquel Raynal wrote:
> > Update the compatible list with three Maxim ADCs compatibles.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../bindings/iio/adc/max1027-adc.txt          | 28 +++++++++++++++++++
> >  .../devicetree/bindings/trivial-devices.yaml  |  6 ++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/max1027-adc.txt  
> 
> Devices are supposed to be documented in one place or the other. So 
> either make max1027-adc.txt a schema or drop it.
> 
> I'm fine either way. Obviously, trivial-devices.yaml is trivial to add 
> to, but it does leave some ambiguities. Like is an interrupt required, 
> optional or non-existent? What about power supplies? Or what are allowed 
> values for spi-max-frequency.

Rhaaa... I obviously wanted to drop the *txt file, just forgot to do
it. As the interrupts are optional I found the trivial device
description accurate enough.

Thanks,
Miquèl
