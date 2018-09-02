From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/4] iio: gyro: add device tree support for fxas21002c
Date: Sun, 2 Sep 2018 10:15:10 +0100
Message-ID: <20180902101510.01225f8d@archlinux>
References: <20180825211910.22929-1-afonsobordado@az8.co>
        <20180825211910.22929-2-afonsobordado@az8.co>
        <20180827181341.6563c0bf@archlinux>
        <060655b11b68d25fd855e9535df75db4b113a615.camel@az8.co>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <060655b11b68d25fd855e9535df75db4b113a615.camel@az8.co>
Sender: linux-kernel-owner@vger.kernel.org
To: Afonso Bordado <afonsobordado@az8.co>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 Aug 2018 07:43:53 +0100
Afonso Bordado <afonsobordado@az8.co> wrote:

> On Mon, 2018-08-27 at 18:13 +0100, Jonathan Cameron wrote:
> > On Sat, 25 Aug 2018 22:19:08 +0100
> > Afonso Bordado <afonsobordado@az8.co> wrote:
> >   
> > > This patch adds device tree support for the fxas21002c driver,
> > > including
> > > bindings.
> > > 
> > > Signed-off-by: Afonso Bordado <afonsobordado@az8.co>  
> > 
> > Now, the devicetree bindings should not reflect just what the driver
> > uses right now, but rather describe the hardware.
> > 
> > There are interrupts on there for starters that definitely want to be
> > described from the start.  Also there is a reset line that should
> > probably
> > be here from the start.
> > 
> > Potentially also the two power supplies though that's less critical
> > (nice to have though)
> > 
> > It is also an i2c and spi part though that can probably be added
> > later as
> > we can argue we are only documenting the bindings for the device in
> > i2c mode
> > for now.
> > 
> > So what is here is fine, but I think we need to describe more.
> > 
> > It's all well understood details of how it is connected so no need to
> > have tested it with a driver to be sure it will be right.
> > 
> > Jonathan  
> 
> Ok, so i'm thinking about adding both interrupts, the reset line and
> the regulators. If i say they are optional in the device tree document,
> i shouldn't need to add any more code immediately and could just
> implement support for it later right?
> 
Absolutely, as long as you are happy to keep them optional as you
add the features to the driver.

Regulators make that easy by providing stubs (as long as you don't
need to read their voltages).  Reset and interrupts will need to be
handled explicitly by the driver.

Thanks,

Jonathan
> 
