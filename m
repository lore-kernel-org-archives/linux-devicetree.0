From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC/PATCH] usb: misc: Add a driver for TC7USB40MU
Date: Wed, 14 Sep 2016 16:03:21 +0800
Message-ID: <20160914080321.GA21674@b29397-desktop>
References: <20160914014246.31847-1-stephen.boyd@linaro.org>
 <20160914033200.GE30760@b29397-desktop>
 <147383270635.1464.10706917860873291816@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <147383270635.1464.10706917860873291816@sboyd-linaro>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 10:58:26PM -0700, Stephen Boyd wrote:
> Quoting Peter Chen (2016-09-13 20:32:00)
> > On Tue, Sep 13, 2016 at 06:42:46PM -0700, Stephen Boyd wrote:
> > > On the db410c 96boards platform we have a TC7USB40MU[1] on the
> > > board to mux the D+/D- lines from the SoC between a micro usb
> > > "device" port and a USB hub for "host" roles. Upon a role switch,
> > > we need to change this mux to forward the D+/D- lines to either
> > > the port or the hub. Therefore, introduce a driver for this
> > > device that intercepts extcon USB_HOST events and logically
> > > asserts a gpio to mux the "host" D+/D- lines when a host cable is
> > > attached. When the cable goes away, it will logically deassert
> > > the gpio and mux the "device" lines.
> > 
> > Would you please draw the design? It can also help me review your
> > chipidea patch well.
> > 
> > 1. How many ports on the board?
> > 2. How the lines are connected on the board?
> > 
> 
> The schematic for the db410c is publically available here[2][3].
> 
> There's also the 96boards spec[4] which talks about this switch based
> design a little bit. See the section titled "Single USB port Example".
> 
> [2] https://github.com/96boards/documentation/blob/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf
> [3] https://github.com/96boards/documentation/raw/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf
> [4] https://www.96boards.org/wp-content/uploads/2015/02/96BoardsCESpecificationv1.0-EA1.pdf

Ok, I see several use cases for this role switch

1. Using the hardware switch (218-4LPST)
In this case, you can set USB_SW_SEL as input gpio, and use
extcon-usb-gpio.c like before, just set this gpio as active
low at dts.

2. Using USB_HS_ID as vbus-gpio (input), and USB_SW_SEL as id-gpio (output)
I can't find hardware relationship between each other, maybe I miss
something.
This use case (design) seems strange, usually, we use ID pin controls
vbus, but seldom use vbus pin control ID.
How you would like to implement it? When the USB cable is connected
(between PC), it receives vbus-gpio interrupt, then you set USB_SW_SEL
as low? If disconnected, you set USB_SW_SEL as high?
When the USB controller works at Host mode, what will happen if the user
connects USB cable at device port?

3. Using sysfs to switch the role
Set USB_SW_SEL according to "role" at debugfs

Which one you would like to implement? Or anything else I miss?

-- 

Best Regards,
Peter Chen
