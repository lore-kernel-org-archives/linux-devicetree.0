From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 02/20] usb: ehci-orion: Add the optional PHY support
Date: Wed, 7 May 2014 15:56:03 +0200
Message-ID: <20140507155603.4496b9e0@free-electrons.com>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
	<1399335255-589-3-git-send-email-gregory.clement@free-electrons.com>
	<20140506133341.GE6503@lunn.ch>
	<20140507114006.466347a0@free-electrons.com>
	<20140507132150.GA23936@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140507132150.GA23936@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Wed, 7 May 2014 15:21:50 +0200, Andrew Lunn wrote:

> > Thanks to devm_phy_optional_get(), the fact of not having a PHY in the
> > DT is not considered an error. So on any error from
> > devm_phy_optional_get() (including -EPROBE_DEFER), we simply bail out.
> > Does this looks good?
> 
> Hi Thomas
> 
> That looks good.
> 
> To avoid the SATA phy problems we had last time, i would like to test
> this on a few systems. Please could you let me know what branch v4 is
> in when it is ready.

Sure. It's now up at
https://github.com/MISL-EBU-System-SW/mainline-public/tree/USB-375-38x-3.15-rc1-V4.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
