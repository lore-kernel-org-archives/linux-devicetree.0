From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v4 4/6] nfc: pn533: add UART phy driver
Date: Wed, 5 Dec 2018 16:29:52 +0100
Message-ID: <20181205152952.GK15689@localhost>
References: <20181101100216.613-1-poeschel@lemonage.de>
 <20181101100216.613-4-poeschel@lemonage.de>
 <20181114153517.GB19900@localhost>
 <20181203142622.GA8057@lem-wkst-02.lemonage>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203142622.GA8057@lem-wkst-02.lemonage>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 03:26:22PM +0100, Lars Poeschel wrote:
> On Wed, Nov 14, 2018 at 04:35:17PM +0100, Johan Hovold wrote:
> > On Thu, Nov 01, 2018 at 11:02:12AM +0100, Lars Poeschel wrote:
> > > This adds the UART phy interface for the pn533 driver.
> > > The pn533 driver can be used through UART interface this way.
> > > It is implemented as a serdev device.
> > > 
> > > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > 
> > Please make sure to include reviewers on CC.
> 
> It's hard to do all things right, about how to correctly email patches,
> patch sets and follow ups and send what to whom.
> I am still learning. Sorry about that.

No problem, I fully understand that.

> > > +	err = serdev_device_open(serdev);
> > > +	if (err) {
> > > +		dev_err(&serdev->dev, "Unable to open device\n");
> > > +		goto err_skb;
> > > +	}
> > > +
> > > +	err = serdev_device_set_baudrate(serdev, 115200);
> > > +	if (err != 115200) {
> > > +		err = -EINVAL;
> > > +		goto err_serdev;
> > > +	}
> > > +
> > > +	serdev_device_set_flow_control(serdev, false);
> > > +	pn532->send_wakeup = PN532_SEND_WAKEUP;
> > > +	timer_setup(&pn532->cmd_timeout, pn532_cmd_timeout, 0);
> > > +	priv = pn533_register_device(PN533_DEVICE_PN532,
> > > +				     PN533_NO_TYPE_B_PROTOCOLS,
> > > +				     PN533_PROTO_REQ_ACK_RESP,
> > > +				     pn532, &uart_phy_ops, NULL,
> > > +				     &pn532->serdev->dev,
> > > +				     &serdev->dev);
> > > +	if (IS_ERR(priv)) {
> > > +		err = PTR_ERR(priv);
> > > +		goto err_serdev;
> > > +	}
> > > +
> > > +	pn532->priv = priv;
> > > +	err = pn533_finalize_setup(pn532->priv);
> > > +	if (err)
> > > +		goto err_unregister;
> > > +
> > > +	serdev_device_close(serdev);
> > 
> > This looks broken; what if the NFC interface is brought up before this
> > point? You'd get a double open, which is likely to crash things, but
> > even if you survive that, the port would not be closed despite the
> > interface being up.
> 
> I understand the problem and would like to solve it with a mutex. I will
> not have time to work on that until next year. Please be patient. I will
> send a new patchset.

I'm in no hurry here. :)

But I still think doing that setup before registering the device might
be preferred if it's possible as you wouldn't need a mutex then.

> > Can't you finalise your setup before registering the interface?
> 
> Well, propably I can do that. But I did it the way the other drivers
> (usb and i2c) are already doing and reusing the code of the pn533 core
> driver. Since their probe works very similar to mine, I suspect them to
> have the same problems.

Quite possibly.

> I can rewrite the probe for my driver, but not for the other two. I can
> not test them.
> Would you prefer that I rewrite my own _register_device and
> _finalize_setup functions, not using the ones from the core driver ?

If you add common paths that you can test using your driver I think it
should be fine to convert the others unless it ends up being really
complicated. Perhaps the authors of those driver can help out with
testing too.

> Thank you for your very valuable feedback.

You're welcome.

Johan
