From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] phy: add inno-usb2-phy driver for hi3798cv200 SoC
Date: Wed, 25 Oct 2017 08:34:51 -0500
Message-ID: <CAL_JsqLys3CQH1edU4vi8VdiMpidDHJBbJ40uk-yeNQSvnuU8g@mail.gmail.com>
References: <1508078958-16966-1-git-send-email-shawnguo@kernel.org>
 <20171023223209.snq2xw3thjjwybmh@rob-hp-laptop> <20171024064919.GD6403@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171024064919.GD6403@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 24, 2017 at 1:49 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Oct 23, 2017 at 05:32:09PM -0500, Rob Herring wrote:
>> On Sun, Oct 15, 2017 at 10:49:18PM +0800, Shawn Guo wrote:
>> > From: Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> >
>> > It adds inno-usb2-phy driver for hi3798cv200 SoC USB 2.0 support.  One
>> > inno-usb2-phy device can support up to two PHY ports.  While there is
>> > device level reference clock and power reset to be controlled, each PHY
>> > port has its own utmi reset that needs to assert/de-assert as needed.
>> >
>> > Hi3798cv200 needs to access PHY port0 register via particular peripheral
>> > syscon controller register to control PHY, like turning on PHY clock.
>> >
>> > Signed-off-by: Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> > Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt |  31 +++
>> >  drivers/phy/hisilicon/Kconfig                      |  10 +
>> >  drivers/phy/hisilicon/Makefile                     |   1 +
>> >  drivers/phy/hisilicon/phy-hisi-inno-usb2.c         | 223 +++++++++++++++++++++
>> >  4 files changed, 265 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
>> >  create mode 100644 drivers/phy/hisilicon/phy-hisi-inno-usb2.c
>> >
>> > diff --git a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
>> > new file mode 100644
>> > index 000000000000..4ef7af24a703
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
>> > @@ -0,0 +1,31 @@
>> > +HiSilicon INNO USB2 PHY
>> > +
>> > +Required properties:
>> > +- compatible: Should be one of the following strings:
>> > +   "hisilicon,inno-usb2-phy",
>> > +   "hisilicon,hi3798cv200-usb2-phy".
>> > +- #phy-cells: Should be 1. The specifier is the index of the PHY port to
>> > +  reference.
>> > +- hisilicon,peripheral-syscon: The phandle of syscon used to control PHY,
>> > +  followed by a integer cell which defines the syscon register offset used
>> > +  to talk to PHY.
>>
>> Same comments as combophy.
>
> If we agree that having the phy being child node gets us obvious
> benefits, I would be happy to change them all.
>
>> > +- clocks: The phandle and clock specifier pair for reference clock utmi_refclk.
>>
>> 'clk' part of the name is redundant.
>
> Are you talking about the text utmi_refclk?  It's not something we put
> into 'clock-names' property, but just a text to tell what the clock is.

Sorry, NM. -ETOOMANYREVIEWS

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
