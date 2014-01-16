From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: How to support SDIO wifi/bt in DT
Date: Thu, 16 Jan 2014 22:46:26 +0100
Message-ID: <74872027.r5ouCtzAgs@wuerfel>
References: <20140116133649.GV15937@n2100.arm.linux.org.uk> <3215037.8HVCjAeS8g@wuerfel> <CAOesGMgzi5Buduo2pd0PP8CvKVir69yZ-jjX0Gbda871GiD8rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgzi5Buduo2pd0PP8CvKVir69yZ-jjX0Gbda871GiD8rg@mail.gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Thursday 16 January 2014 09:15:17 Olof Johansson wrote:
> 
> > b) We need to add a way to attach a device_node to an sdio_func,
> > so that a function driver can find additional DT properties.
> > This part should be relatively simple once (a) is done and
> > should only need a little code but no new binding. The code
> > would be similar to what we do for amba, i2c or spi devices.
> 
> This isn't actually needed for this functionality, but might be needed
> for other things...
> 

There is at least one sdio driver (cw1200) that needs to get
a MAC address from DT and has the same kind of hack that
you mention to work around it at the moment (actually worse,
it's not even using auxdata). The MAC address is certainly
a property of the device, not the host. This is of course
the same problem that we have on various development boards
with USB ethernet controllers lacking an EEPROM.

Getting the device to probe in the first place is more important,
and this is a much simpler problem though.

	Arnd
