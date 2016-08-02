From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V2 RFC 6/6] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Tue, 2 Aug 2016 21:29:41 +0200 (CEST)
Message-ID: <1427745143.15570.152fe5dd-527b-4ad6-b2fd-e4b0af6bc2a9.open-xchange@email.1und1.de>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <1469559213-16160-7-git-send-email-stefan.wahren@i2se.com>
 <597f3289-91c3-7c19-8992-d6b386d50c02@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <597f3289-91c3-7c19-8992-d6b386d50c02@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, John Youn <johnyoun@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

> Stephen Warren <swarren@wwwdotorg.org> hat am 2. August 2016 um 19:19
> geschrieben:
> 
> 
> On 07/26/2016 12:53 PM, Stefan Wahren wrote:
> > The Raspberry Pi Zero is a minified version of model A+. It's
> > notable there is no PWR LED and the ACT LED is inverted.
> 
> Patches 3-6,
> Acked-by: Stephen Warren <swarren@nvidia.com>
> 
> > diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
> > b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
> 
> The following comment format is a bit strange, but I'm not sure there's 
> anything objectively better...

the idea behind that was to provide valid values for every dr_mode with minimum
effort. I see 2 alternative solutions:
  a) add different dr_mode examples to the dwc2 => doesn't work for all
platforms
  b) add comments to drivers/usb/dwc2/platform.c => harder to find

At the end the solution here is already obsolete. This patch series doesn't
contain an update for the bcm2835_defconfig which should set the following:

CONFIG_NOP_USB_XCEIV=y
CONFIG_USB_GADGET=y

After enabling these options another issue is revealed. Currently the dr_mode
for all the other bcm283x boards isn't defined, which means "otg" instead of
intended "host". But the dwc2 driver ignores this as long as CONFIG_USB_GADGET
is not defined. So we need to define the dr_mode for all bcm283x boards. In
order to avoid such massive copy & paste, we better define 3 dtsi files for each
dr_mode.  The only catch about this solution is the modes "otg" and "peripheral"
wouldn't be referenced.

I'll wait for John's feedback before sending a new version.

Stefan

> 
> > +&usb {
> > +	dr_mode = "host";
> > +	h-rx-fifo-size = <774>;
> > +	h-np-tx-fifo-size = <256>;
> > +	h-tx-fifo-size = <512>;
> > +/*
> > + * Settings for otg
> > + *
> > +	dr_mode = "otg";
> > +	h-rx-fifo-size = <774>;
> > +	h-np-tx-fifo-size = <32>;
> > +	h-tx-fifo-size = <0>;
> > +	g-np-tx-fifo-size = <16>;
> > +	g-rx-fifo-size = <256>;
> > +	g-tx-fifo-size = <256 128 128 64 64 64 32>;
> > + *
> > + * Settings for peripheral
> > + *
> > +	dr_mode = "peripheral";
> > +	h-rx-fifo-size = <774>;
> > +	h-np-tx-fifo-size = <0>;
> > +	h-tx-fifo-size = <0>;
> > +	g-np-tx-fifo-size = <16>;
> > +	g-rx-fifo-size = <256>;
> > +	g-tx-fifo-size = <256 128 128 64 64 64 32>;
> > + */
> > +};
>
