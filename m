From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 3/5] nfc: pn533: add UART phy driver
Date: Mon, 29 Oct 2018 12:07:04 +0100
Message-ID: <20181029110704.GQ27852@localhost>
References: <20181025132937.24405-1-poeschel@lemonage.de>
 <20181025132937.24405-3-poeschel@lemonage.de>
 <20181028102725.GL27852@localhost>
 <20181029100246.GA5905@lem-wkst-02.lemonage>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181029100246.GA5905@lem-wkst-02.lemonage>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2018 at 11:02:46AM +0100, Lars Poeschel wrote:
> Hi Johan,
> 
> thank you very much for the review!
> 
> On Sun, Oct 28, 2018 at 11:27:25AM +0100, Johan Hovold wrote:
> > On Thu, Oct 25, 2018 at 03:29:34PM +0200, Lars Poeschel wrote:
> > > This adds the UART phy interface for the pn533 driver.
> > > The pn533 driver can be used through UART interface this way.
> > > It is implemented as a serdev device.
> > 
> > Just a few drive-by comments below.

> > > +/*
> > > + * Driver for NXP PN532 NFC Chip - UART transport layer
> > > + *
> > > + * Copyright (C) 2018 Lemonage Software GmbH
> > > + * Author: Lars Pöschel <poeschel@lemonage.de>
> > > + * All rights reserved.
> > > + */
> > 
> > > +#define VERSION "0.1"
> > 
> > We don't version kernel drivers individually, so please drop this here
> > and below.
> 
> There was a comment from Marcel about this as well and I read it as: You
> can do it, but it is not required and nobody really cares.
> I included this, because the other pn532 phy driver (i2c) is doing it
> this way, but I don't like it either, so I will drop this, as well as
> the PN532_UART_DRIVER_NAME define in the next version.

Sounds good.

> > > +static int pn532_uart_probe(struct serdev_device *serdev)
> > > +{
> > > +	struct pn532_uart_phy *pn532;
> > > +	struct pn533 *priv;
> > > +	int err;
> > > +
> > > +	err = -ENOMEM;
> > > +	pn532 = kzalloc(sizeof(*pn532), GFP_KERNEL);
> > > +	if (pn532 == NULL)
> > 
> > I'd use !pn532 here (and elsewhere).
> 
> I will change it.
> 
> > > +		goto err_exit;
> > > +
> > > +	pn532->recv_skb = alloc_skb(PN532_UART_SKB_BUFF_LEN, GFP_KERNEL);
> > > +	if (pn532->recv_skb == NULL)
> > > +		goto err_free;
> > > +
> > > +	pn532->serdev = serdev;
> > > +	priv = pn533_register_device(PN533_DEVICE_PN532,
> > > +				     PN533_NO_TYPE_B_PROTOCOLS,
> > > +				     PN533_PROTO_REQ_ACK_RESP,
> > > +				     pn532, &uart_phy_ops, NULL,
> > > +				     &pn532->serdev->dev,
> > > +				     &serdev->dev);
> > > +
> > 
> > Stray new line.
> 
> Ok.
> 
> > > +	if (IS_ERR(priv)) {
> > > +		err = PTR_ERR(priv);
> > > +		goto err_skb;
> > > +	}
> > 
> > Should you not set up your device fully before registering it? I'd
> > assume you could get callbacks from NFC core here.
> 
> I did not see any during my tests, but you are right: It feels a bit
> odd.
> The i2c driver is also requesting irqs after registering.
> The pn533_finalize_setup() has to be last.
> I could do the serdev_* stuff before, but ...
> 
> > > +
> > > +	pn532->priv = priv;
> > > +	serdev_device_set_drvdata(serdev, pn532);
> > > +	serdev_device_set_client_ops(serdev, &pn532_serdev_ops);
> > > +	err = serdev_device_open(serdev);
> > > +	if (err) {
> > > +		dev_err(&serdev->dev, "Unable to open device %s\n",
> > > +				serdev->dev.init_name);
> > 
> > dev_err will include the device name so you can drop the init_name bit.
> 
> Ok, i drop it.
> 
> > > +		goto err_unregister;
> > > +	}
> > 
> > Keeping the serial device open at all times will prevent low power
> > states on some platforms. Wouldn't it be possible to open the device
> > when the nfc interface is brought up (and during setup)?
> 
> ... that would then be contrary to this idea.

Not necessarily, that depends on what callbacks you can expect and at
what time.

> Also I don't see how to implement it with what is there today. i2c also
> does not do something similar.

But i2c doesn't have the concept of an "open" port consuming power.

> It can be done with adding some callbacks from the core (pn533.c) driver
> to it's phy drivers.

Haven't looked at it in any detail, but in general serdev driver should
only keep the port open while the device is in use.

I only noticed that nfc core has dev_up/down callbacks which looks like
they could be used for something like this.

> Wouldn't that be the scope of another later patch then ?

Possibly. We have accepted some serdev drivers already taking the lazy
approach of opening the port in probe. Depending on the driver, it may
not be too bad (e.g. for some specific hardware which you know you'll
always use), but it not really nice to have everyone pay a price in
terms of power-consumption for a feature that is rarely used.

Johan
