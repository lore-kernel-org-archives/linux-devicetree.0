From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v6 0/2] Input: Add Cypress Gen5 Touchscreen driver
Date: Tue, 24 Jul 2018 15:00:46 +0200
Message-ID: <20180724150046.7d70786c@dell-desktop.home>
References: <20180703094309.18514-1-mylene.josserand@bootlin.com>
        <20180704162158.euiw2v3hyv3hzofn@penguin>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704162158.euiw2v3hyv3hzofn@penguin>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com, maxime.ripard@free-electrons.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Dmitry,

On Wed, 4 Jul 2018 16:21:58 +0000
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Hi Mylène,
> 
> On Tue, Jul 03, 2018 at 11:43:07AM +0200, Mylène Josserand wrote:
> > Hello,
> > 
> > Here is a V6 series to add the driver of the touchscreen Cypress,
> > TrueTouch Generation 5.
> > Based on v4.18-rc3.
> > 
> > This patch series has already been posted in several iterations:
> >     - v1: Sent on 2017/05/29
> >     - v2: Sent on 2017/08/18
> >     - v3: Sent on 2017/09/27
> >     - v4: Sent on 2017/12/01
> >     - v5: Sent on 2017/12/20
> > 
> > I did not have any comments the last 4 versions.
> > And no reviews on my v5 during 6 months. Could I have any updates
> > or feedback on my series to know why it is not merged (to be able to
> > correct what is wrong)?  
> 
> Sorry, I must have missed the v5, sorry about that.
> 
> I probably asked this question before, but just to make sure - I see
> references to HID in the patch - the device is really not HID
> compatible? Is there any hope it could be made work with i2c-hid +
> hid-multitouch?
> 
> Thanks.
> 

I have checked and, for what I have seen, all the HID descriptor stuff
is HID compliant. We could definitely use i2c-hid and hid-multitouch
(there is the "hid-cypress" driver that exists also).

The only problem is that this touchscreen has two modes: a bootloader
mode and an application mode (which is the one where we can send
HID commands). After a power-on-reset, it is always in "bootloader"
mode so we need to send some commands (called "bootloader commands") to
switch to application mode. These commands are not HID-compliant as the
datasheet indicates:

"Bootloader commands are not HID-over-I2C compliant."

I think that if the touchscreen would start directly in "application"
mode, we could directly use i2c-hid and hid-cypress drivers.
Unfortunately, this is not the case.

In bootloader mode, the ProductID is 0xc101 and in application mode, it
is 0xc001 (already available in hid-ids.h:
USB_DEVICE_ID_CYPRESS_TRUETOUCH but not handled)

What would be the better approach here?
Should I add a new product ID to detect the bootloader mode in
hid-cypress driver and send non-HID commands to switch to
"application" mode in this driver?
Anyway, I guess that I will drop this cyttsp5 driver and update the
existing one, right?

Let me know what you think about it.

Thank you in advance,

Best regards,

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
