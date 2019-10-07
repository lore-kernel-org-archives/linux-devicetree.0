From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v2 2/7] iio: adc: max1027: Make it optional to use
 interrupts
Date: Mon, 7 Oct 2019 12:44:43 +0100
Message-ID: <20191007124443.00006082@huawei.com>
References: <20191003173401.16343-1-miquel.raynal@bootlin.com>
        <20191003173401.16343-3-miquel.raynal@bootlin.com>
        <20191006111837.33fdfe25@archlinux>
        <20191007120122.6d41532f@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007120122.6d41532f@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, 7 Oct 2019 12:01:22 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Jonathan,
> 
> Jonathan Cameron <jic23@kernel.org> wrote on Sun, 6 Oct 2019 11:18:37
> +0100:
> 
> > On Thu,  3 Oct 2019 19:33:56 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > The chip has a 'start conversion' and a 'end of conversion' pair of
> > > pins. They can be used but this is absolutely not mandatory as regular
> > > polling of the value is totally fine with the current internal
> > > clocking setup. Turn the interrupts optional and do not error out if
> > > they are not inquired in the device tree. This has the effect to
> > > prevent triggered buffers use though.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>    
> > 
> > Hmm. I haven't looked a this in a great deal of depth but if we support
> > single channel reads it should be possible to allow the use of a
> > trigger from elsewhere.  Looks like a fair bit of new code would be needed
> > to support that though.  So perhaps this is a good first step.
> > 
> > It's a bit annoying that the hardware doesn't provide a EOC bit
> > anywhere in the registers.  That would have allowed us to be a bit
> > cleverer.  
> 
> I totally agree. Actually, this chip does not support any 'register
> read', the only things we can read are measures (temperature/voltages).

Ah. Good point.  Shall we polled reading of channels which is what
I meant ;)

Jonathan

> 
> 
> Thanks,
> Miquèl
