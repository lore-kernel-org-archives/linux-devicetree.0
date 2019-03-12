Return-Path: <SRS0=M1Lg=RP=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Mar 2019 10:37:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: adc128d818: Fix value read from Device Tree
Message-ID: <20190312173704.GA18161@roeck-us.net>
References: <FR1P152MB28554B3FC5B4F6303019337993490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
 <20190312152658.GA11644@roeck-us.net>
 <FR1P152MB2855A1DEBC01147732B69EC893490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FR1P152MB2855A1DEBC01147732B69EC893490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
To: Carlos Menin <carlos.menin@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 12, 2019 at 05:10:48PM +0000, Carlos Menin wrote:
> On Tue, Mar 12, 2019 at 08:26:58AM -0700, Guenter Roeck wrote:
> > On Tue, Mar 12, 2019 at 01:14:39PM +0000, Carlos Menin wrote:
> > > Cells in DT are 32-bits in size. of_property_read_u8() does not work
> > > properly as it returns incorrect values in little-endian architectures.
> > > Fix it by using of_property_read_u32() instead.
> > > 
> > Are you saying that pretty much all callers of of_property_read_u8()
> > have this problem ? I would not rule that out, but it seems hard to
> > believe.
> > 
> > Guenter
> > 
> 
> Hi Guenter,
> 
> Yes, unless the DT entry specifies the cell size with '/bits/ 8' prefix.
> Not many drivers calls of_property_read_u8() function, almost all of
> them have this prefix in their binding examples, this being one of the
> exceptions. The fix could be a change in the documentation instead, if
> that is preferred.
> 

Yes, I would very much prefer that.

Guenter

> Carlos
> 
> > > Signed-off-by: Carlos Menin <carlos.menin@outlook.com>
> > > ---
> > >  drivers/hwmon/adc128d818.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> > > index ca794bf..b5eb3c0 100644
> > > --- a/drivers/hwmon/adc128d818.c
> > > +++ b/drivers/hwmon/adc128d818.c
> > > @@ -70,7 +70,7 @@ struct adc128_data {
> > >  	struct regulator *regulator;
> > >  	int vref;		/* Reference voltage in mV */
> > >  	struct mutex update_lock;
> > > -	u8 mode;		/* Operation mode */
> > > +	u32 mode;		/* Operation mode */
> > >  	bool valid;		/* true if following fields are valid */
> > >  	unsigned long last_updated;	/* In jiffies */
> > >  
> > > @@ -467,7 +467,7 @@ static int adc128_probe(struct i2c_client *client,
> > >  	}
> > >  
> > >  	/* Operation mode is optional. If unspecified, keep current mode */
> > > -	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
> > > +	if (of_property_read_u32(dev->of_node, "ti,mode", &data->mode) == 0) {
> > >  		if (data->mode > 3) {
> > >  			dev_err(dev, "invalid operation mode %d\n",
> > >  				data->mode);
> > > -- 
> > > 2.7.4
> > > 
