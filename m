From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 0/2] Input: Add Cypress Gen5 Touchscreen driver
Date: Tue, 24 Jul 2018 10:40:53 -0700
Message-ID: <20180724174053.GA61165@dtor-ws>
References: <20180703094309.18514-1-mylene.josserand@bootlin.com>
 <20180704162158.euiw2v3hyv3hzofn@penguin>
 <20180724150046.7d70786c@dell-desktop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724150046.7d70786c@dell-desktop.home>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com, maxime.ripard@free-electrons.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mylène,

On Tue, Jul 24, 2018 at 03:00:46PM +0200, Mylène Josserand wrote:
> Hello Dmitry,
> 
> On Wed, 4 Jul 2018 16:21:58 +0000
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > Hi Mylène,
> > 
> > On Tue, Jul 03, 2018 at 11:43:07AM +0200, Mylène Josserand wrote:
> > > Hello,
> > > 
> > > Here is a V6 series to add the driver of the touchscreen Cypress,
> > > TrueTouch Generation 5.
> > > Based on v4.18-rc3.
> > > 
> > > This patch series has already been posted in several iterations:
> > >     - v1: Sent on 2017/05/29
> > >     - v2: Sent on 2017/08/18
> > >     - v3: Sent on 2017/09/27
> > >     - v4: Sent on 2017/12/01
> > >     - v5: Sent on 2017/12/20
> > > 
> > > I did not have any comments the last 4 versions.
> > > And no reviews on my v5 during 6 months. Could I have any updates
> > > or feedback on my series to know why it is not merged (to be able to
> > > correct what is wrong)?  
> > 
> > Sorry, I must have missed the v5, sorry about that.
> > 
> > I probably asked this question before, but just to make sure - I see
> > references to HID in the patch - the device is really not HID
> > compatible? Is there any hope it could be made work with i2c-hid +
> > hid-multitouch?
> > 
> > Thanks.
> > 
> 
> I have checked and, for what I have seen, all the HID descriptor stuff
> is HID compliant. We could definitely use i2c-hid and hid-multitouch
> (there is the "hid-cypress" driver that exists also).
> 
> The only problem is that this touchscreen has two modes: a bootloader
> mode and an application mode (which is the one where we can send
> HID commands). After a power-on-reset, it is always in "bootloader"
> mode so we need to send some commands (called "bootloader commands") to
> switch to application mode.

Is this a documented or observed behavior? In my practice devices (I am
talking in general, not about Cypress) that have proper configuration
loaded and that were brought up with appropriate power up sequence and
timings automatically switch to application mode. They only end up in
bootloader mode when proper power up sequence is not respected and they
are unhappy.

> These commands are not HID-compliant as the
> datasheet indicates:
> 
> "Bootloader commands are not HID-over-I2C compliant."

Any chance you could share the datasheet?

> 
> I think that if the touchscreen would start directly in "application"
> mode, we could directly use i2c-hid and hid-cypress drivers.
> Unfortunately, this is not the case.
> 
> In bootloader mode, the ProductID is 0xc101 and in application mode, it
> is 0xc001 (already available in hid-ids.h:
> USB_DEVICE_ID_CYPRESS_TRUETOUCH but not handled)
> 
> What would be the better approach here?
> Should I add a new product ID to detect the bootloader mode in
> hid-cypress driver and send non-HID commands to switch to
> "application" mode in this driver?
> Anyway, I guess that I will drop this cyttsp5 driver and update the
> existing one, right?

So it still accessible through HID, even when in bootloader mode? OK,
then I guess there are 2 options:

- if device is documented to always start in bootloader mode, you could
  have a small stub driver that switches it into application mode in its
  probe() code. The "bootloader" device will disappear and
  "application" device will appear, and standard driver (hid-multitouch)
  will bind to it.

- if device supposed to come up in application mode unless configuration
  is damaged: I'd recommend doing what we do on Chrome OS and have some
  userspace software that runs on boot (or whenever device is
  discovered) and check if it has the latest firmware/configuration, and
  repair device if needed.

Thanks.

-- 
Dmitry
