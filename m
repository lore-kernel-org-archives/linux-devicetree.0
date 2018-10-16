From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 6/9] ASoC: dt-bindings: bcm2835-rpi: add onboard audio
 bindings
Date: Tue, 16 Oct 2018 21:26:58 +0200 (CEST)
Message-ID: <181642350.143349.1539718018593@email.1und1.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
 <20181016150228.16994-7-nsaenzjulienne@suse.de>
 <4039d99c-5e57-c9d3-3af5-bc160e1adb57@i2se.com>
 <0611161a74bf9f91471bb13bf93cd1e8cc36c7d0.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0611161a74bf9f91471bb13bf93cd1e8cc36c7d0.camel@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, gregkh@linuxfoundation.org
Cc: eric@anholt.net, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

> Nicolas Saenz Julienne <nsaenzjulienne@suse.de> hat am 16. Oktober 2018 um 18:48 geschrieben:
> 
> 
> Hi Stefan, thanks for the review,
> 
> On Tue, 2018-10-16 at 17:56 +0200, Stefan Wahren wrote:
> > Hi Nicolas,
> > 
> > Am 16.10.2018 um 17:02 schrieb Nicolas Saenz Julienne:
> > > Adds a device tree binding file for Raspberry pi's Headphones and
> > > HDMI
> > > audio output devices.
> > > 
> > > Based on raspberry's downstream kernel implementation:
> > > 
> 
> https://github.com/raspberrypi/linux/blob/rpi-4.14.y/arch/arm/boot/dts/bcm2708-rpi.dtsi
> > > 
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > > ---
> > >  .../bindings/sound/brcm,bcm2835-audio.txt         | 15
> > > +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm2835-
> > > audio.txt b/Documentation/devicetree/bindings/sound/brcm,bcm2835-
> > > audio.txt
> > > new file mode 100644
> > > index 000000000000..ee6fa085aaa9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/brcm,bcm2835-
> > > audio.txt
> > > @@ -0,0 +1,15 @@
> > > +Broadcom BCM283x audio device
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: Should be "brcm,bcm2835-audio"
> > > +- brcm,pwm-channels: number of PWM channels, they are behind RPi's
> > > Video Core
> > > +		     IV, not actual Linux PWM devices.
> > > +
> > > +Example:
> > > +
> > > +audio: audio {
> > > +	compatible = "brcm,bcm2835-audio";
> > > +	brcm,pwm-channels = <8>;
> > > +};
> > > +
> > 
> > i apologize but it seems to me that the TODO mentioned in the cover
> > letter isn't update to date anymore.
> > 
> > Phil Elwell posted an important bugfix for vchiq before [1], but only
> > the driver part has been applied yet. After applying the DT changes
> > i'm
> > not sure if it still works.
> > 
> > AFAIK the audio driver uses VCHIQ as a software interface and the
> > binding doesn't describe the real hardware.
> > 
> > Since the camera driver will be registered as a platform device [2],
> > i
> > prefer this way for the audio driver, too.
> > 
> > I'm actually working on this here [3] (currently only compile
> > tested).
> > 
> 
> Fair enough. I wasn't feeling too good about the bindings myself. I
> only went with them because I saw something similar was happening
> between "raspberrypi,bcm2835-power" and "raspberrypi,bcm2835-firmware". 
> I'll be glad to review & test your patches whenever they are ready.

i will inform you.

> 
> This makes commits 6 to 9 useless. Do you want me to send a v2? I can
> throw in an extra change Takashi suggested and update the TODO file.

You can add my

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

to patches 1 to 5. Please drop 6 to 9 from the series and add the other suggestions.

Btw please add devel@driverdev.osuosl.org to CC for V2

Thanks
Stefan

> 
> Regards,
> Nicolas
