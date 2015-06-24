From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH] usb: ci_hdrc_imx: add optional hub clock
Date: Wed, 24 Jun 2015 18:27:10 +0200
Message-ID: <558ADA5E.3070902@maciej.szmigiero.name>
References: <5586EC36.1070403@maciej.szmigiero.name> <20150623025534.GA15147@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150623025534.GA15147@shlinux2>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: USB list <linux-usb@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Pargmann <mpa@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
List-Id: devicetree@vger.kernel.org

Hi Peter,

W dniu 23.06.2015 04:55, Peter Chen pisze:
> On Mon, Jun 22, 2015 at 12:54:14AM +0800, Maciej S. Szmigiero wrote:
>> This patch adds ability to define optional clock of connected
>> USB hub to ChipIdea i.MX usb controller driver.
>>
>> This is needed for example for UDOO board.
>> Previously, this board DT file used a fact that non-core registers
>> of this USB controller have a separate driver (usbmisc_imx) which
>> did allow defining a separate clock.
>>
>> Because the non-core registers are in fact using the same clock as
>> main controller this allowed to use one of such clock definitions
>> to enable USB hub clock instead.
>>
>> However, since commit 73dea4a912b2
>> ("usb: chipidea: usbmisc_imx: delete clock information") this
>> possibility no longer exists and loading USB support on this board
>> results in a hard SoC lockup.
>>
>> Note that this is not specific to particular USB hub chip used,
>> rather than to a particular board.
>> Since this is a DT-based board there is no board platform file to
>> put such clock enable.
>> Also, USB bus devices aren't instantiated in DT file since it is an
>> enumerable bus.
>>
>> NOP PHY also can't be used as clock consumer since this
>> USB controller needs a true MXS phy definition, which accepts only
>> one clock (different from USB controller one).
>>
>> Based on a patch previously submitted by Fabio Estevam, with consent.
>>
>> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
>>
(..)
> Hi Maciej,
> 
> As I said before, the USB HUB is just an USB peripheral, we should
> not put a peripheral's clock information to controller driver, I think
> hub driver should take responsibilities for it, just like other usb
> pheripheral drivers, like usb modem, etc. You can talk it with Alan
> Stern about it.

I understand you position, but there is a problem with this solution
that USB devices - including hubs - as devices on an enumerable bus
don't have DT bindings to put such clock handle in,
since they are instantiated by their bus scanning code. 

If such devices would be added to DT at least there would be need to
somehow match the discovered device with its DT counterpart.
In case of USB this would need address like controller X,
port x (or port x,y,z in case of multiple hubs in between controller
and device).

As far I see there is nothing like this in USB core yet.

Of course, there is still possibly to add something like a generic
OF USB hub driver which will take care of configuring extra clocks,
pins, GPIOs, etc. but which will be otherwise unrelated to normal
USB hub driver.

Best regards,
Maciej Szmigiero
