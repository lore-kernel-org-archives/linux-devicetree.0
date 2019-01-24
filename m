From: Liming Sun <lsun@mellanox.com>
Subject: RE: [PATCH v4 3/4] dt-bindings: soc: Add TmFifo binding for Mellanox
 BlueField SoC
Date: Thu, 24 Jan 2019 15:07:45 +0000
Message-ID: <DB6PR05MB3223E186F175CB50D7F03A0FA19A0@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1540403734-137721-1-git-send-email-lsun@mellanox.com>
 <1540403734-137721-3-git-send-email-lsun@mellanox.com>
 <CAK8P3a1K7BjgZRyBMKFrqWfcr-Bb3HQus+QE7qTpd27voE9e0A@mail.gmail.com>
 <AM4PR05MB3220F4E5EEB673F0CC97C11DA1F00@AM4PR05MB3220.eurprd05.prod.outlook.com>
 <CAK8P3a21y1jm+1aZ8is7Rp=Re++BxL3mJM-Zj=_3c-Lq4y_Few@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a21y1jm+1aZ8is7Rp=Re++BxL3mJM-Zj=_3c-Lq4y_Few@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, David Woods <dwoods@mellanox.com>, Vadim Pasternak <vadimp@mellanox.com>, arm-soc <arm@kernel.org>, Andy Shevchenko <andy@infradead.org>, Olof Johansson <olof@lixom.net>, Darren Hart <dvhart@infradead.org>, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Arnd,

According to the emails and discussions I saw recently, I think that your comments "Finally, drivers/platform/mellanox might be a reasonable choice, and it would let you keep both sides of the driver in one place." does make more sense.

I'll try to resubmit the changes under the drivers/platform/mellanox directory.

Thanks!
Liming

> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Friday, October 26, 2018 4:34 PM
> To: Liming Sun <lsun@mellanox.com>
> Cc: Olof Johansson <olof@lixom.net>; David Woods <dwoods@mellanox.com>; Robin Murphy <robin.murphy@arm.com>; arm-soc
> <arm@kernel.org>; DTML <devicetree@vger.kernel.org>; Linux ARM <linux-arm-kernel@lists.infradead.org>
> Subject: Re: [PATCH v4 3/4] dt-bindings: soc: Add TmFifo binding for Mellanox BlueField SoC
> 
> On Fri, Oct 26, 2018 at 9:36 PM Liming Sun <lsun@mellanox.com> wrote:
> > > -----Original Message-----
> > > From: arndbergmann@gmail.com [mailto:arndbergmann@gmail.com] On
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
> > > > @@ -0,0 +1,23 @@
> > > > +* Mellanox BlueField SoC TmFifo
> > > > +
> > > > +BlueField TmFifo provides a shared FIFO between the target and the
> > > > +external host machine, which can be accessed by external host via
> > > > +USB or PCIe. In the current tmfifo driver, this FIFO has been demuxed
> > > > +to implement virtual console and network interface based on the virtio
> > > > +framework.
> > > > +
> > > > +Required properties:
> > > > +
> > > > +- compatible:      Should be "mellanox,bf-tmfifo"
> > > > +- reg:             Physical base address and length of Rx/Tx block
> > > > +- interrupts:      The interrupt number of Rx low water mark, Rx high water
> > > > mark
> > > > +           Tx low water mark, Tx high water mark respectively.
> > >
> > >
> > > This sounds like it might fit into the mailbox subsystem, and perhaps
> > > it should use the mailbox DT bindings. Have you had a look at that?
> >
> > This commit of dt-bindings is mainly to solve the warning of checkpatch.pl.
> > Like the response to patch 2/4, ACPI is actually used now instead of device tree.
> > The TMFIFO definition in the ACPI DSDT table would be something like below.
> >
> >     // RShim TMFIFO
> >     Device(RSH0) {
> >       Name(_HID, "MLNXBF01")
> >       Name(_UID, Zero)
> >       Name(_CCA, 1)
> >       Name(_CRS, ResourceTemplate() {
> >         Memory32Fixed(ReadWrite, 0x00800a20, 0x00000018)
> >         Memory32Fixed(ReadWrite, 0x00800a40, 0x00000018)
> >         Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive)
> >           { BF1_RSH0_TM_HTT_LWM_INT,
> >             BF1_RSH0_TM_HTT_HWM_INT,
> >             BF1_RSH0_TM_TTH_LWM_INT,
> >             BF1_RSH0_TM_TTH_HWM_INT
> >           }
> >       })
> >     }
> >
> > Any suggestion how it should be added into Linux Documentation, or maybe I
> > should just remove this commit from this patch series?
> 
> Maybe the best way here would be to not use ACPI for the case
> where bluefin is integrated into a PCIe endpoint, since ACPI is
> not as flexible here and generally relies on having an SBSA
> compliant hardware that you no longer have if you require
> random platform devices for booting from and for your console.
> 
> For the case where a bluefin SoC is used in a standalone system,
> having ACPI makes more sense, as that lets you install Red Hat
> Linux or other operating systems that rely on SBBR and SBSA.
> 
> > As for the sub-component of this driver, the "soc" might be better fit than the mailbox
> > for some reasons. It's a communication between extern machines and the SoC via
> > USB / PCIe,  like pushing boot stream, console and network mgmt. Some of the features,
> > like pushing boot stream, doesn't communicate with the ARM core. The boot stream
> > is pushed to the SoC HW logic directly. I'll add the host-side virtio-based driver in patch v5.
> 
> Right, the drivers/mailbox subsystem was not the right idea here,
> I noticed that myself after actually reading the driver. Drivers/soc
> may also not be the best fit, since this is not really about it being
> a SoC, but rather a way to encapsulate virtual devices. The
> mic driver I mentioned is in drivers/misc, but I don't like to add stuff
> there if we can avoid it.
> 
> drivers/virtio, drivers/bus or drivers/mfd might also be an option that
> could fit better than drivers/soc, or you could have your own subdir
> below drivers/ as some others do. Finally, drivers/platform/mellanox
> might be a reasonable choice, and it would let you keep both sides
> of the driver in one place.
> 
>        Arnd
