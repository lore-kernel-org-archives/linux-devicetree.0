From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 0/3] Odroid c1+ usb fixs
Date: Tue, 5 Feb 2019 01:34:07 +0530
Message-ID: <CANAwSgT3tVss-hQ0jYzTaSvkfVkSQZtiRFhdq1KmUSL4idZmLw@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <CAFBinCC1xjqogcLm94gu+iLS_b_zB8eNEXL+4bYhog==zN0S+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCC1xjqogcLm94gu+iLS_b_zB8eNEXL+4bYhog==zN0S+A@mail.gmail.com>
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

On Mon, 4 Feb 2019 at 19:21, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Wed, Jan 23, 2019 at 4:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > This is follow up on my previous patches.
> >
> > [0] https://lore.kernel.org/patchwork/patch/1031616/
> > [1] https://lore.kernel.org/patchwork/patch/1031617/
> >
> > As per Martin's suggestion and input I have tried to fix below issue.
> >
> > Fixed the phy power issue on the usb port.
> > # cat /sys/kernel/debug/regulator/regulator_summary
> >     USB_VBUS                      4    2      0 unknown  5000mV     0mA  5000mV  5000mV
> >        phy-c1108820.phy.1         2                                 0mA     0mV     0mV
> >        phy-c1108800.phy.0         2                                 0mA     0mV     0mV
> >
> > Fixed the OTG phy warning and initilizaion of usb0_phy
> > # lsusb -t
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> >         |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 480M
> >         |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
> >         |__ Port 3: Dev 4, If 1, Class=Video, Driver=uvcvideo, 480M
> >         |__ Port 3: Dev 4, If 2, Class=Audio, Driver=snd-usb-audio, 480M
> >         |__ Port 3: Dev 4, If 0, Class=Video, Driver=uvcvideo, 480M
> >         |__ Port 3: Dev 4, If 3, Class=Audio, Driver=snd-usb-audio, 480M
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
> >
> > Now hotpluing of usb device is working on odroid c1+ boards.
> unfortunately it's still not working for me :(
>
> all following descriptions are seen when looking at the PCB with the
> 40-pin connector on the bottom, USB ports on the left, micro USB
> connector on the top right.
>
> my test-case is:
> - power-cycle the board
> - enter u-boot command prompt
> - gset GPIOAO_5 out high (or replace high with low)
> - measure
>
> I checked the voltage at RT9715EGB (U19) with a volt meter:
> GPIOAO_5 HIGH:
> - EN pin (bottom, left): 3.3V
> - VOUT pin (top right): 5V
> GPIOAO_5 LOW:
> - EN pin (bottom, left). 0V
> - VOUT pin (top right): 5V (not sure why...)
>
> I also checked the voltage at Q5 2N7002W with a volt meter:
> - gate (bottom, right): 0V
> - source (top, right): 3.3V
> - drain (left): 0V
> this is always the same, regardless of whether GPIOAO_5 is HIGH or LOW.
> however, with Armbian booted (which uses some Amlogic 3.10 kernel
> where USB works) I get:
> - gate (bottom, right): 0V
> - source (top, right): 0V
> - drain (left): 3.3V
>
> what do you get on your board?
>
I dont have multi-meter to check this out on old and new kernel.
As per my observation Amlogic 3.10 (32 bit) and 3.14 (64 bit)
both use some state machine the tune the usb port.

It's not clear that this will work with upstream kernel.

I just checked with board booted with usb device connected we are observing
the bus and is getting power up and hot plugging of usb device is working fine.

$ lsusb -v|egrep "^Bus|MaxPower"
Couldn't open device, some information will be missing
Bus 002 Device 003: ID 1b71:0056 Fushicai
    MaxPower              500mA
Couldn't open device, some information will be missing
Bus 002 Device 004: ID 152d:0578 JMicron Technology Corp. / JMicron
USA Technology Corp. JMS567 SATA 6Gb/s bridge
    MaxPower               30mA
Couldn't open device, some information will be missing
Couldn't open device, some information will be missing
Bus 002 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
    MaxPower              100mA
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Couldn't open device, some information will be missing
    MaxPower                0mA
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    MaxPower                0mA

>
> Regards
> Martin

Best Regards

-Anand
