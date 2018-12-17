From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 1/2] net: dsa: ksz9477: add I2C managed mode support
Date: Mon, 17 Dec 2018 19:22:51 +0100
Message-ID: <CAMhs-H-MjMnS+S9v9-O2=Cz+e-6xp3ZYmDvy-VVif+fKNRaSnw@mail.gmail.com>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com> <20181217065455.GB15451@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181217065455.GB15451@kadam>
Sender: netdev-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Woojung.Huh@microchip.com, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

Hi Dan,

Thanks for the feedback.

On Mon, Dec 17, 2018 at 7:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sun, Dec 16, 2018 at 08:57:40AM +0100, Sergio Paracuellos wrote:
> > +static int ksz_i2c_write(struct ksz_device *dev, u32 reg, u8 *val,
> > +                      unsigned int len)
> > +{
> > +     struct i2c_client *client = dev->priv;
> > +     unsigned int cnt = len;
> > +     int i = 0;
> > +     u8 txb[4];
> > +
> > +     do {
> > +             txb[i++] = (u8)(*val >> (8 * (cnt - 1)));
>                                               ^^^^^^^
>
> Can "cnt" be zero from ksz_i2c_set()?  If so this loop will corrupt
> memory.

This get and set interface seems to be introduced recently but it is
not being used yet, so
in this moment the answer is not. For me, there is no sense in call
'set' with no len. Should
I add a check for zero len and return EINVAL just in case?

>
> > +             cnt--;
> > +     } while (cnt);
> > +
> > +     return ksz_i2c_write_reg(client, reg, txb, len);
> > +}
> > +
> > +static int ksz_i2c_write8(struct ksz_device *dev, u32 reg, u8 value)
> > +{
> > +     return ksz_i2c_write(dev, reg, &value, 1);
> > +}
> > +
> > +static int ksz_i2c_write16(struct ksz_device *dev, u32 reg, u16 value)
> > +{
> > +     value = cpu_to_be16(value);
> > +     return ksz_i2c_write(dev, reg, (u8 *)&value, 2);
> > +}
> > +
> > +static int ksz_i2c_write24(struct ksz_device *dev, u32 reg, u32 value)
> > +{
> > +     /* make it to big endian 24bit from MSB */
> > +     value <<= 8;
> > +     value = cpu_to_be32(value);
> > +
> > +     return ksz_i2c_write(dev, reg, (u8 *)&value, 3);
> > +}
> > +
> > +static int ksz_i2c_write32(struct ksz_device *dev, u32 reg, u32 value)
> > +{
> > +     value = cpu_to_be32(value);
> > +     return ksz_i2c_write(dev, reg, (u8 *)&value, 4);
> > +}
> > +
> > +static int ksz_i2c_get(struct ksz_device *dev, u32 reg, void *data, size_t len)
> > +{
> > +     return ksz_i2c_read(dev, reg, data, len);
> > +}
> > +
> > +static int ksz_i2c_set(struct ksz_device *dev, u32 reg, void *data, size_t len)
> > +{
> > +     return ksz_i2c_write(dev, reg, data, len);
> > +}
> > +
> > +static const struct ksz_io_ops ksz_i2c_ops = {
> > +     .read8 = ksz_i2c_read8,
> > +     .read16 = ksz_i2c_read16,
> > +     .read24 = ksz_i2c_read24,
> > +     .read32 = ksz_i2c_read32,
> > +     .write8 = ksz_i2c_write8,
> > +     .write16 = ksz_i2c_write16,
> > +     .write24 = ksz_i2c_write24,
> > +     .write32 = ksz_i2c_write32,
> > +     .get = ksz_i2c_get,
> > +     .set = ksz_i2c_set,
> > +};
> > +
> > +static int ksz_i2c_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id)
> > +{
> > +     struct ksz_device *dev;
> > +     int ret;
> > +
> > +     dev = ksz_switch_alloc(&client->dev, &ksz_i2c_ops, client);
> > +     if (!dev)
> > +             return -ENOMEM;
> > +
> > +     if (client->dev.platform_data)
> > +             dev->pdata = client->dev.platform_data;
> > +
> > +     i2c_set_clientdata(client, dev);
> > +
> > +     ret = ksz9477_switch_register(dev);
> > +     if (ret) {
> > +             dev_err(&client->dev, "registering switch (ret: %d)\n", ret);
>
>
> free dev on this error path?

Internally all of this are using devm_* funcions, so I think is there
is no need to free anything. Also, the
spi managed driver for this does nothing also about this.

>
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>
> regards,
> dan carpenter

Best regards,
    Sergio Paracuellos
