From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/2] iio: (bma400) add driver for the BMA400
Date: Sat, 12 Oct 2019 10:29:17 +0100
Message-ID: <20191012102917.7e85275f@archlinux>
References: <20191012035420.13904-1-dan@dlrobertson.com>
        <20191012035420.13904-3-dan@dlrobertson.com>
        <d6f44aea-81b9-eb5f-71e2-637246c89491@infradead.org>
        <CAHp75VeBrR0Ln5XOw5zA+JSoXM9BdoYw7p9D5c7u+2=Lfht75w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeBrR0Ln5XOw5zA+JSoXM9BdoYw7p9D5c7u+2=Lfht75w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Dan Robertson <dan@dlrobertson.com>, linux-iio <linux-iio@vger.kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, devicetree <devicetree@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, 12 Oct 2019 10:39:54 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sat, Oct 12, 2019 at 10:07 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 10/11/19 8:54 PM, Dan Robertson wrote:  
> 
> > > +config BMA400_I2C
> > > +     tristate
> > > +     depends on BMA400
> > > +     depends on I2C
> > > +     select REGMAP_I2C
> > > +  
> >
> > The bma400_i2c driver seems to use some OF interfaces.
> > Should it also depend on OF?  
> 
> Please, avoid unnecessary and strict dependencies when it's limiting
> the area of use the driver.
> The driver does not depend to OF. Why to stick with OF?
> 
> The actual change has to be done is to switch from
> 
> > #include <linux/of.h>  
> 
> to
> 
> #include <linux/mod_devicetable.h>
> 

Good point Andy.  There are numerous drivers in IIO that do the same
over enthusiastic including of linux/of.h just to get of_device_id
definition.  Would be good to clean those up to just include this
instead.

This is going to cause very little noise so if there are any new
contributors reading this it would be a nice sensible cleanup to get
started with!

Thanks,

Jonathan
