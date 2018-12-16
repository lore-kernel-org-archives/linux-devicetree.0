From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 1/2] net: dsa: ksz9477: add I2C managed mode support
Date: Sun, 16 Dec 2018 09:35:08 +0100
Message-ID: <CAMhs-H_5=+AKtnMZ-89pV04WZ46kEkhOX8bmuC-uD5YRY+xW3g@mail.gmail.com>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com> <20181216081542.GB18287@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181216081542.GB18287@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: andrew@lunn.ch
Cc: Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, driverdev-devel@linuxdriverproject.org, davem@davemloft.net, netdev@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 16, 2018 at 9:15 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Dec 16, 2018 at 08:57:40AM +0100, Sergio Paracuellos wrote:
> > +static int ksz_i2c_read_reg(struct i2c_client *client, u32 reg, u8 *val,
> > +                         unsigned int len)
> > +{
> > +     struct i2c_adapter *adapter = client->adapter;
> > +     struct i2c_msg msg[2];
> > +     u8 txd[2];
>

Hi Andrew,

> Hi Sergio
>
> I'm not sure that having the TX buffer on the stack is safe. If the
> i2c bus master is using DMA, you then DMA from the stack, which some
> architectures memory models do no allow. You have to use memory which
> comes from an alloc function.
>
> > +     int ret;
> > +
> > +     txd[0] = (u8)(reg >> 8);
> > +     txd[1] = (u8)reg;
> > +
> > +     msg[0].addr = client->addr;
> > +     msg[0].flags = 0;
> > +     msg[0].len = 2;
> > +     msg[0].buf = txd;
> > +
> > +     msg[1].addr = client->addr;
> > +     msg[1].flags = I2C_M_RD;
> > +     msg[1].len = len;
> > +     msg[1].buf = val;
>
> You potentially have the same issue with val.
>

I'll change these two to to get memory from kernel allocators instead
of using the stack. Thanks for let me know this.

>     Andrew

Best regards,
    Sergio Paracuellos
