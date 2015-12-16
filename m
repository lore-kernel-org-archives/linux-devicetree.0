From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 2/3] doc: dt-binding: generic onboard USB HUB
Date: Wed, 16 Dec 2015 10:46:32 +0800
Message-ID: <20151216024631.GA23482@shlinux2>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
 <20151209032403.GA3716@rob-hp-laptop>
 <20151209081223.GB941@shlinux2> <4048406.zTEffj2eJ2@wuerfel>
 <CAPDyKFrj_eMNXdBPi25cE0VcO8OQp=NspG8yT+EfSFsbOebuwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAPDyKFrj_eMNXdBPi25cE0VcO8OQp=NspG8yT+EfSFsbOebuwg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, patryk@kowalczyk.ws, Alan Stern <stern@rowland.harvard.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 09:21:09PM +0100, Ulf Hansson wrote:
> On 9 December 2015 at 09:55, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wednesday 09 December 2015 16:12:24 Peter Chen wrote:
> >> On Tue, Dec 08, 2015 at 09:24:03PM -0600, Rob Herring wrote:
> >> > On Tue, Dec 08, 2015 at 10:58:48AM +0100, Arnd Bergmann wrote:
> >> > > On Tuesday 08 December 2015 10:50:49 Philipp Zabel wrote:
> >> > > > This something we don't have to define ad-hoc. The hub hangs off an USB
> >> > > > controller, right? The "Open Firmware recommended practice: USB"
> >> > > > document already describes how to represent USB devices in a generic
> >> > > > manner:
> >> > > > http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> >> > > >
> >> > > > Is there a reason not to reuse this?
> >> > > >
> >> > > > The usb hub node would be a child of the usb controller node, and it
> >> > > > could use
> >> > > >         compatible = "usb,class9"; /* bDeviceClass 9 (Hub) */
> >> > >
> >> > > Good point, I had not thought of that when I looked at the patches.
> >> > >
> >> > > Yes, let's do this way. I don't know if we ever implemented the simple
> >> > > patch to associate a USB device with a device_node, but if not, then
> >> > > let's do it now for this driver. A lot of people have asked for it in
> >> > > the past.
> >> >
> >> > Agreed. Also, some hubs have I2C buses as well, but I still think under
> >> > the USB bus is the right place.
> >> >
> >> > However, one complication here is often (probably this case) these
> >> > addtional signals need to be controlled before the device enumerates.
> >> >
> >>
> >> Yes, I did not find a way to let the USB bus code handle it, so I had to
> >> write a platform driver to do it
> >
> > Looping in Ulf, he solved the same problem for SDIO devices recently,
> > and probably remembers the details best.
> >
> 
> Thanks Arnd!
> 
> Yes, that was a kind of a long outstanding issue we have had for SDIO devices.
> 
> Several generic attempts was made to have a framework/library
> available to support so called "power sequences" for exactly the same
> reasons as above.
> Others and myself failed to get those attempts accepted.
> 
> Instead, I invented a mmc subsystem specific DT based solution, the
> "mmc-pwrseq".
> 
> DT documentation:
> Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
> Documentation/devicetree/bindings/mmc/mmc.txt
> 
> Long story short: The mmc host device may contain a phandle to a
> mmc-pwrseq, which will describe the resources needed to power on/off
> the SDIO card.
> 
> The code is available at:
> drivers/mmc/core/pwrseq*
> 
> We didn't implement this as platform driver, but that was mostly
> because I initially wanted things to be simple. Although, nothing
> prevents us from converting to this as a follow up, which would make
> the solution a bit less "hacky".
> 

Thanks for your information, Ulf.

-- 

Best Regards,
Peter Chen
