From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 3/5] nfc: pn533: add UART phy driver
Date: Mon, 29 Oct 2018 17:13:28 +0100
Message-ID: <20181029161328.GT27852@localhost>
References: <20181025132937.24405-1-poeschel@lemonage.de>
 <20181025132937.24405-3-poeschel@lemonage.de>
 <20181028102725.GL27852@localhost>
 <20181029100246.GA5905@lem-wkst-02.lemonage>
 <20181029110704.GQ27852@localhost>
 <20181029155110.GA12914@lem-wkst-02.lemonage>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181029155110.GA12914@lem-wkst-02.lemonage>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2018 at 04:51:10PM +0100, Lars Poeschel wrote:
> On Mon, Oct 29, 2018 at 12:07:04PM +0100, Johan Hovold wrote:

> > > Wouldn't that be the scope of another later patch then ?
> > 
> > Possibly. We have accepted some serdev drivers already taking the lazy
> > approach of opening the port in probe. Depending on the driver, it may
> > not be too bad (e.g. for some specific hardware which you know you'll
> > always use), but it not really nice to have everyone pay a price in
> > terms of power-consumption for a feature that is rarely used.
> 
> Is there a way in serdev to close a port, but still occupy it ?
> I'd like to do the basic chip initialisation in _probe and then close
> the port for power-consuption reasons. I'd like to have the port still
> occupied, so that it's not available to other possible users in the
> meantime. I'd then do a serdev open again in dev_up and really use it
> from there.
> dev_down is then for serdev close and also still occupy it.
> closing and releasing would then be done in _remove.

The serdev device is bound you driver regardless of whether you open the
port or not, so just use serdev_device_open() and serdev_device_close()
as necessary at probe() if you need to do some setup and then later at
dev_up() and dev_down(), respectively.

Johan
