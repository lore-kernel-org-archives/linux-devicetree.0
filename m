From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/4] nfc: pn533: add UART phy driver
Date: Sat, 20 Oct 2018 11:27:33 +0200
Message-ID: <20181020092733.GV3383@localhost>
References: <20181018144251.30028-1-poeschel@lemonage.de>
 <6CB47B97-F58D-4162-98C1-8C8C88CE2914@holtmann.org>
 <20181019085728.GA26696@lem-wkst-02.lemonage>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181019085728.GA26696@lem-wkst-02.lemonage>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 10:57:28AM +0200, Lars Poeschel wrote:
> On Thu, Oct 18, 2018 at 05:00:28PM +0200, Marcel Holtmann wrote:

> > > --- a/drivers/nfc/pn533/Kconfig
> > > +++ b/drivers/nfc/pn533/Kconfig
> > > @@ -25,3 +25,13 @@ config NFC_PN533_I2C
> > > 
> > > 	  If you choose to build a module, it'll be called pn533_i2c.
> > > 	  Say N if unsure.
> > > +
> > > +config NFC_PN532_UART
> > > +	tristate "NFC PN532 device support (UART)”
> > 
> > you are missing the "depends on SERIAL_DEV_BUS” here.
> 
> Yes, absolutely right. I missed that. I will post a follow-up.
> 
> BTW a question:
> Only enabling SERIAL_DEV_BUS did not suffice for me. I also had to
> enable SERIAL_DEV_CTRL_TTYPORT, otherwise the probe of the driver was
> not called. This seems a bit odd to me. This option seems unrelated, but
> without it, it did not work.
> 
> Should I better depend on SERIAL_DEV_CTRL_TTYPORT then ?

No, SERIAL_DEV_BUS is the correct (build-time) dependency.

In principle, your driver will work with any serdev-controller
implementation even if we currently only have one of those in the kernel
(and SERIAL_DEV_CTRL_TTYPORT therefore default to Y whenever
SERIAL_DEV_BUS is selected).

Johan
