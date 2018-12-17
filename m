From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] net: dsa: ksz9477: add I2C managed mode support
Date: Mon, 17 Dec 2018 22:11:14 +0300
Message-ID: <20181217191114.GF19692@kadam>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
 <20181217065455.GB15451@kadam>
 <CAMhs-H-MjMnS+S9v9-O2=Cz+e-6xp3ZYmDvy-VVif+fKNRaSnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <CAMhs-H-MjMnS+S9v9-O2=Cz+e-6xp3ZYmDvy-VVif+fKNRaSnw@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Woojung.Huh@microchip.com, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 07:22:51PM +0100, Sergio Paracuellos wrote:
> > > +static int ksz_i2c_write(struct ksz_device *dev, u32 reg, u8 *val,
> > > +                      unsigned int len)
> > > +{
> > > +     struct i2c_client *client = dev->priv;
> > > +     unsigned int cnt = len;
> > > +     int i = 0;
> > > +     u8 txb[4];
> > > +
> > > +     do {
> > > +             txb[i++] = (u8)(*val >> (8 * (cnt - 1)));
> >                                               ^^^^^^^
> >
> > Can "cnt" be zero from ksz_i2c_set()?  If so this loop will corrupt
> > memory.
> 
> This get and set interface seems to be introduced recently but it is
> not being used yet, so
> in this moment the answer is not. For me, there is no sense in call
> 'set' with no len. Should
> I add a check for zero len and return EINVAL just in case?
> 

Yes, please.

> > > +static int ksz_i2c_probe(struct i2c_client *client,
> > > +                      const struct i2c_device_id *id)
> > > +{
> > > +     struct ksz_device *dev;
> > > +     int ret;
> > > +
> > > +     dev = ksz_switch_alloc(&client->dev, &ksz_i2c_ops, client);
> > > +     if (!dev)
> > > +             return -ENOMEM;
> > > +
> > > +     if (client->dev.platform_data)
> > > +             dev->pdata = client->dev.platform_data;
> > > +
> > > +     i2c_set_clientdata(client, dev);
> > > +
> > > +     ret = ksz9477_switch_register(dev);
> > > +     if (ret) {
> > > +             dev_err(&client->dev, "registering switch (ret: %d)\n", ret);
> >
> >
> > free dev on this error path?
> 
> Internally all of this are using devm_* funcions, so I think is there
> is no need to free anything. Also, the
> spi managed driver for this does nothing also about this.

You're right.  My bad.  I should have looked at this.

regards,
dan carpenter
