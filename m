From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5] iio: proximity: Add driver support for ST's VL53L0X
 ToF ranging sensor.
Date: Sat, 22 Sep 2018 16:24:37 +0100
Message-ID: <20180922162437.224e574c@archlinux>
References: <20180915095752.8116-1-songqiang.1304521@gmail.com>
        <20180917061933.GA15262@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917061933.GA15262@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Song Qiang <songqiang1304521@gmail.com>, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, andriy.shevchenko@linux.intel.com, matt.ranostay@konsulko.com, tglx@linutronix.de, ak@it-klinger.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, himanshujha199640@gmail.com, Song Qiang <songqiang.1304521@gmail.com>
List-Id: devicetree@vger.kernel.org

...
> > 
> >  .../bindings/iio/proximity/vl53l0x.txt        |  12 ++
> >  MAINTAINERS                                   |   7 +  
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Hi Song,

Please make sure to pick up the various Acks, Reviewed-bys etc for later versions.

I've added this to the version I applied.

Thanks,

Jonathan
> 
> >  drivers/iio/proximity/Kconfig                 |  11 ++
> >  drivers/iio/proximity/Makefile                |   2 +
> >  drivers/iio/proximity/vl53l0x-i2c.c           | 180 ++++++++++++++++++
> >  5 files changed, 212 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/proximity/vl53l0x.txt
> >  create mode 100644 drivers/iio/proximity/vl53l0x-i2c.c  
