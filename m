From: Peter Rosin <peda-SamgB31n2u5IcsJQ0EH25Q@public.gmane.org>
Subject: Re: [PATCH v6 08/24] iio: imu: inv_mpu6050: convert to use an explicit i2c mux core
Date: Tue, 19 Apr 2016 18:37:41 +0200
Message-ID: <20160419163748.9129940005__26791.0897768617$1461083903$gmane$org@mail.lysator.liu.se>
References: <1459673574-11440-1-git-send-email-peda@lysator.liu.se> <1459673574-11440-9-git-send-email-peda@lysator.liu.se> <57165593.4040700@intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57165593.4040700-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Crestez Dan Leonard <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Peter Korsgaard <peter.korsgaard-ob4gmnvZ1/cAvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mat
List-Id: devicetree@vger.kernel.org

<hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>,Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>,Tommi Rantala <tt.rantala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <B09CD200-56D1-4BE0-B567-90CC23507ED5-SamgB31n2u5IcsJQ0EH25Q@public.gmane.org>

On April 19, 2016 5:58:11 PM CEST, Crestez Dan Leonard <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On 04/03/2016 11:52 AM, Peter Rosin wrote:
> > From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> > 
> > Allocate an explicit i2c mux core to handle parent and child
> adapters
> > etc. Update the select/deselect ops to be in terms of the i2c mux
> core
> > instead of the child adapter.
> > 
> > --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
> > +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
> > @@ -136,16 +133,15 @@ static int inv_mpu_probe(struct i2c_client
> *client,
> >  		return result;
> >  
> >  	st = iio_priv(dev_get_drvdata(&client->dev));
> > -	st->mux_adapter = i2c_add_mux_adapter(client->adapter,
> > -					      &client->dev,
> > -					      client,
> > -					      0, 0, 0,
> > -					      inv_mpu6050_select_bypass,
> > -					      inv_mpu6050_deselect_bypass);
> > -	if (!st->mux_adapter) {
> > -		result = -ENODEV;
> > +	st->muxc = i2c_mux_one_adapter(client->adapter, &client->dev, 0,
> 0,
> > +				       0, 0, 0,
> > +				       inv_mpu6050_select_bypass,
> > +				       inv_mpu6050_deselect_bypass);
> > +	if (IS_ERR(st->muxc)) {
> > +		result = PTR_ERR(st->muxc);
> >  		goto out_unreg_device;
> >  	}
> > +	st->muxc->priv = client;
> 
> I just tested this patch on mpu9150 (combo mpu6050+ak8975) and I got a
> crash on probe which looks sort of like this:
> 
> [    5.565374] RIP: 0010:[<ffffffff81481aed>] [<ffffffff81481aed>]
> mutex_lock+0xd/0x30
> [    5.565374] Call Trace:
> [    5.565374]  [<ffffffff813be34c>]
> inv_mpu6050_select_bypass+0x1c/0xa0
> ...
> [    5.565374]  [<ffffffff81392141>] i2c_transfer+0x51/0x90
> ...
> [    5.565374]  [<ffffffff81392cb5>]
> i2c_smbus_read_i2c_block_data+0x45/0xd0
> [    5.565374]  [<ffffffff813bec5a>] ak8975_probe+0x14a/0x5c0
> ...
> [    5.565374]  [<ffffffff813933d8>] i2c_new_device+0x178/0x1e0
> [    5.565374]  [<ffffffff8139362d>] of_i2c_register_device+0xdd/0x1a0
> [    5.565374]  [<ffffffff8139372b>] of_i2c_register_devices+0x3b/0x60
> [    5.565374]  [<ffffffff81393e88>] i2c_register_adapter+0x178/0x410
> [    5.565374]  [<ffffffff81394203>] i2c_add_adapter+0x73/0x90
> [    5.565374]  [<ffffffff81395f3d>] i2c_mux_add_adapter+0x2ed/0x400
> [    5.565374]  [<ffffffff81396091>] i2c_mux_one_adapter+0x41/0x70
> [    5.565374]  [<ffffffff813be48a>] inv_mpu_probe+0xba/0x1a0
> 
> This happens because muxc->priv is not initialized when probing
> devices
> behind the mux as described by devicetree. This can be easily fixed by
> using muxc->dev instead of muxc->priv, or perhaps by calling
> i2c_mux_alloc, initializing priv and later doing i2c_mux_add_adapter.
> 
> These fixes are driver-specific and other drivers might experience
> similar issues. Perhaps i2c_mux_one_adapter should take void *priv
> just
> like old i2c_add_mux_adapter?
> 
> After I fix this locally the deadlock when reading from both devices
> no
> longer happens.
> 
> --
> Regards,
> Leonard

Duh. Obvious now that you point it out. Thanks for catching this!

I will just remove the i2c_mux_one_adapter interface for v7 and
have the affected drivers do i2c_mux_alloc as a separate step
(which was one of your suggested paths forward...)

Thanks again, and sorry for the inconvenience,
Peter

(Written on my phone, sorry for crappy formatting)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
