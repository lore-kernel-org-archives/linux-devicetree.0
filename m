From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 0/3] Odroid c1+ usb fixs
Date: Wed, 6 Feb 2019 01:23:18 +0530
Message-ID: <CANAwSgT1eej_U+CAB=Dp+TyYYdYw9WfCKg5FuLAZEx6t3VoDxQ@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <CAFBinCC1xjqogcLm94gu+iLS_b_zB8eNEXL+4bYhog==zN0S+A@mail.gmail.com>
 <CANAwSgT3tVss-hQ0jYzTaSvkfVkSQZtiRFhdq1KmUSL4idZmLw@mail.gmail.com>
 <CAFBinCDj0jA9dT72J8RvfJtyL3bBKTy+PaRsHXukvTuKitaXqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCDj0jA9dT72J8RvfJtyL3bBKTy+PaRsHXukvTuKitaXqg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Martin,

On Tue, 5 Feb 2019 at 02:08, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Mon, Feb 4, 2019 at 9:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > I dont have multi-meter to check this out on old and new kernel.
> > As per my observation Amlogic 3.10 (32 bit) and 3.14 (64 bit)
> > both use some state machine the tune the usb port.
> >
> > It's not clear that this will work with upstream kernel.
> do you have a filename / line number in Amlogic's kernel regarding
> this state machine and / or tuning logic?
>
> > I just checked with board booted with usb device connected we are observing
> > the bus and is getting power up and hot plugging of usb device is working fine.
> >
> > $ lsusb -v|egrep "^Bus|MaxPower"
> > Couldn't open device, some information will be missing
> > Bus 002 Device 003: ID 1b71:0056 Fushicai
> >     MaxPower              500mA
> > Couldn't open device, some information will be missing
> > Bus 002 Device 004: ID 152d:0578 JMicron Technology Corp. / JMicron
> > USA Technology Corp. JMS567 SATA 6Gb/s bridge
> >     MaxPower               30mA
> > Couldn't open device, some information will be missing
> > Couldn't open device, some information will be missing
> > Bus 002 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
> >     MaxPower              100mA
> > Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Couldn't open device, some information will be missing
> >     MaxPower                0mA
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> >     MaxPower                0mA
> for me it stops at the Genesys Logic, Inc. 4-port hub (I see the root
> hub, the 4-port hub and then nothing more) using the mainline kernel
> (with or without your patches)
>
> I'm not sure what to do with this information though.
> currently we have no reliable way to tell if GPIOAO_5 is only for the
> OTG port (usb0) or also for the host-only port (usb1).
>

In order to enable usb debug verbose output we need to compile the
kernel with following option.

CONFIG_DYNAMIC_DEBUG=y
CONFIG_USB_DWC2_DEBUG=y
CONFIG_USB_DWC2_VERBOSE=y

to get more in sight into usb initialization and low level hand shake.
-----------------------------
[    1.796436] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
[    1.796481] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not
found, using dummy regulator
[    1.799183] dwc2 c90c0000.usb: Linked as a consumer to regulator.0
[    1.805320] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not
found, using dummy regulator
[    1.813600] dwc2 c90c0000.usb: registering common handler for irq26
[    1.814794] dwc2 c90c0000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.814803] dwc2 c90c0000.usb: Forcing mode to host
[    1.883383] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
[    1.884534] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
lpm_clock_gating=1
[    1.892435] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
[    1.899318] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
hird_threshold_en=1
[    1.907300] dwc2 c90c0000.usb: DWC OTG HCD INIT
[    1.907306] dwc2 c90c0000.usb: hcfg=00000200
[    1.907319] dwc2 c90c0000.usb: dwc2_core_init((ptrval))
[    1.907324] dwc2 c90c0000.usb: HS UTMI+ PHY selected
[    1.907330] dwc2 c90c0000.usb: Internal DMA Mode
[    1.907337] dwc2 c90c0000.usb: Host Mode
[    1.907599] dwc2 c90c0000.usb: DWC OTG Controller
[    1.911994] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 1
[    1.919060] dwc2 c90c0000.usb: irq 26, io mem 0xc90c0000
[    1.924323] dwc2 c90c0000.usb: DWC OTG HCD START
[    1.924335] dwc2 c90c0000.usb: dwc2_core_host_init((ptrval))
[    1.924342] dwc2 c90c0000.usb: Initializing HCFG.FSLSPClkSel to 00000000
[    1.924349] dwc2 c90c0000.usb: initial grxfsiz=00000800
[    1.924354] dwc2 c90c0000.usb: new grxfsiz=00000200
[    1.924360] dwc2 c90c0000.usb: initial gnptxfsiz=08000800
[    1.924365] dwc2 c90c0000.usb: new gnptxfsiz=01f40200
[    1.924370] dwc2 c90c0000.usb: initial hptxfsiz=08000000
[    1.924375] dwc2 c90c0000.usb: new hptxfsiz=01f403f4
[    1.924389] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 0
[    1.924396] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 1
[    1.924401] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 2
[    1.924406] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 3
[    1.924412] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 4
[    1.924417] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 5

Best Regards

-Anand
