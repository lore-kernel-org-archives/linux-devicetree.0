From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Wed, 20 Jan 2016 10:07:13 +0100
Message-ID: <2538302.jXP5WXojXY@wuerfel>
References: <4405270.vcz87Q878u@wuerfel>
 <Pine.LNX.4.44L0.1601191009190.1727-100000@iolanthe.rowland.org>
 <20160120034839.GA16222@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160120034839.GA16222@shlinux2>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, stillcompiling@gmail.com, pawel.moll@arm.com, valentin.longchamp@keymile.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de, linux-usb@vger.kernel.org, balbi@ti.com, robh+dt@kernel.org, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@freescale.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 20 January 2016 11:48:39 Peter Chen wrote:
> > 
> > > Alternatively, you could use one of the high bits of the 'reg' value
> > > to indicate which root hub is used. I'm sure that would work as
> > > well, but be less obvious.
> > 
> > It's probably best to stick with the same numbering that the hardware 
> > uses.
> 
> Seems we are talking about root hub, not the device in the
> root hub. So for multiple ports controller, we have to own node for 
> root hub. Assume your example, there is a genesys HUB at physical
> port 1, I suggest a dts node description like below, please correct
> me if anything wrong.
> 
> &usb1 {
>         roothub_1: nxp@1 {
>                 compatible = "usb15a2,007d";
>                 reg = <0x01>;
> 
>                 hub: genesys@1 {
>                         compatible = "usb05e3,0608";
>                         reg = <0x01>;
>                 };
>         };
> 
>         roothub_2: nxp@2 {
>                 compatible = "usb15a2,007d";
>                 reg = <0x02>;
>         };
> 
>         ...
> 
>         roothub_7: nxp@7 {
>                 compatible = "usb15a2,007d";
>                 reg = <0x07>;
> 
>                 hub: genesys@1 {
>                         compatible = "usb05e3,0608";
>                         reg = <0x01>;
>                 };
>         };
> 
>         ...
> 
>         roothub_9: nxp@9 {
>                 compatible = "usb15a2,007d";
>                 reg = <0x09>;
>         };
> };

This looks wrong to me: if I understand it right, you are now modeling
each port of the root hub as a separate hub, so you end up with
a total of 11 hub nodes when there should only be one or two.

	Arnd
